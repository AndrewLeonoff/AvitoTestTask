//
//  ErrorMessageView.swift
//  AvitoTestTask
//
//  Created by Andrew Leonov on 28.08.2023.
//

import UIKit

/// Вьюха с заголовоком и кнопкой для отображения ошибки
final class ErrorMessageView: UIView {
    private var onButtonTap: (() -> Void)?

    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = Palette.Text.primary

        return label
    }()

    private lazy var button: UIButton = {
        let button = UIButton(type: UIButton.ButtonType.roundedRect)
        button.configuration = .filled()
        button.tintColor = Palette.Background.info
        button.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
        return button
    }()

    private lazy var stackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.spacing = 24
        stackView.addArrangedSubview(titleLabel)
        stackView.addArrangedSubview(button)

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
    /// - Parameters:
    ///   - title: Текст заголовка
    ///   - buttonTitle: Текст кнопки
    ///   - onButtonTap: Обработчик кнопки
    func configure(title: String?, buttonTitle: String?, onButtonTap: (() -> Void)?) {
        titleLabel.text = title
        button.setTitle(buttonTitle, for: .normal)
        self.onButtonTap = onButtonTap
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

    @objc
    private final func didTapButton() {
        onButtonTap?()
    }
}
