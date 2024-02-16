// ClubCardView.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Кастомная вью для карты
final class ClubCardView: UIView {
    // MARK: - Visual Components

    lazy var salesLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Verdana-Bold", size: 16)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "\(sale)%"
        return label
    }()

    lazy var cardNumberLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Verdana", size: 14)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "\(cardNumber)"
        return label
    }()

    lazy var logoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage.logoCard
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    lazy var qrCodeButton: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 12
        button.backgroundColor = UIColor.white.withAlphaComponent(0.1)
        button.setImage(UIImage.qrcode, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    lazy var infoButton: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 12
        button.backgroundColor = UIColor.white.withAlphaComponent(0.1)
        button.setImage(UIImage.info, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    // MARK: - Public Properties

    lazy var sale = 0 {
        didSet {
            salesLabel.text = "\(sale)%"
        }
    }

    lazy var cardNumber = 0000 {
        didSet {
            cardNumberLabel.text = "\(cardNumber)"
        }
    }

    // MARK: - Initializers

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
    }

    // MARK: - Private Methods

    private func setupView() {
        backgroundColor = .black
        layer.cornerRadius = 20
        layer.shadowOffset = CGSize(width: 0, height: 4)
        layer.shadowColor = UIColor.lightGray.cgColor
        layer.shadowRadius = 3
        layer.shadowOpacity = 5
        addSubview(salesLabel)
        addSubview(cardNumberLabel)
        addSubview(logoImageView)
        addSubview(qrCodeButton)
        addSubview(infoButton)

        translatesAutoresizingMaskIntoConstraints = false
        setupConstraints()
    }

    private func setupConstraints() {
        widthAnchor.constraint(equalToConstant: 335).isActive = true
        heightAnchor.constraint(equalToConstant: 188).isActive = true

        logoImageView.topAnchor.constraint(equalTo: topAnchor, constant: 16).isActive = true
        logoImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8).isActive = true
        logoImageView.widthAnchor.constraint(equalToConstant: 80).isActive = true
        logoImageView.heightAnchor.constraint(equalTo: logoImageView.widthAnchor, multiplier: 1).isActive = true

        salesLabel.topAnchor.constraint(equalTo: topAnchor, constant: 116).isActive = true
        salesLabel.widthAnchor.constraint(equalToConstant: 44).isActive = true
        salesLabel.heightAnchor.constraint(equalToConstant: 19).isActive = true
        salesLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20).isActive = true

        cardNumberLabel.topAnchor.constraint(equalTo: topAnchor, constant: 142).isActive = true
        cardNumberLabel.widthAnchor.constraint(equalToConstant: 118).isActive = true
        cardNumberLabel.heightAnchor.constraint(equalToConstant: 17).isActive = true
        cardNumberLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20).isActive = true

        qrCodeButton.topAnchor.constraint(equalTo: topAnchor, constant: 17).isActive = true
        qrCodeButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16).isActive = true
        qrCodeButton.widthAnchor.constraint(equalToConstant: 30).isActive = true
        qrCodeButton.heightAnchor.constraint(equalTo: qrCodeButton.widthAnchor, multiplier: 1).isActive = true

        infoButton.topAnchor.constraint(equalTo: topAnchor, constant: 130).isActive = true
        infoButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -14).isActive = true
        infoButton.widthAnchor.constraint(equalToConstant: 30).isActive = true
        infoButton.heightAnchor.constraint(equalTo: qrCodeButton.widthAnchor, multiplier: 1).isActive = true
    }
}
