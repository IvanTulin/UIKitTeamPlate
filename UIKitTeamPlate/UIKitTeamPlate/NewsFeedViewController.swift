// NewsFeedViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Экран новостей
class NewsFeedViewController: UIViewController {
    // MARK: - Visual Components

    private let rmLinkImageView: UIImageView = {
        let image = UIImageView()
        image.image = .rmLink
        image.sizeToFit()
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private let notificationButton: UIButton = {
        let button = UIButton()
        button.setImage(.notifiztionIconForButton, for: .normal)
        button.sizeToFit()
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()


    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        addConstraints()
    }

    // MARK: - Private Methods

    private func configureUI() {
        view.backgroundColor = .white
        view.addSubview(rmLinkImageView)
        view.addSubview(notificationButton)
    }

    private func addConstraints() {
        NSLayoutConstraint.activate([
            rmLinkImageView.leftAnchor.constraint(
                equalTo: view.leftAnchor,
                constant: 15
            ),
            rmLinkImageView.topAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.topAnchor
            ),
            rmLinkImageView.widthAnchor.constraint(equalToConstant: 100),
            rmLinkImageView.heightAnchor.constraint(equalToConstant: 26),
            
            notificationButton.rightAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.rightAnchor,
                constant: 17
            ),
            notificationButton.topAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.topAnchor
            ),

            
        ])
    }
}
