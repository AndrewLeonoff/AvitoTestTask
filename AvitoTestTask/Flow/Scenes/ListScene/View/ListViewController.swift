//
//  ListViewController.swift
//  AvitoTestTask
//
//  Created by Andrew Leonov on 28.08.2023.
//

import UIKit

/// ViewController для работы со списком объявлений
final class ListViewController: UIViewController {
    var state: ViewControllerState = .content {
        didSet { updateState() }
    }

    private let presenter: ListPresenterInput

    private weak var loaderView: LoaderView?
    private weak var errorMessageView: ErrorMessageView?

    private lazy var collectionViewLayout: UICollectionViewCompositionalLayout = {
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(0.5),
            heightDimension: .estimated(240)
        )
        let item = NSCollectionLayoutItem(layoutSize: itemSize)

        let groupSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .estimated(240)
        )
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, repeatingSubitem: item, count: 2)
        group.interItemSpacing = .fixed(12)

        let section = NSCollectionLayoutSection(group: group)
        section.interGroupSpacing = 12
        section.contentInsets = .init(top: 16, leading: 16, bottom: 16, trailing: 16)

        let layout = UICollectionViewCompositionalLayout(section: section)

        return layout
    }()

    private lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: collectionViewLayout)
        collectionView.register(CardCell.self, forCellWithReuseIdentifier: Constants.cellIdentifier)
        collectionView.dataSource = self
        collectionView.delegate = self

        return collectionView
    }()

    /// Инициализирует ViewController для работы со списком объявлений
    /// - Parameter presenter: Презентер списка объявлений
    init(presenter: ListPresenterInput) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
        presenter.didLoad()
    }

    // MARK: - Private methods

    private func setupView() {
        navigationItem.title = "Список"
        view.backgroundColor = Palette.Background.base
        view.addSubviewAndPinToEdges(collectionView)
    }

    private func updateState() {
        switch state {
        case .content:
            collectionView.reloadData()
            loaderView?.removeFromSuperview()
            errorMessageView?.removeFromSuperview()
        case .loading(let title):
            if loaderView == nil {
                addLoaderView()
            }
            loaderView?.configure(title: title)
            errorMessageView?.removeFromSuperview()
        case let .error(title, buttonTitle):
            if errorMessageView == nil {
                addErrorMessageView()
            }
            errorMessageView?.configure(title: title, buttonTitle: buttonTitle) { [unowned presenter] in
                presenter.didUpdateButtonTap()
            }
            loaderView?.removeFromSuperview()
        }
    }

    private func addLoaderView() {
        let loaderView = LoaderView()
        view.addSubviewAndPinToEdges(loaderView)

        self.loaderView = loaderView
    }

    private func addErrorMessageView() {
        let errorMessageView = ErrorMessageView()
        view.addSubviewAndPinToEdges(errorMessageView)

        self.errorMessageView = errorMessageView
    }
}

// MARK: - ListPresenterToView

extension ListViewController: ListPresenterToView {
    func setImage(_ image: UIImage, for indexPath: IndexPath) {
        guard let cell = collectionView.cellForItem(at: indexPath) as? CardCell else { return }
        cell.setImage(image)
    }
}

// MARK: - UICollectionViewDataSource

extension ListViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        presenter.itemCount
    }

    func collectionView(
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath
    ) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: Constants.cellIdentifier, for: indexPath
        ) as? CardCell
        else {
            return UICollectionViewCell()
        }
        let viewModel = presenter.viewModels[indexPath.item]
        cell.configure(viewModel: viewModel)

        if viewModel.image == nil {
            DispatchQueue.global().async {
                self.presenter.loadImage(id: viewModel.id)
            }
        }
        return cell
    }
}

// MARK: - UICollectionViewDelegate

extension ListViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        presenter.didCardTap(indexPath: indexPath)
    }
}

// MARK: - Constants

extension ListViewController {
    enum Constants {
        static let cellIdentifier = "CardCell"
    }
}
