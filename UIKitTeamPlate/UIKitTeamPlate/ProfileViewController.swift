// ProfileViewController.swift
// Copyright © RoadMap. All rights reserved.

// Наташа
import UIKit

/// Экран профиля
class ProfileViewController: UIViewController {
    enum Constants {
        static let titleLabelText = "Личные данные"

        static let menuButtonsTitles = ["Мои данные", "Приведи друга", "Обратная связь"]
        static let menuButtonsImages = [UIImage.personalInfo, UIImage.invite, UIImage.callback]
    }

    private lazy var cardView = ClubCardView()

    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Verdana-Bold", size: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = Constants.titleLabelText
        return label
    }()

    private lazy var personalDataButton: UIButton = {
        let button = makeMenuButton(
            title: Constants.menuButtonsTitles[0],
            image: Constants.menuButtonsImages[0]
        )
        button.addTarget(self, action: #selector(showPersonalData), for: .touchUpInside)
        return button
    }()

    private lazy var inviteFriendButton = makeMenuButton(
        title: Constants.menuButtonsTitles[1],
        image: Constants.menuButtonsImages[1]
    )
    private lazy var callbackButton = makeMenuButton(
        title: Constants.menuButtonsTitles[2],
        image: Constants.menuButtonsImages[2]
    )

    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }

    private func configureUI() {
        view.backgroundColor = .white
        navigationItem.title = "Профиль"
        view.addSubview(cardView)
        view.addSubview(titleLabel)

        cardView.sale = 15
        cardView.cardNumber = 100_000_124_151
        configureConstraints()
        configureTabBar()
    }

    private func configureConstraints() {
        cardView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20).isActive = true
        cardView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true

        titleLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 328).isActive = true
        titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        titleLabel.widthAnchor.constraint(equalToConstant: 163).isActive = true
        titleLabel.heightAnchor.constraint(equalToConstant: 22).isActive = true

        personalDataButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 372).isActive = true
        personalDataButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10).isActive = true
        personalDataButton.widthAnchor.constraint(equalToConstant: 340).isActive = true

        personalDataButton.heightAnchor.constraint(equalToConstant: 45).isActive = true

        inviteFriendButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 424).isActive = true
        inviteFriendButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10).isActive = true
        inviteFriendButton.widthAnchor.constraint(equalToConstant: 340).isActive = true
        inviteFriendButton.heightAnchor.constraint(equalToConstant: 45).isActive = true

        callbackButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 476).isActive = true
        callbackButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10).isActive = true
        callbackButton.widthAnchor.constraint(equalToConstant: 340).isActive = true
        callbackButton.heightAnchor.constraint(equalToConstant: 45).isActive = true
    }

    func makeMenuButton(title: String, image: UIImage) -> UIButton {
        let button = UIButton()
        button.setTitle(title, for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.setImage(image, for: .normal)
        button.configuration = .plain()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.contentHorizontalAlignment = .left
        button.contentVerticalAlignment = .top
        button.configuration?.imagePadding = 10
        button.configuration?.imagePlacement = .leading
        let borderView = UIView()
        button.addSubview(borderView)
        borderView.backgroundColor = UIColor.black.withAlphaComponent(0.1)
        borderView.translatesAutoresizingMaskIntoConstraints = false
        borderView.topAnchor.constraint(equalTo: button.bottomAnchor, constant: -2).isActive = true
        borderView.leadingAnchor.constraint(equalTo: button.leadingAnchor, constant: 10).isActive = true
        borderView.widthAnchor.constraint(equalToConstant: 335).isActive = true
        borderView.heightAnchor.constraint(equalToConstant: 1).isActive = true
        view.addSubview(button)
        return button
    }

    private func configureTabBar() {
        let tabBarItem = UITabBarItem(
            title: "Профиль",
            image: UIImage(named: "profileImage"),
            selectedImage: nil
        )
        self.tabBarItem = tabBarItem
    }

    @objc private func showPersonalData() {
        let newVC = UserDataViewController()
        navigationController?.pushViewController(newVC, animated: true)
    }
}

/// Кастомная вью для карты
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
