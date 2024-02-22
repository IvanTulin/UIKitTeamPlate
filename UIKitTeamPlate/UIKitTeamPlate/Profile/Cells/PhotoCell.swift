// PhotoCell.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Ячейка фото для колекции постов
class PhotoCell: UICollectionViewCell {
    // MARK: - Visual Components

    private let postImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    // MARK: - Init

    override init(frame: CGRect) {
        super.init(frame: frame)
        configurePostImageView()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        configurePostImageView()
    }

    // MARK: - Public Methods

    func setupValue(with info: UserPosts) {
        postImageView.image = UIImage(named: info.nameImages)
    }

    // MARK: - Private Methods

    private func configurePostImageView() {
        contentView.addSubview(postImageView)

        NSLayoutConstraint.activate([
            //            postImageView.widthAnchor.constraint(equalToConstant: 124),
//            postImageView.heightAnchor.constraint(equalToConstant: 124),
            postImageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            postImageView.leftAnchor.constraint(equalTo: contentView.leftAnchor),
            postImageView.rightAnchor.constraint(equalTo: contentView.rightAnchor),
            postImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
        ])
    }
}
