// ProfileViewController.swift
// Copyright © RoadMap. All rights reserved.

// Наташа
import UIKit

/// Экран профиля
final class ProfileViewController: UIViewController {
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
