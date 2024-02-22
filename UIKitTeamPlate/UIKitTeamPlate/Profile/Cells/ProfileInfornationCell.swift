// ProfileInfornationCell.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// протокол для вызова метода, открывающий сайт
protocol CellDelegate: AnyObject {
    func showSite()
}

/// Ячейка информации профиля
final class ProfileInfornationCell: UITableViewCell {
    // MARK: - Constants

    enum Constants {
        static let textForUserNameLabel = "Мария Иванова"
        static let textForUserProfessionLabel = "Консультат"
        static let textForNumberOfPublications = "67"
        static let textForPublications = "публикаций"
        static let textForNumberSubscribers = "458"
        static let textForSubscribers = "подписчики"
        static let textForNumberSubscriptions = "120"
        static let textForSubscriptions = "подписки"
        static let textForTitleChangeButton = "Изменить"
        static let textForShareProfileButton = "Поделиться профилем"
        static let nameSite = "www.spacex.com"
        static let nameFontBold = "Verdana-Bold"
        static let nameFontName = "Verdana"
    }

    weak var delegate: CellDelegate?

    // MARK: - Visual Components

    private let avatarImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = .brunetteGirl
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    private let newStoriesButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .appPink
        button.setImage(.plus, for: .normal)
        button.layer.cornerRadius = 13
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    private let userNameLabel: UILabel = {
        let label = UILabel()
        label.text = Constants.textForUserNameLabel
        label.font = UIFont(name: Constants.nameFontBold, size: 14)
        label.textColor = .black
        label.sizeToFit()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let userProfessionLabel: UILabel = {
        let label = UILabel()
        label.text = Constants.textForUserProfessionLabel
        label.font = UIFont(name: Constants.nameFontName, size: 14)
        label.textColor = .black
        label.sizeToFit()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let numberPublicationsLabel: UILabel = {
        let label = UILabel()
        label.text = Constants.textForNumberOfPublications
        label.font = UIFont(name: Constants.nameFontBold, size: 14)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let publicationsLabel: UILabel = {
        let label = UILabel()
        label.text = Constants.textForPublications
        label.font = UIFont(name: Constants.nameFontName, size: 10)
        label.sizeToFit()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let numberSubscriptionsLabel: UILabel = {
        let label = UILabel()
        label.text = Constants.textForNumberSubscribers
        label.font = UIFont(name: Constants.nameFontBold, size: 14)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let subscriptionsLabel: UILabel = {
        let label = UILabel()
        label.text = Constants.textForSubscribers
        label.font = UIFont(name: Constants.nameFontName, size: 10)
        label.sizeToFit()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let numberSubscribersLabel: UILabel = {
        let label = UILabel()
        label.text = Constants.textForNumberSubscriptions
        label.font = UIFont(name: Constants.nameFontBold, size: 14)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let subscribersLabel: UILabel = {
        let label = UILabel()
        label.text = Constants.textForSubscriptions
        label.font = UIFont(name: Constants.nameFontName, size: 10)
        label.sizeToFit()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let changeButton: UIButton = {
        let button = UIButton()
        button.setTitle(Constants.textForTitleChangeButton, for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = UIFont(name: Constants.nameFontBold, size: 10)
        button.backgroundColor = .systemGray5
        button.layer.cornerRadius = 10
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    private let shareProfileButton: UIButton = {
        let button = UIButton()
        button.setTitle(Constants.textForShareProfileButton, for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = UIFont(name: Constants.nameFontBold, size: 10)
        button.backgroundColor = .systemGray5
        button.layer.cornerRadius = 10
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    private let addProfileButton: UIButton = {
        let button = UIButton()
        button.setImage(.addProfileIcon, for: .normal)
        button.tintColor = .black
        button.backgroundColor = .systemGray5
        button.layer.cornerRadius = 6
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    lazy var siteDisplayButton: UIButton = {
        let button = UIButton()
        button.setTitle(Constants.nameSite, for: .normal)
        button.setImage(.paperClip, for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        button.titleLabel?.font = UIFont(
            name: Constants.nameFontName, size: 14
        )
        button.addTarget(self, action: #selector(openSite), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    // MARK: - Init

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureUI()
        setupAnchor()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        configureUI()
        setupAnchor()
    }

    // MARK: - Private Methods

    private func configureUI() {
        selectionStyle = .none
        contentView.addSubview(avatarImageView)
        contentView.addSubview(newStoriesButton)
        contentView.addSubview(userNameLabel)
        contentView.addSubview(userProfessionLabel)
        contentView.addSubview(numberPublicationsLabel)
        contentView.addSubview(publicationsLabel)
        contentView.addSubview(numberSubscribersLabel)
        contentView.addSubview(subscribersLabel)
        contentView.addSubview(numberSubscriptionsLabel)
        contentView.addSubview(subscriptionsLabel)
        contentView.addSubview(siteDisplayButton)
        contentView.addSubview(changeButton)
        contentView.addSubview(shareProfileButton)
        contentView.addSubview(addProfileButton)
    }

    private func setupAnchor() {
        NSLayoutConstraint.activate([
            avatarImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 12),
            avatarImageView.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 15),
            avatarImageView.widthAnchor.constraint(equalToConstant: 80),
            avatarImageView.heightAnchor.constraint(equalToConstant: 80),

            newStoriesButton.topAnchor.constraint(equalTo: avatarImageView.topAnchor, constant: 55),
            newStoriesButton.leftAnchor.constraint(equalTo: avatarImageView.leftAnchor, constant: 54),
            newStoriesButton.widthAnchor.constraint(equalToConstant: 27),
            newStoriesButton.heightAnchor.constraint(equalToConstant: 27),

            userNameLabel.topAnchor.constraint(equalTo: avatarImageView.bottomAnchor, constant: 10),
            userNameLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 15),

            userProfessionLabel.topAnchor.constraint(equalTo: userNameLabel.bottomAnchor, constant: 11),
            userProfessionLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 15),

            numberPublicationsLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 22),
            numberPublicationsLabel.leftAnchor.constraint(equalTo: avatarImageView.rightAnchor, constant: 56),
            numberPublicationsLabel.widthAnchor.constraint(equalToConstant: 50),
            numberPublicationsLabel.heightAnchor.constraint(equalToConstant: 17),

            publicationsLabel.centerXAnchor.constraint(equalTo: numberPublicationsLabel.centerXAnchor),
            publicationsLabel.topAnchor.constraint(equalTo: numberPublicationsLabel.bottomAnchor, constant: 2),

            numberSubscribersLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 22),
            numberSubscribersLabel.leftAnchor.constraint(equalTo: numberPublicationsLabel.rightAnchor, constant: 20),
            numberSubscribersLabel.widthAnchor.constraint(equalToConstant: 50),
            numberSubscribersLabel.heightAnchor.constraint(equalToConstant: 17),

            subscribersLabel.centerXAnchor.constraint(equalTo: numberSubscribersLabel.centerXAnchor),
            subscribersLabel.topAnchor.constraint(equalTo: numberSubscribersLabel.bottomAnchor, constant: 2),

            numberSubscriptionsLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 22),
            numberSubscriptionsLabel.leftAnchor.constraint(equalTo: numberSubscribersLabel.rightAnchor, constant: 21),
            numberSubscriptionsLabel.widthAnchor.constraint(equalToConstant: 50),
            numberSubscriptionsLabel.heightAnchor.constraint(equalToConstant: 17),

            subscriptionsLabel.centerXAnchor.constraint(equalTo: numberSubscriptionsLabel.centerXAnchor),
            subscriptionsLabel.topAnchor.constraint(equalTo: numberSubscriptionsLabel.bottomAnchor, constant: 2),

            siteDisplayButton.topAnchor.constraint(equalTo: userProfessionLabel.bottomAnchor, constant: 6),
            siteDisplayButton.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 11),
            siteDisplayButton.widthAnchor.constraint(equalToConstant: 145),
            siteDisplayButton.heightAnchor.constraint(equalToConstant: 17),

            changeButton.topAnchor.constraint(equalTo: siteDisplayButton.bottomAnchor, constant: 15),
            changeButton.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 15),
            changeButton.widthAnchor.constraint(equalToConstant: 155),
            changeButton.heightAnchor.constraint(equalToConstant: 27),

            shareProfileButton.topAnchor.constraint(equalTo: siteDisplayButton.bottomAnchor, constant: 15),
            shareProfileButton.leftAnchor.constraint(equalTo: changeButton.rightAnchor, constant: 5),
            shareProfileButton.widthAnchor.constraint(equalToConstant: 155),
            shareProfileButton.heightAnchor.constraint(equalToConstant: 27),

            addProfileButton.topAnchor.constraint(equalTo: siteDisplayButton.bottomAnchor, constant: 15),
            addProfileButton.leftAnchor.constraint(equalTo: shareProfileButton.rightAnchor, constant: 5),
            addProfileButton.widthAnchor.constraint(equalToConstant: 25),
            addProfileButton.heightAnchor.constraint(equalToConstant: 28),

        ])
    }

    @objc func openSite() {
        delegate?.showSite()
    }
}
