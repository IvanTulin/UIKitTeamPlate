// UserPostsCell.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Ячейка с потсами пользователя
final class UserPostsCell: UITableViewCell {
    // MARK: - Constants

    enum Constants {
        static let identifier = "PhotoCell"
    }

    // MARK: - Private Properties

    private var photos: [UserPosts] = []

    // MARK: - Visual Components

    private lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: setupFlowLayout())
        collectionView.dataSource = self
        collectionView.backgroundColor = .white
        collectionView.register(
            PhotoCell.self, forCellWithReuseIdentifier: Constants.identifier
        )
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()

    // MARK: - Init

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureUI()
        setupAnchor()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        configureUI()
        setupAnchor()
    }

    func configureCollectionView(with info: [UserPosts]) {
        photos = info
        collectionView.reloadData()
    }

    // MARK: - Private Methods

    private func configureUI() {
        contentView.addSubview(collectionView)
    }

    private func setupFlowLayout() -> UICollectionViewFlowLayout {
        let layout = UICollectionViewFlowLayout()
        layout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
        layout.minimumLineSpacing = 1
        layout.minimumInteritemSpacing = 1
        return layout
    }

    private func setupAnchor() {
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: contentView.topAnchor),
            collectionView.leftAnchor.constraint(equalTo: contentView.leftAnchor),
            collectionView.rightAnchor.constraint(equalTo: contentView.rightAnchor),
            collectionView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
        ])
    }
}

extension UserPostsCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        photos.count
    }

    func collectionView(
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath
    ) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: Constants.identifier,
            for: indexPath
        ) as? PhotoCell else { return UICollectionViewCell() }
        cell.backgroundColor = .orange
        cell.setupValue(with: photos[indexPath.item])
        return cell
    }
}
