// NewStoriesCell.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Ячейка сторис
final class NewStoriesCell: UITableViewCell {
    // MARK: - Constants

    enum Constants {
        static let textForNameLabel = "Ваша история"
        static let nameFontName = "Verdana"
    }

    static let identifier = "NewStoriesCell"
    let rmLinkStorage = RMLinkStorage()

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

    // MARK: - Methods

    func setupValue(with info: [Stories]) {
        // Создание previousImageView для задания отсупов между вью
        var previousImageView: UIImageView?

        for item in 0 ..< rmLinkStorage.stories.count {
            let imageView = UIImageView()
            imageView.translatesAutoresizingMaskIntoConstraints = false
            imageView.image = UIImage(named: info[item].avatarNameImage)
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

            let newStoriesButton = UIButton()
            scrollView.addSubview(newStoriesButton)
            newStoriesButton.backgroundColor = .appPink
            newStoriesButton.setImage(.plus, for: .normal)
            newStoriesButton.layer.cornerRadius = 10
            newStoriesButton.isHidden = info[item].isHiddenButtons
            newStoriesButton.translatesAutoresizingMaskIntoConstraints = false

            // Создание namelabel
            let namelabel = UILabel()
            namelabel.translatesAutoresizingMaskIntoConstraints = false
            namelabel.text = info[item].nameUser
            if namelabel.text == Constants.textForNameLabel {
                namelabel.textColor = .gray
            } else {
                namelabel.textColor = .black
            }
            namelabel.font = UIFont(name: Constants.nameFontName, size: 8)
            namelabel.textAlignment = .center
            scrollView.addSubview(namelabel)

            NSLayoutConstraint.activate([
                imageView.topAnchor.constraint(equalTo: scrollView.topAnchor),
                imageView.widthAnchor.constraint(equalToConstant: 60),
                imageView.heightAnchor.constraint(equalToConstant: 60),

                newStoriesButton.topAnchor.constraint(equalTo: imageView.topAnchor, constant: 41),
                newStoriesButton.leftAnchor.constraint(equalTo: imageView.leftAnchor, constant: 40),
                newStoriesButton.widthAnchor.constraint(equalToConstant: 20),
                newStoriesButton.heightAnchor.constraint(equalToConstant: 20),

                namelabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 10),
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

        // Констрейнты для ScrollView
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: contentView.topAnchor),
            scrollView.leftAnchor.constraint(equalTo: contentView.leftAnchor),
            scrollView.rightAnchor.constraint(equalTo: contentView.rightAnchor),
            scrollView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
}
