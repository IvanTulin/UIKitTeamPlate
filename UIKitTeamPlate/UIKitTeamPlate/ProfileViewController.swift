// ProfileViewController.swift
// Copyright © RoadMap. All rights reserved.

// Наташа
import UIKit

/// Экран профиля
class ProfileViewController: UIViewController {
    private var cardView = ClubCardView()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(cardView)
        cardView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20).isActive = true
        cardView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        cardView.sale = 15
        cardView.cardNumber = 00_000_012_415_151
    }
}

/// Вью для клубной карты
class ClubCardView: UIView {
    
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
        button.layer.cornerRadius = frame.width * 0.5
        button.setImage(UIImage.qrcode, for: .normal)
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

    // MARK: - Private Properties

    // MARK: - Initializers

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
    }

    // MARK: - Public Methods

    // MARK: - Private Methods

    private func setupView() {
        backgroundColor = .black
        layer.cornerRadius = 20
        layer.shadowOffset = CGSize(width: 5, height: 1)
        layer.shadowColor = UIColor.lightGray.cgColor
        layer.shadowRadius = 5
        layer.shadowOpacity = 5
        addSubview(salesLabel)
        addSubview(cardNumberLabel)
        addSubview(logoImageView)
        setupConstraints()
    }

    private func setupConstraints() {
        translatesAutoresizingMaskIntoConstraints = false
        widthAnchor.constraint(equalToConstant: 335).isActive = true
        heightAnchor.constraint(equalToConstant: 188).isActive = true
        salesLabel.topAnchor.constraint(equalTo: topAnchor, constant: 116).isActive = true
        salesLabel.widthAnchor.constraint(equalToConstant: 44).isActive = true
        salesLabel.heightAnchor.constraint(equalToConstant: 19).isActive = true
        salesLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20).isActive = true

        cardNumberLabel.topAnchor.constraint(equalTo: topAnchor, constant: 130).isActive = true
        cardNumberLabel.widthAnchor.constraint(equalToConstant: 142).isActive = true
        cardNumberLabel.heightAnchor.constraint(equalToConstant: 17).isActive = true
        cardNumberLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20).isActive = true

        logoImageView.topAnchor.constraint(equalTo: topAnchor, constant: 16).isActive = true
        logoImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8).isActive = true
        logoImageView.widthAnchor.constraint(equalToConstant: 80).isActive = true
        logoImageView.heightAnchor.constraint(equalToConstant: 80).isActive = true
    }
}
