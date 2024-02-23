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

    func setupValue(with info: [Stories]) {
        // Создание previousImageView для задания отсупов между вью
        var previousImageView: UIImageView?

        for item in 0 ..< info.count {
            let imageView = configureImageView()
            imageView.image = UIImage(named: info[item].avatarNameImage)

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

            let newStoriesButton = confifureNewStoriesButton(imageView)
            newStoriesButton.isHidden = info[item].isHiddenButtons

            let namelabel = configureNamelabel(imageView)
            namelabel.text = info[item].nameUser
            namelabel.textColor = namelabel.text == Constants.textForNameLabel ? .gray : .black

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

    private func configureImageView() -> UIImageView {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.addSubview(imageView)
        imageView.topAnchor.constraint(equalTo: scrollView.topAnchor).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: 60).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 60).isActive = true
        return imageView
    }

    private func confifureNewStoriesButton(_ imageView: UIImageView) -> UIButton {
        let button = UIButton()
        scrollView.addSubview(button)
        button.backgroundColor = .appPink
        button.setImage(.plus, for: .normal)
        button.layer.cornerRadius = 10
        button.translatesAutoresizingMaskIntoConstraints = false
        button.topAnchor.constraint(equalTo: imageView.topAnchor, constant: 41).isActive = true
        button.leftAnchor.constraint(equalTo: imageView.leftAnchor, constant: 40).isActive = true
        button.widthAnchor.constraint(equalToConstant: 20).isActive = true
        button.heightAnchor.constraint(equalToConstant: 20).isActive = true
        return button
    }

    private func configureNamelabel(_ imageView: UIImageView) -> UILabel {
        let namelabel = UILabel()
        namelabel.translatesAutoresizingMaskIntoConstraints = false
        namelabel.font = UIFont(name: Constants.nameFontName, size: 8)
        namelabel.textAlignment = .center
        scrollView.addSubview(namelabel)
        namelabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 10).isActive = true
        namelabel.centerXAnchor.constraint(equalTo: imageView.centerXAnchor).isActive = true
        namelabel.widthAnchor.constraint(equalToConstant: 74).isActive = true
        namelabel.heightAnchor.constraint(equalToConstant: 10).isActive = true
        return namelabel
    }
}
