// PostsCell.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Ячейка поста
final class PostsCell: UITableViewCell {
    // MARK: - Constants

    static let identifier = "PostsCell"

    // MARK: - Visual Components

    private let userImageView: UIImageView = {
        let view = UIImageView()
        view.layer.cornerRadius = 15
        view.clipsToBounds = true // разраешаем обрезать границы ячейки
        // view.sizeToFit()
        return view
    }()

    private let userNameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14, weight: .bold)

        return label
    }()

    private let subTitleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 11)

        return label
    }()

    private let optionsButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(systemName: "ellipsis"), for: .normal)
        button.tintColor = .black
        button.isEnabled = true

        return button
    }()

    private let postImageView: UIImageView = {
        let view = UIImageView()
        view.contentMode = .scaleAspectFill
        return view
    }()

    private let likeButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(systemName: "heart"), for: .normal)
        button.tintColor = .black
        return button
    }()

    private let commentButton: UIButton = {
        let button = UIButton(type: .system)
        button.tintColor = .black
        button.setImage(UIImage(named: "messageImage"), for: .normal)

        return button
    }()

    private let shareButton: UIButton = {
        let button = UIButton(type: .system)
        button.tintColor = .black
        button.setImage(UIImage(systemName: "paperplane"), for: .normal)

        return button
    }()

    private let favoritesButton: UIButton = {
        let button = UIButton(type: .system)
        button.tintColor = .black
        button.setImage(.favoritesIcon, for: .normal)

        return button
    }()

    private let numberLikeLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Verdana-Bold", size: 11)
        // label.layer.borderWidth = 2
        return label
    }()

    private let commentLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
//        label.lineBreakMode = .byWordWrapping
//        label.adjustsFontSizeToFitWidth = true
//        label.sizeToFit()
        // label.layer.borderWidth = 2
        label.layer.borderColor = UIColor.red.cgColor
        label.font = UIFont(name: "Verdana", size: 10)
        return label
    }()

    private let imageForComment: UIImageView = {
        let view = UIImageView()
        view.layer.cornerRadius = 10
        view.clipsToBounds = true // разраешаем обрезать границы ячейки
        return view
    }()

    private let commentUserLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Verdana", size: 10)
        label.textColor = .systemGray2
        // label.layer.borderWidth = 2
        return label
    }()

    private let labelOfTheElapsedTime: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Verdana", size: 10)
        label.textColor = .systemGray2
        // label.layer.borderWidth = 2
        return label
    }()

    // MARK: - Init

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureUI()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Methods

    func setupValue(with info: Post) {
        userImageView.image = UIImage(named: info.avatarNameImage)
        userNameLabel.text = info.nameTitle
        if let image = info.postNameImages.first {
            postImageView.image = UIImage(named: image)
        }
        numberLikeLabel.text = info.numberLike

        if let comment = info.comment {
            configureCommentLabel(comment: comment)
        }
        imageForComment.image = UIImage(named: info.nameImageForCommentUser)
        commentUserLabel.text = info.textForUserComment
        labelOfTheElapsedTime.text = info.descriptionPost
    }

    // MARK: - Private Method

    private func configureUI() {
        initialize()
    }

    private func initialize() {
        selectionStyle = .none // убираем выделение ячейки
        [
            userImageView, userNameLabel, subTitleLabel, optionsButton,
            postImageView, likeButton, commentButton,
            shareButton, favoritesButton, numberLikeLabel, commentLabel,
            imageForComment, commentUserLabel, labelOfTheElapsedTime
        ].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            contentView.addSubview($0)
        }

        NSLayoutConstraint.activate([
            userImageView.widthAnchor.constraint(equalToConstant: 30),
            userImageView.heightAnchor.constraint(equalToConstant: 30),
            userImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
            userImageView.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 10),

            userNameLabel.centerYAnchor.constraint(equalTo: userImageView.centerYAnchor),
            userNameLabel.leftAnchor.constraint(equalTo: userImageView.rightAnchor, constant: 5),

            subTitleLabel.topAnchor.constraint(equalTo: userNameLabel.bottomAnchor, constant: 2),
            subTitleLabel.leftAnchor.constraint(equalTo: userImageView.rightAnchor, constant: 5),

            optionsButton.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5),
            optionsButton.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -15),
            optionsButton.bottomAnchor.constraint(equalTo: postImageView.topAnchor),

            postImageView.topAnchor.constraint(equalTo: userImageView.bottomAnchor, constant: 10),
            postImageView.leftAnchor.constraint(equalTo: contentView.leftAnchor),
            postImageView.rightAnchor.constraint(equalTo: contentView.rightAnchor),
            postImageView.heightAnchor.constraint(equalTo: contentView.widthAnchor),
            postImageView.widthAnchor.constraint(equalToConstant: 375),

            likeButton.topAnchor.constraint(equalTo: postImageView.bottomAnchor, constant: 5),
            likeButton.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 10),

            commentButton.topAnchor.constraint(equalTo: postImageView.bottomAnchor, constant: 5),
            commentButton.leftAnchor.constraint(equalTo: likeButton.rightAnchor, constant: 8),

            shareButton.topAnchor.constraint(equalTo: postImageView.bottomAnchor, constant: 5),
            shareButton.leftAnchor.constraint(equalTo: commentButton.rightAnchor, constant: 12),
            favoritesButton.topAnchor.constraint(equalTo: postImageView.bottomAnchor, constant: 5),
            favoritesButton.leftAnchor.constraint(equalTo: shareButton.rightAnchor, constant: 240),

            numberLikeLabel.topAnchor.constraint(equalTo: postImageView.bottomAnchor, constant: 38),
            numberLikeLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 10),
            numberLikeLabel.widthAnchor.constraint(equalToConstant: 107),
            numberLikeLabel.heightAnchor.constraint(equalToConstant: 15),

            commentLabel.topAnchor.constraint(equalTo: numberLikeLabel.bottomAnchor, constant: 5),
            commentLabel.leftAnchor.constraint(equalTo: numberLikeLabel.leftAnchor),
            commentLabel.widthAnchor.constraint(equalToConstant: 361),
            commentLabel.heightAnchor.constraint(equalToConstant: 29),

            imageForComment.topAnchor.constraint(equalTo: commentLabel.bottomAnchor, constant: 10),
            imageForComment.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 12),
            imageForComment.widthAnchor.constraint(equalToConstant: 20),
            imageForComment.heightAnchor.constraint(equalToConstant: 20),

            commentUserLabel.centerYAnchor.constraint(equalTo: imageForComment.centerYAnchor),
            commentUserLabel.leftAnchor.constraint(equalTo: imageForComment.rightAnchor, constant: 3),
            commentUserLabel.widthAnchor.constraint(equalToConstant: 150),
            commentUserLabel.heightAnchor.constraint(equalToConstant: 15),

            labelOfTheElapsedTime.topAnchor.constraint(equalTo: imageForComment.bottomAnchor, constant: 4),
            labelOfTheElapsedTime.leftAnchor.constraint(equalTo: imageForComment.leftAnchor),
            labelOfTheElapsedTime.widthAnchor.constraint(equalToConstant: 150),
            labelOfTheElapsedTime.heightAnchor.constraint(equalToConstant: 15),
            labelOfTheElapsedTime.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20)

        ])
    }

    /// метод который генерирует Жирный тест в лейбле для определенного отрезка текста
    func configureCommentLabel(comment: CommentShortInfo) {
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
        commentLabel.attributedText = attributedString
    }
}
