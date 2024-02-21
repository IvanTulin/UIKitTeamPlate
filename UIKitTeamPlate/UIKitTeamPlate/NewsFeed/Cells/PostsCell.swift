// PostsCell.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Ячейка поста
final class PostsCell: UITableViewCell, UIScrollViewDelegate {
    // MARK: - Constants

    enum Constants {
        static let nameFontName = "Verdana"
        static let nameFontBold = "Verdana-Bold"
        static let nameForImageOptionsButton = "ellipsis"
        static let nameForImageLikeButton = "heart"
        static let nameForImageCommentButton = "messageImage"
        static let nameForImageShareButton = "paperplane"
    }

    static let identifier = "PostsCell"
    let images: [UIImage] = [
        .postNameImageOne,
        .imageForPagecontrolTwo,
        .castle
    ]

    // MARK: - Visual Components

    lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.showsVerticalScrollIndicator = false
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.isPagingEnabled = true
        scrollView.contentSize = CGSize(
            width: Int(UIScreen.main.bounds.width * 3),
            height: 239
        )
        scrollView.delegate = self
        scrollView.backgroundColor = .gray
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()

    lazy var pageControl: UIPageControl = {
        let pageControl = UIPageControl()
        pageControl.translatesAutoresizingMaskIntoConstraints = false
        pageControl.numberOfPages = images.count
        pageControl.pageIndicatorTintColor = .gray
        pageControl.currentPageIndicatorTintColor = .black

        return pageControl
    }()

    private let userImageView: UIImageView = {
        let view = UIImageView()
        view.layer.cornerRadius = 15
        view.clipsToBounds = true
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
        button.setImage(
            UIImage(
                systemName: Constants.nameForImageOptionsButton
            ),
            for: .normal
        )
        button.tintColor = .black
        button.isEnabled = true
        return button
    }()

//    private let postImageView: UIImageView = {
//        let view = UIImageView()
//        view.contentMode = .scaleAspectFill
//        return view
//    }()

    private let likeButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(
            UIImage(
                systemName: Constants.nameForImageLikeButton
            ),
            for: .normal
        )
        button.tintColor = .black
        return button
    }()

    private let commentButton: UIButton = {
        let button = UIButton(type: .system)
        button.tintColor = .black
        button.setImage(
            UIImage(
                named: Constants.nameForImageCommentButton
            ),
            for: .normal
        )
        return button
    }()

    private let shareButton: UIButton = {
        let button = UIButton(type: .system)
        button.tintColor = .black
        button.setImage(
            UIImage(
                systemName: Constants.nameForImageShareButton
            ),
            for: .normal
        )
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
        label.font = UIFont(name: Constants.nameFontBold, size: 11)
        return label
    }()

    private let commentLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.layer.borderColor = UIColor.red.cgColor
        label.font = UIFont(name: Constants.nameFontName, size: 10)
        return label
    }()

    private let imageForComment: UIImageView = {
        let view = UIImageView()
        view.layer.cornerRadius = 10
        view.clipsToBounds = true
        return view
    }()

    private let commentUserLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: Constants.nameFontName, size: 10)
        label.textColor = .systemGray2
        return label
    }()

    private let labelOfTheElapsedTime: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: Constants.nameFontName, size: 10)
        label.textColor = .systemGray2
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

    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        pageControl.currentPage = Int(scrollView.contentOffset.x / UIScreen.main.bounds.width)
    }

    func setupValue(with info: Post) {
        userImageView.image = UIImage(named: info.avatarNameImage)
        userNameLabel.text = info.nameTitle
//        if let image = info.postNameImages.first {
//            postImageView.image = UIImage(named: image)
//        }
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

        addImageView(image: images[0], position: 0)
        addImageView(image: images[1], position: 1)
        addImageView(image: images[2], position: 2)
    }

    private func addImageView(image: UIImage, position: CGFloat) {
        let imageView = UIImageView()
        imageView.image = image
        scrollView.addSubview(imageView)

        let screenWidth = UIScreen.main.bounds.width
        imageView.frame = CGRect(x: Int(screenWidth * position), y: 0, width: Int(screenWidth), height: 239)
    }

    private func initialize() {
        selectionStyle = .none // убираем выделение ячейки
        [
            scrollView, pageControl, userImageView, userNameLabel,
            subTitleLabel, optionsButton,
            // postImageView,
            likeButton,
            commentButton, shareButton, favoritesButton, numberLikeLabel,
            commentLabel, imageForComment, commentUserLabel,
            labelOfTheElapsedTime
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
            optionsButton.bottomAnchor.constraint(equalTo: scrollView.topAnchor),
//            optionsButton.bottomAnchor.constraint(equalTo: postImageView.topAnchor),

            scrollView.topAnchor.constraint(equalTo: userImageView.bottomAnchor, constant: 10),
            scrollView.leftAnchor.constraint(equalTo: contentView.leftAnchor),
            scrollView.rightAnchor.constraint(equalTo: contentView.rightAnchor),
            scrollView.heightAnchor.constraint(equalToConstant: 239),

            pageControl.topAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: 5),
            pageControl.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            // scrollView.widthAnchor.constraint(equalToConstant: 375),

//            postImageView.topAnchor.constraint(equalTo: userImageView.bottomAnchor, constant: 10),
//            postImageView.leftAnchor.constraint(equalTo: contentView.leftAnchor),
//            postImageView.rightAnchor.constraint(equalTo: contentView.rightAnchor),
//            postImageView.heightAnchor.constraint(equalTo: contentView.widthAnchor),
//            postImageView.widthAnchor.constraint(equalToConstant: 375),

            likeButton.topAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: 5),
            likeButton.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 10),

            commentButton.topAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: 5),
            commentButton.leftAnchor.constraint(equalTo: likeButton.rightAnchor, constant: 8),

            shareButton.topAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: 5),
            shareButton.leftAnchor.constraint(equalTo: commentButton.rightAnchor, constant: 12),
            favoritesButton.topAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: 5),
            favoritesButton.leftAnchor.constraint(equalTo: shareButton.rightAnchor, constant: 240),

            numberLikeLabel.topAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: 38),
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
