// ThisWeekNotificationsCell.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Ячейка для уведомлений за неделю
class ThisWeekNotificationsCell: UITableViewCell {
    // MARK: - Constants

    enum Constants {
        static let nameFondName = "Verdana"
        static let nameFondBold = "Verdana-Bold"
        static let textForTimeLabel = "12ч"
    }

    static let identifier = "ThisWeekNotificationsCell"

    // MARK: - Visual Components

    private let userAvatarImageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()

    private let notificationLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.adjustsFontSizeToFitWidth = true
        label.sizeToFit()
        label.font = UIFont(name: Constants.nameFondName, size: 12)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let postImageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()

    private let subscriptionButton: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 10
        button.backgroundColor = .systemBlue
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    // MARK: - Init

    override init(
        style: UITableViewCell.CellStyle,
        reuseIdentifier: String?
    ) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureUI()
        addConstraints()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Methods

    func setupValue(with info: NotificationThisWeek) {
        userAvatarImageView.image = UIImage(named: info.avatarNameImage)
        if let notification = info.notificationLabel {
            configureNotificationLabel(comment: notification)
        }

        if info.isHiddenPostImage == false {
            postImageView.image = UIImage(named: info.nameForPostImage ?? "")
            subscriptionButton.isHidden = true
        }

        if info.isHiddenButton == false {
            if info.textForTitleButton == "Вы подписаны" {
                subscriptionButton.setTitle(info.textForTitleButton, for: .normal)
                subscriptionButton.backgroundColor = .clear
                subscriptionButton.setTitleColor(.systemGray, for: .normal)
                subscriptionButton.layer.borderColor = UIColor.systemGray.cgColor
                subscriptionButton.titleLabel?.font = UIFont(name: Constants.nameFondBold, size: 10)
                subscriptionButton.layer.borderWidth = 1
            } else {
                subscriptionButton.setTitle(info.textForTitleButton, for: .normal)
                subscriptionButton.titleLabel?.font = UIFont(name: Constants.nameFondBold, size: 10)
            }
        }
    }

    // MARK: - Private Method

    private func configureUI() {
        contentView.addSubview(userAvatarImageView)
        contentView.addSubview(notificationLabel)
        contentView.addSubview(postImageView)
        contentView.addSubview(subscriptionButton)
    }

    private func addConstraints() {
        NSLayoutConstraint.activate([
            userAvatarImageView.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 12),
            userAvatarImageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            userAvatarImageView.widthAnchor.constraint(equalToConstant: 40),
            userAvatarImageView.heightAnchor.constraint(equalToConstant: 40),

            notificationLabel.centerYAnchor.constraint(equalTo: userAvatarImageView.centerYAnchor),
            notificationLabel.leftAnchor.constraint(equalTo: userAvatarImageView.rightAnchor, constant: 7),
            notificationLabel.widthAnchor.constraint(equalToConstant: 188),
            notificationLabel.heightAnchor.constraint(equalToConstant: 55),

            subscriptionButton.centerYAnchor.constraint(equalTo: notificationLabel.centerYAnchor),
            subscriptionButton.leftAnchor.constraint(equalTo: notificationLabel.rightAnchor, constant: -25),
            subscriptionButton.widthAnchor.constraint(equalToConstant: 139),
            subscriptionButton.heightAnchor.constraint(equalToConstant: 32),

            postImageView.centerYAnchor.constraint(equalTo: userAvatarImageView.centerYAnchor),
            postImageView.leftAnchor.constraint(equalTo: notificationLabel.rightAnchor, constant: 75),
            postImageView.widthAnchor.constraint(equalToConstant: 40),
            postImageView.heightAnchor.constraint(equalToConstant: 40),
        ])
    }

    /// метод который генерирует Жирный тест в лейбле для определенного отрезка текста
    private func configureNotificationLabel(comment: CommentShortInfo) {
        let string = comment.userName + " " + comment.commentText
        let attributedString = NSMutableAttributedString(string: string) // задаем текст который будем менять
        let range = NSRange(
            location: .zero,
            length: comment.userName.count
        ) // создает интервал который надо будет выделить жирным
        attributedString.addAttribute(
            NSAttributedString.Key.font,
            value: UIFont.systemFont(ofSize: 13, weight: .bold),
            range: range
        )
        notificationLabel.attributedText = attributedString
    }
}
