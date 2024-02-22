// UserStoriesCell.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Ячейка сторис пользователя
class UserStoriesCell: UITableViewCell {
    // MARK: - Constants

    enum Constants {
        static let nameFontName = "Verdana"
    }

    // MARK: - Visual Components

    private let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.showsVerticalScrollIndicator = false
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()

    // MARK: - Life Cycle

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupAnchor()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupAnchor()
    }

    // MARK: - Public Methods

    func setupValue(with info: [UserStories]) {
        // Создание previousImageView для задания отсупов между вью
        var previousImageView: UIImageView?

        for item in 0 ..< info.count {
            let imageView = UIImageView()
            imageView.translatesAutoresizingMaskIntoConstraints = false
            imageView.image = UIImage(named: info[item].nameStoriesImageView)
            scrollView.addSubview(imageView)

            if let previousImageView = previousImageView {
                // Установка отступа между image views
                NSLayoutConstraint.activate([
                    imageView.leadingAnchor.constraint(equalTo: previousImageView.trailingAnchor, constant: 22)
                ])
            } else {
                // Если первый UIImageView, то отступ от левого края
                NSLayoutConstraint.activate([
                    imageView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 22)
                ])
            }

            let namelabel = UILabel()
            namelabel.translatesAutoresizingMaskIntoConstraints = false
            namelabel.text = info[item].nameTextLabel
            namelabel.font = UIFont(name: Constants.nameFontName, size: 8)
            namelabel.textAlignment = .center
            scrollView.addSubview(namelabel)

            NSLayoutConstraint.activate([
                imageView.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 10),
                imageView.widthAnchor.constraint(equalToConstant: 49),
                imageView.heightAnchor.constraint(equalToConstant: 49),

                namelabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 7),
                namelabel.centerXAnchor.constraint(equalTo: imageView.centerXAnchor),
                namelabel.widthAnchor.constraint(equalToConstant: 74),
                namelabel.heightAnchor.constraint(equalToConstant: 10)

            ])
            previousImageView = imageView
        }

        // Констрейнт для последнего UIImageView, чтобы прокрутка работала корректно
        if let lastImageView = previousImageView {
            NSLayoutConstraint.activate([
                lastImageView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -22)
            ])
        }
    }

    // MARK: - Private Methods

    private func setupAnchor() {
        contentView.addSubview(scrollView)

        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: contentView.topAnchor),
            scrollView.leftAnchor.constraint(equalTo: contentView.leftAnchor),
            scrollView.rightAnchor.constraint(equalTo: contentView.rightAnchor),
            scrollView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
}
