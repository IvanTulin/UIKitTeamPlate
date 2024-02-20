// NewStoriesCell.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Ячейка сторис
class NewStoriesCell: UITableViewCell {
    static let identifier = "NewStoriesCell"

    private let scroolView: UIScrollView = {
        let scroolView = UIScrollView()
        scroolView.isPagingEnabled = true
        scroolView.showsHorizontalScrollIndicator = false
        scroolView.translatesAutoresizingMaskIntoConstraints = false
        return scroolView
    }()

    private let storiesImageView: UIImageView = {
        let image = UIImageView()
        image.sizeToFit()
        image.layer.cornerRadius = 8
        image.translatesAutoresizingMaskIntoConstraints = false

        return image
    }()

    override init(
        style: UITableViewCell.CellStyle,
        reuseIdentifier: String?
    ) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureUI()
        addConstraint()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Methods

    func setupValue(with info: Stories) {
        storiesImageView.image = UIImage(named: info.avatarNameImage)
    }

    // MARK: - Private Methods

    private func configureUI() {
//        contentView.addSubview(scroolView)
//        scroolView.addSubview(storiesImageView)
        contentView.addSubview(storiesImageView)
    }

    private func addConstraint() {
        NSLayoutConstraint.activate([
            storiesImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5),
            storiesImageView.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 10),
            storiesImageView.widthAnchor.constraint(equalToConstant: 60),
            storiesImageView.heightAnchor.constraint(equalToConstant: 60),

//            scroolView.topAnchor.constraint(equalTo: topAnchor),
//            scroolView.leftAnchor.constraint(equalTo: leftAnchor),
//            scroolView.rightAnchor.constraint(equalTo: rightAnchor),
//            scroolView.bottomAnchor.constraint(equalTo: bottomAnchor)

        ])

//        // Добавляем элементы (обложки сторис) в scrollView
//        let storyWidth: CGFloat = 60.0
//        let storyHeight: CGFloat = 60.0
//        let spacing: CGFloat = 10.0
//        var offsetX: CGFloat = spacing
//
//        for _ in 0 ..< 5 { // Пример с 5 сторис
//            let storiesImageView = UIImageView() // Создаем новый экземпляр каждый раз
//
//            storiesImageView.sizeToFit()
//            storiesImageView.layer.cornerRadius = 8
//
//            storiesImageView.frame = CGRect(
//                x: offsetX,
//                y: (frame.height - storyHeight) / 2,
//                width: storyWidth,
//                height: storyHeight
//            )
//
//            scroolView.addSubview(storiesImageView)
//
//            offsetX += storyWidth + spacing
//            offsetX += spacing
//        }
//
//        scroolView.contentSize = CGSize(width: offsetX, height: frame.height)
    }
}
