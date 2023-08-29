//
//  CardCell.swift
//  AvitoTestTask
//
//  Created by Andrew Leonov on 28.08.2023.
//

import UIKit

/// Ячейка с объявлением
final class CardCell: UICollectionViewCell {
    private lazy var imageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "placeholder"))
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 8
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false

        return imageView
    }()

    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 15, weight: .regular)
        label.textColor = Palette.Text.primary
        label.numberOfLines = 2
        label.translatesAutoresizingMaskIntoConstraints = false

        return label
    }()

    private lazy var priceLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 15, weight: .bold)
        label.textColor = Palette.Text.primary
        label.numberOfLines = 1
        label.translatesAutoresizingMaskIntoConstraints = false

        return label
    }()

    private lazy var locationLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 13, weight: .regular)
        label.textColor = Palette.Text.secondary
        label.numberOfLines = 2
        label.translatesAutoresizingMaskIntoConstraints = false

        return label
    }()

    private lazy var createdDateLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 13, weight: .regular)
        label.textColor = Palette.Text.secondary
        label.numberOfLines = 1
        label.translatesAutoresizingMaskIntoConstraints = false

        return label
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        configure(viewModel: .empty)
        imageView.image = UIImage(named: "placeholder")
    }

    /// Обновляет вьюху
    /// - Parameter viewModel: Вью-модель для обновления
    func configure(viewModel: CardViewModel) {
        titleLabel.text = viewModel.title
        priceLabel.text = viewModel.price
        locationLabel.text = viewModel.location
        createdDateLabel.text = viewModel.createdDate

        guard let image = viewModel.image else { return }

        imageView.image = image
    }

    /// Устанавливает изображение
    /// - Parameter image: Изображение
    func setImage(_ image: UIImage) {
        imageView.image = image
    }

    // MARK: - Private methods

    private func setupView() {
        setupImageView()
        setupTitleLabel()
        setupPriceLabel()
        setupLocationLabel()
        setupCreatedDateLabel()
    }

    private func setupImageView() {
        contentView.addSubview(imageView)
        NSLayoutConstraint.activate(
            [
                imageView.topAnchor.constraint(equalTo: contentView.topAnchor),
                imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
                imageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
                imageView.heightAnchor.constraint(equalTo: imageView.widthAnchor)
            ]
        )
    }

    private func setupTitleLabel() {
        contentView.addSubview(titleLabel)
        NSLayoutConstraint.activate(
            [
                titleLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 4),
                titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
                titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor)
            ]
        )
    }

    private func setupPriceLabel() {
        contentView.addSubview(priceLabel)
        NSLayoutConstraint.activate(
            [
                priceLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 4),
                priceLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
                priceLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor)
            ]
        )
    }

    private func setupLocationLabel() {
        contentView.addSubview(locationLabel)
        NSLayoutConstraint.activate(
            [
                locationLabel.topAnchor.constraint(equalTo: priceLabel.bottomAnchor, constant: 4),
                locationLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
                locationLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor)
            ]
        )
    }

    private func setupCreatedDateLabel() {
        contentView.addSubview(createdDateLabel)
        NSLayoutConstraint.activate(
            [
                createdDateLabel.topAnchor.constraint(equalTo: locationLabel.bottomAnchor),
                createdDateLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
                createdDateLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
                createdDateLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
            ]
        )
    }
}
