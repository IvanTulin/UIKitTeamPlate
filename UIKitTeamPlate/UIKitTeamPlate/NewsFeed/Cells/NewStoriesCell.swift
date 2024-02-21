// NewStoriesCell.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Ячейка сторис
class NewStoriesCell: UITableViewCell {
    // MARK: - Constants

    static let identifier = "NewStoriesCell"

    // MARK: - Properties

    var images: [UIImage] = []
    var nameImages: [String] = [
        "userAvatar",
        "blondeGirlImage",
        "blondeGirlImage",
        "blondeGirlImage",
        "blondeGirlImage",
        "blondeGirlImage",
        "blondeGirlImage",
        "blondeGirlImage",
        "blondeGirlImage",
        "blondeGirlImage",
        "blondeGirlImage",
    ]

    // MARK: - Life Cycle

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupCell()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupCell()
    }

    // MARK: - Private Method

    func setupValue(with info: [Stories]) {
        //nameImages = info.first?.avatarNameImage
//        if let image = UIImage(named: info.avatarNameImage) {
//            images = image
//        }
    }

    // MARK: - Private Method
    
    private func setupCell() {
        // Создание ScrollView
        let scrollView = UIScrollView()
        contentView.addSubview(scrollView)
        scrollView.translatesAutoresizingMaskIntoConstraints = false

        // Констрейнты для ScrollView
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: contentView.topAnchor),
            scrollView.leftAnchor.constraint(equalTo: contentView.leftAnchor),
            scrollView.rightAnchor.constraint(equalTo: contentView.rightAnchor),
            scrollView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])

        // Создание 10 UIImageView и UILabel внутри ScrollView
        var previousImageView: UIImageView?

        for item in 0 ..< 10 {
            
            let imageView = UIImageView()
            scrollView.addSubview(imageView)
            imageView.translatesAutoresizingMaskIntoConstraints = false
            
            if item < nameImages.count {
                imageView.image = UIImage(named: nameImages[item])
            }
            

            // Констрейнты для UIImageView
            NSLayoutConstraint.activate([
                imageView.topAnchor.constraint(equalTo: scrollView.topAnchor),
                imageView.widthAnchor.constraint(equalToConstant: 60),
                imageView.heightAnchor.constraint(equalToConstant: 60)
            ])

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

            // Создание UILabel
            let label = UILabel()
            scrollView.addSubview(label)
            label.translatesAutoresizingMaskIntoConstraints = false
            label.text = "lavanda123"
            label.font = UIFont(name: "Verdana", size: 8)
            label.textAlignment = .center

            // Констрейнты для UILabel
            NSLayoutConstraint.activate([
                label.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 10),
                label.centerXAnchor.constraint(equalTo: imageView.centerXAnchor),
                label.widthAnchor.constraint(equalToConstant: 74),
                label.heightAnchor.constraint(equalToConstant: 10)
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

}
