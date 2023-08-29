//
//  DetailsViewController.swift
//  AvitoTestTask
//
//  Created by Andrew Leonov on 28.08.2023.
//

import UIKit

/// ViewController для работы с подробной информацией объявления
final class DetailsViewController: UIViewController {
    var state: ViewControllerState = .content {
        didSet { updateState() }
    }

    private let presenter: DetailsPresenterInput

    private weak var loaderView: LoaderView?
    private weak var errorMessageView: ErrorMessageView?

    private lazy var contentView: DetailsView = {
        let detailsView = DetailsView()
        detailsView.onCallButtonTap = { [unowned presenter] in
            presenter.didCallButtonTap()
        }
        detailsView.onEmailButtonTap = { [unowned presenter] in
            presenter.didEmailButtonTap()
        }

        return detailsView
    }()

    /// Инициализирует ViewController для работы с подробной информацией объявления
    /// - Parameter presenter: Презентер подробной информацией объявления
    init(presenter: DetailsPresenterInput) {
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
        navigationItem.title = "Объявление"
        view.backgroundColor = Palette.Background.base
        view.addSubviewAndPinToEdges(contentView)
    }

    private func updateState() {
        switch state {
        case .content:
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

// MARK: - DetailsPresenterToView

extension DetailsViewController: DetailsPresenterToView {
    func updateContent(with viewModel: DetailsViewModel) {
        contentView.configure(viewModel: viewModel)
    }

    func setImage(_ image: UIImage) {
        contentView.setImage(image)
    }

    func presentAlert(title: String?, message: String?) {
        let action = UIAlertAction(title: "OK", style: .default)
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alertController.addAction(action)

        present(alertController, animated: true)
    }
}
