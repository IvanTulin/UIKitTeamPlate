// RecommendationsCell.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Ячейка рекомендаций
final class RecommendationsCell: UITableViewCell {
    // MARK: - Constants

    enum Constants {
        static let nameFontName = "Verdana"
        static let nameFontBold = "Verdana-Bold"
        static let textForTitleButton = "Подписаться"
    }

    static let identifier = "RecommendationsCell"

    // MARK: - Visual Components

    private let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.showsVerticalScrollIndicator = false
        scrollView.showsHorizontalScrollIndicator = false
        return scrollView
    }()

    // MARK: - Init

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupAnchor()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupAnchor()
    }

    // MARK: - Public Methods

    func setupValue(with info: [Recommendations]) {
        // Создание previousView для задания отсупов между вью
        var previousView: UIView?

        // Создание трех внутренних View внутри ScrollView
        let viewWidth = UIScreen.main.bounds.width / 2
        let viewHeight = 270

        for item in 0 ..< info.count {
            let view = UIView()
            scrollView.addSubview(view)
            view.translatesAutoresizingMaskIntoConstraints = false

            view.backgroundColor = UIColor.white
            view.widthAnchor.constraint(equalToConstant: 185).isActive = true
            view.heightAnchor.constraint(equalToConstant: 200).isActive = true
            view.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 45).isActive = true

            if let previousView = previousView {
                // Установка отступа между image views
                NSLayoutConstraint.activate([
                    view.leadingAnchor.constraint(equalTo: previousView.trailingAnchor, constant: 17)
                ])
            } else {
                // Если первый UIImageView, то отступ от левого края
                NSLayoutConstraint.activate([
                    view.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 17)
                ])
            }

            let avatarImageView = configureAvatarImageView(view)
            avatarImageView.image = UIImage(named: info[item].avatarNameImage)

            let namelabel = configureNameLabel(view: view, imageView: avatarImageView)
            namelabel.text = info[item].userName

            let subscriptButton = configureSubscriptionButton(view)

            let clossedButton = configureClossedButton(view)

            previousView = view
        }

        // Констрейнт для последнего UIImageView, чтобы прокрутка работала корректно
        if let lastImageView = previousView {
            NSLayoutConstraint.activate([
                lastImageView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -22)
            ])
        }

        // Установка ширины ScrollView равной ширине всех внутренних View
        scrollView.contentSize = CGSize(width: CGFloat(3) * viewWidth, height: CGFloat(viewHeight))
    }

    // MARK: - Private Methods

    private func setupAnchor() {
        contentView.addSubview(scrollView)

        scrollView.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        scrollView.leftAnchor.constraint(equalTo: contentView.leftAnchor).isActive = true
        scrollView.rightAnchor.constraint(equalTo: contentView.rightAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
    }

    private func configureAvatarImageView(_ view: UIView) -> UIImageView {
        let avatarImageView = UIImageView()
        view.addSubview(avatarImageView)
        avatarImageView.translatesAutoresizingMaskIntoConstraints = false
        avatarImageView.layer.cornerRadius = 60
        avatarImageView.contentMode = .scaleAspectFill
        avatarImageView.clipsToBounds = true
        avatarImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        avatarImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 10).isActive = true
        avatarImageView.widthAnchor.constraint(equalToConstant: 120).isActive = true
        avatarImageView.heightAnchor.constraint(equalToConstant: 120).isActive = true
        return avatarImageView
    }

    private func configureNameLabel(view: UIView, imageView: UIImageView) -> UILabel {
        let namelabel = UILabel()
        view.addSubview(namelabel)
        namelabel.translatesAutoresizingMaskIntoConstraints = false
        namelabel.textColor = .black
        namelabel.textAlignment = .center
        namelabel.font = UIFont(name: Constants.nameFontName, size: 10)

        namelabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        namelabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 5).isActive = true
        namelabel.widthAnchor.constraint(equalToConstant: 100).isActive = true
        namelabel.heightAnchor.constraint(equalToConstant: 12).isActive = true
        return namelabel
    }

    private func configureSubscriptionButton(_ view: UIView) -> UIButton {
        let subscriptButton = UIButton()
        view.addSubview(subscriptButton)
        subscriptButton.translatesAutoresizingMaskIntoConstraints = false
        subscriptButton.backgroundColor = .systemBlue
        subscriptButton.layer.cornerRadius = 10
        subscriptButton.setTitle(Constants.textForTitleButton, for: .normal)
        subscriptButton.titleLabel?.font = UIFont(
            name: Constants.nameFontBold,
            size: 10
        )
        subscriptButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        subscriptButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -14).isActive = true
        subscriptButton.widthAnchor.constraint(equalToConstant: 139).isActive = true
        subscriptButton.heightAnchor.constraint(equalToConstant: 32).isActive = true
        return subscriptButton
    }

    private func configureClossedButton(_ view: UIView) -> UIButton {
        let clossedButton = UIButton()
        view.addSubview(clossedButton)
        clossedButton.translatesAutoresizingMaskIntoConstraints = false
        clossedButton.tintColor = .black
        clossedButton.setImage(.clearButton, for: .normal)
        clossedButton.sizeToFit()

        clossedButton.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        clossedButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 167).isActive = true
        return clossedButton
    }
}
