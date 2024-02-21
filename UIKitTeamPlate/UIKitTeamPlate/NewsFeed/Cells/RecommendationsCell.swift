// RecommendationsCell.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Ячейка рекомнндаций
class RecommendationsCell: UITableViewCell {
    // MARK: - Constants

    static let identifier = "RecommendationsCell"

    // MARK: - Visual Components

    private let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false

        return scrollView
    }()
    
    // MARK: - Properties
    var nameImages: [String] = [
        "imageForRecomendationOne",
        "blondeGirlImage",
        "blondeGirlImage",
    ]

    // MARK: - Init

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupCell()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupCell()
    }

    // MARK: - Private Methods

    private func setupCell() {
        contentView.addSubview(scrollView)

        scrollView.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        scrollView.leftAnchor.constraint(equalTo: contentView.leftAnchor).isActive = true
        scrollView.rightAnchor.constraint(equalTo: contentView.rightAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true

        // Создание трех внутренних View внутри ScrollView
        let viewWidth = UIScreen.main.bounds.width / 2
        let viewHeight = 270

        for item in 0 ..< 3 {
            let view = UIView()
            scrollView.addSubview(view)
            view.translatesAutoresizingMaskIntoConstraints = false

            view.backgroundColor = UIColor.white
            // view.layer.borderWidth = 2
            view.widthAnchor.constraint(equalToConstant: 185).isActive = true
            view.heightAnchor.constraint(equalToConstant: 200).isActive = true
            view.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 45).isActive = true
            view.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: CGFloat(item) * viewWidth)
                .isActive = true

            // Создание UIImageView
            let imageView = UIImageView()
            view.addSubview(imageView)
            imageView.translatesAutoresizingMaskIntoConstraints = false
            imageView.image = .imageForRecomendationOne
            imageView.layer.cornerRadius = 60
            imageView.contentMode = .scaleAspectFill
            imageView.clipsToBounds = true

            imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
            imageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 10).isActive = true
            imageView.widthAnchor.constraint(equalToConstant: 120).isActive = true
            imageView.heightAnchor.constraint(equalToConstant: 120).isActive = true

            // Создание UIButton
            let button = UIButton()
            view.addSubview(button)
            button.translatesAutoresizingMaskIntoConstraints = false
            button.backgroundColor = .systemBlue
            button.layer.cornerRadius = 10
            button.setTitle("Подписаться", for: .normal)
            button.titleLabel?.font = UIFont(name: "Verdana-Bold", size: 10)

            button.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
            button.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -14).isActive = true
            button.widthAnchor.constraint(equalToConstant: 139).isActive = true
            button.heightAnchor.constraint(equalToConstant: 32).isActive = true
        }

        // Установка ширины ScrollView равной ширине всех внутренних View
        scrollView.contentSize = CGSize(width: CGFloat(3) * viewWidth, height: CGFloat(viewHeight))
    }
}
