// StoriesViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Экран сторис
class StoriesViewController: UIViewController {
    // MARK: - Visual Components

    let storiesImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    // MARK: - Puplic Properties

    var image = UIImage()

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        configureStoriesImageView()
    }

    // MARK: - Private Methods

    private func configureStoriesImageView() {
        view.backgroundColor = .systemBlue
        view.addSubview(storiesImageView)
        storiesImageView.image = image

        NSLayoutConstraint.activate([
            storiesImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            storiesImageView.leftAnchor.constraint(equalTo: view.leftAnchor),
            storiesImageView.rightAnchor.constraint(equalTo: view.rightAnchor),
            storiesImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
    }
}
