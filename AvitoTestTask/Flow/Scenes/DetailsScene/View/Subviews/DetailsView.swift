//
//  DetailsView.swift
//  AvitoTestTask
//
//  Created by Andrew Leonov on 28.08.2023.
//

import UIKit

/// Вьюха с подробной информацией объявления
final class DetailsView: UIScrollView {
    /// Обработчик кнопки `Позвонить`
    var onCallButtonTap: (() -> Void)?

    /// Обработчик кнопки `Написать`
    var onEmailButtonTap: (() -> Void)?

    private lazy var imageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "placeholder"))
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false

        return imageView
    }()

    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 21, weight: .regular)
        label.textColor = Palette.Text.primary
        label.numberOfLines = 0

        return label
    }()

    private lazy var priceLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 21, weight: .bold)
        label.textColor = Palette.Text.primary
        label.numberOfLines = 1

        return label
    }()

    private lazy var locationLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 15, weight: .regular)
        label.textColor = Palette.Text.primary
        label.numberOfLines = 0

        return label
    }()

    private lazy var addressLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 15, weight: .regular)
        label.textColor = Palette.Text.secondary
        label.numberOfLines = 0

        return label
    }()

    private lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 15, weight: .regular)
        label.textColor = Palette.Text.primary
        label.numberOfLines = 0

        return label
    }()

    private lazy var phoneNumberButton: UIButton = {
        let button = UIButton(type: .roundedRect)
        button.setTitle("Позвонить", for: .normal)
        button.configuration = .filled()
        button.tintColor = Palette.Background.positive
        button.addTarget(self, action: #selector(didTapCallButton), for: .touchUpInside)

        return button
    }()

    private lazy var emailButton: UIButton = {
        let button = UIButton(type: .roundedRect)
        button.setTitle("Написать", for: .normal)
        button.configuration = .filled()
        button.tintColor = Palette.Background.info
        button.addTarget(self, action: #selector(didTapEmailButton), for: .touchUpInside)

        return button
    }()

    private lazy var buttonContainer: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.spacing = 12

        return stackView
    }()

    private lazy var createdDateLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 13, weight: .regular)
        label.textColor = Palette.Text.secondary
        label.numberOfLines = 1

        return label
    }()

    private lazy var container: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.translatesAutoresizingMaskIntoConstraints = false

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

    /// Обновляет вьюху
    /// - Parameter viewModel: Вью-модель для обновления
    func configure(viewModel: DetailsViewModel) {
        titleLabel.text = viewModel.title
        priceLabel.text = viewModel.price
        locationLabel.text = viewModel.location
        addressLabel.text = viewModel.address
        descriptionLabel.text = viewModel.description
        createdDateLabel.text = viewModel.createdDate
    }

    /// Устанавливает изображение
    /// - Parameter image: Изображение
    func setImage(_ image: UIImage) {
        imageView.image = image
    }

    // MARK: - Private methods

    private func setupView() {
        addSubview(imageView)
        NSLayoutConstraint.activate(
            [
                imageView.topAnchor.constraint(equalTo: topAnchor),
                imageView.leadingAnchor.constraint(equalTo: leadingAnchor),
                imageView.trailingAnchor.constraint(equalTo: trailingAnchor),
                imageView.widthAnchor.constraint(equalTo: frameLayoutGuide.widthAnchor),
                imageView.heightAnchor.constraint(equalTo: imageView.widthAnchor, multiplier: 3 / 4)
            ]
        )

        addSubview(container)
        NSLayoutConstraint.activate(
            [
                container.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 16),
                container.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
                container.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
                container.bottomAnchor.constraint(equalTo: bottomAnchor)
            ]
        )

        container.addArrangedSubview(titleLabel)
        container.setCustomSpacing(4, after: titleLabel)

        container.addArrangedSubview(priceLabel)
        container.setCustomSpacing(16, after: priceLabel)

        container.addArrangedSubview(locationLabel)

        container.addArrangedSubview(addressLabel)
        container.setCustomSpacing(16, after: addressLabel)

        container.addArrangedSubview(descriptionLabel)
        container.setCustomSpacing(16, after: descriptionLabel)

        buttonContainer.addArrangedSubview(phoneNumberButton)
        buttonContainer.addArrangedSubview(emailButton)

        container.addArrangedSubview(buttonContainer)
        container.setCustomSpacing(20, after: buttonContainer)

        container.addArrangedSubview(createdDateLabel)
    }

    @objc
    private final func didTapCallButton() {
        onCallButtonTap?()
    }

    @objc
    private final func didTapEmailButton() {
        onEmailButtonTap?()
    }
}
