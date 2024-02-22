// ProfileViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Экран профиля
final class ProfileViewController: UIViewController {
    // MARK: - Constants

    enum Constants {
        static let identifierProfileInfo = "ProfileInfornationCell"
        static let identifierUserStories = "UserStoriesCell"
        static let identifierUserPosts = "UserPostsCell"
        static let textForTitleUserNameButton = "mary_rmLink"
        static let nameFontBold = "Verdana-Bold"
        static let numberOfSections = 1
    }

    /// Тип данных
    enum InformationType {
        /// информация профиля
        case profileInfo
        /// сторис
        case stories
        /// посты
        case post
    }

    let informationType: [InformationType] = [.profileInfo, .stories, .post]

    // MARK: - Visual Components

    private let userNameButton: UIBarButtonItem = {
        let button = UIBarButtonItem()
        button.title = Constants.textForTitleUserNameButton
        button.tintColor = .black
        button.style = .plain
        button.customView?.sizeToFit()
        if let font = UIFont(name: Constants.nameFontBold, size: 18) {
            button.setTitleTextAttributes(
                [NSAttributedString.Key.font: font], for: .normal
            )
        }
        return button
    }()

    private let lockButton: UIBarButtonItem = {
        let button = UIBarButtonItem()
        button.image = .lock
        button.tintColor = .black
        button.customView?.sizeToFit()
        return button
    }()

    private let addButton: UIBarButtonItem = {
        let button = UIBarButtonItem()
        button.image = .addIcon
        button.tintColor = .black
        return button
    }()

    private let settingsButton: UIBarButtonItem = {
        let button = UIBarButtonItem()
        button.image = .settingsIcon
        button.tintColor = .black
        return button
    }()

    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(ProfileInfornationCell.self, forCellReuseIdentifier: Constants.identifierProfileInfo)
        tableView.register(UserStoriesCell.self, forCellReuseIdentifier: Constants.identifierUserStories)
        tableView.register(UserPostsCell.self, forCellReuseIdentifier: Constants.identifierUserPosts)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        setupAnchor()
    }

    // MARK: - Private Methods

    private func configureUI() {
        view.backgroundColor = .white
        navigationItem.leftBarButtonItems = [lockButton, userNameButton]
        navigationItem.rightBarButtonItems = [settingsButton, addButton]

        view.addSubview(tableView)
    }

    private func setupAnchor() {
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.leftAnchor.constraint(equalTo: view.leftAnchor),
            tableView.rightAnchor.constraint(equalTo: view.rightAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
    }
}

// MARK: - ProfileViewController + UITableViewDataSource

extension ProfileViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        informationType.count
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        Constants.numberOfSections
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch informationType[indexPath.section] {
        case .profileInfo:
            let cell = tableView.dequeueReusableCell(withIdentifier: Constants.identifierProfileInfo, for: indexPath)
            cell.backgroundColor = .orange
            return cell
        case .stories:
            let cell = tableView.dequeueReusableCell(withIdentifier: Constants.identifierUserStories, for: indexPath)
            cell.backgroundColor = .gray
            return cell
        case .post:
            let cell = tableView.dequeueReusableCell(withIdentifier: Constants.identifierUserPosts, for: indexPath)
            cell.backgroundColor = .magenta
            return cell
        }
    }
}

// MARK: - ProfileViewController + UITableViewDelegate

extension ProfileViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch informationType[indexPath.section] {
        case .profileInfo:
            return 200
        case .stories:
            return 101
        case .post:
            return 310
        }
    }
}
