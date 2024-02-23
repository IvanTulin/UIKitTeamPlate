// StoriesViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Экран сторис
final class StoriesViewController: UIViewController {
    // MARK: - Constants

    enum Constants {
        static let nameTextAvatar = "Запуск"
        static let nameFontName = "Verdana"
    }

    // MARK: - Visual Components

    private let storiesImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    private let storiesProgressView: UIProgressView = {
        let progressView = UIProgressView()
        progressView.progressViewStyle = .bar
        progressView.setProgress(0.0, animated: true)
        progressView.progressTintColor = .white
        progressView.trackTintColor = .gray
        progressView.translatesAutoresizingMaskIntoConstraints = false
        return progressView
    }()

    private let avatarImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = .start
        imageView.layer.cornerRadius = 13
        imageView.layer.borderColor = UIColor.white.cgColor
        imageView.layer.borderWidth = 1
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    private let nameAvatarLabel: UILabel = {
        let label = UILabel()
        label.text = Constants.nameTextAvatar
        label.textColor = .white
        label.font = UIFont(name: Constants.nameFontName, size: 10)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    // MARK: - Puplic Properties

    var image = UIImage()
    var storiesTimer = Timer()

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
        configureProgressView()
        configureLabel()
        createTimer()
    }

    // MARK: - Private Methods

    private func configureView() {
        view.backgroundColor = .systemBlue
        view.addSubview(storiesImageView)
        view.addSubview(avatarImageView)
        storiesImageView.image = image

        NSLayoutConstraint.activate([
            storiesImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            storiesImageView.leftAnchor.constraint(equalTo: view.leftAnchor),
            storiesImageView.rightAnchor.constraint(equalTo: view.rightAnchor),
            storiesImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor),

            avatarImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 23),
            avatarImageView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 6),
            avatarImageView.widthAnchor.constraint(equalToConstant: 26),
            avatarImageView.heightAnchor.constraint(equalToConstant: 26)
        ])
    }

    private func configureProgressView() {
        view.addSubview(storiesProgressView)

        NSLayoutConstraint.activate([
            storiesProgressView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 11),
            storiesProgressView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 5),
            storiesProgressView.widthAnchor.constraint(equalToConstant: 365),
            storiesProgressView.heightAnchor.constraint(equalToConstant: 1)
        ])
    }

    private func configureLabel() {
        view.addSubview(nameAvatarLabel)

        NSLayoutConstraint.activate([
            nameAvatarLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30),
            nameAvatarLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 42),
            nameAvatarLabel.widthAnchor.constraint(equalToConstant: 55),
            nameAvatarLabel.heightAnchor.constraint(equalToConstant: 12)
        ])
    }

    private func createTimer() {
        storiesTimer = Timer.scheduledTimer(
            timeInterval: 1,
            target: self,
            selector: #selector(updateProgressView),
            userInfo: nil,
            repeats: true
        )
    }

    @objc private func updateProgressView() {
        if storiesProgressView.progress != 1.0 {
            storiesProgressView.progress += 0.1 / 1.0
        } else if storiesProgressView.progress == 1.0 {
            storiesTimer.invalidate()
            dismiss(animated: true)
        }
    }
}
