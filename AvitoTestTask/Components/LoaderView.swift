//
//  LoaderView.swift
//  AvitoTestTask
//
//  Created by Andrew Leonov on 28.08.2023.
//

import UIKit

/// Вьюха с лоадером и заголовоком для отображения состояния загрузки
final class LoaderView: UIView {
    private lazy var activityIndicator = UIActivityIndicatorView(style: .medium)

    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = Palette.Text.secondary

        return label
    }()

    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.spacing = 24
        stackView.addArrangedSubview(activityIndicator)
        stackView.addArrangedSubview(titleLabel)

        return stackView
    }()

    init() {
        super.init(frame: .zero)
        setupView()
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    /// Устанавливает текст заголовку
    /// - Parameter title: Текст заголовка
    func configure(title: String?) {
        titleLabel.text = title
        activityIndicator.startAnimating()
    }


    // MARK: - Private methods

    private func setupView() {
        backgroundColor = Palette.Background.base

        stackView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(stackView)
        NSLayoutConstraint.activate(
            [
                stackView.centerYAnchor.constraint(equalTo: centerYAnchor),
                stackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 48),
                stackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -48)
            ]
        )
    }
}
