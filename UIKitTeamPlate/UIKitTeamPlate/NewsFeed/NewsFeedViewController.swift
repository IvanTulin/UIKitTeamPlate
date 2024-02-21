// NewsFeedViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Экран новостей
final class NewsFeedViewController: UIViewController {
    // MARK: - Constants

    enum RowsType {
        case stories
        case firstPost
        case recommendation
        case posts
    }

    let rmLinkStorage = RMLinkStorage()
    let rowsType: [RowsType] = [.stories, .firstPost, .recommendation, .posts]

    // MARK: - Visual Components

    private let rmLinkButton: UIBarButtonItem = {
        let button = UIBarButtonItem()
        button.image = .rmLink
        button.style = .plain
        button.tintColor = .black
        return button
    }()

    private let notificationButton: UIBarButtonItem = {
        let button = UIBarButtonItem()
        button.image = .notificationIconForButton
        button.style = .plain
        button.tintColor = .black
        return button
    }()

    private lazy var tableView: UITableView = {
        let table = UITableView()
        table.delegate = self
        table.dataSource = self
        table.showsVerticalScrollIndicator = false
        table.separatorColor = .clear
        table.register(
            NewStoriesCell.self,
            forCellReuseIdentifier: NewStoriesCell.identifier
        )
        table.register(
            PostsCell.self,
            forCellReuseIdentifier: PostsCell.identifier
        )
        table.register(
            RecommendationsCell.self,
            forCellReuseIdentifier: RecommendationsCell.identifier
        )
        table.translatesAutoresizingMaskIntoConstraints = false
        return table
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
        navigationItem.leftBarButtonItem = rmLinkButton
        navigationItem.rightBarButtonItem = notificationButton
        view.addSubview(tableView)
    }

    private func addConstraints() {
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.topAnchor
            ),
            tableView.leftAnchor.constraint(equalTo: view.leftAnchor),
            tableView.rightAnchor.constraint(equalTo: view.rightAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}

// MARK: - NewsFeedViewController + UITableViewDataSource

extension NewsFeedViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        rowsType.count
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch rowsType[section] {
        case .stories, .firstPost, .recommendation:
            return 1
        case .posts:
            return rmLinkStorage.posts.count
        }
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch rowsType[indexPath.section] {
        case .stories:
            guard let cell = tableView.dequeueReusableCell(
                withIdentifier: NewStoriesCell.identifier,
                for: indexPath
            ) as? NewStoriesCell else { return UITableViewCell() }
            cell.setupValue(with: rmLinkStorage.stories)
            return cell

        case .firstPost:
            guard let cell = tableView
                .dequeueReusableCell(withIdentifier: PostsCell.identifier, for: indexPath) as? PostsCell
            else { return UITableViewCell() }
            cell.setupValue(with: rmLinkStorage.posts[indexPath.row])
            return cell

        case .recommendation:
            guard let cell = tableView.dequeueReusableCell(
                withIdentifier: RecommendationsCell.identifier,
                for: indexPath
            ) as? RecommendationsCell else { return UITableViewCell() }
            cell.backgroundColor = .appLightBlue
            cell.setupValue(with: rmLinkStorage.recommendations)
            return cell

        case .posts:
            guard let cell = tableView
                .dequeueReusableCell(withIdentifier: PostsCell.identifier, for: indexPath) as? PostsCell
            else { return UITableViewCell() }
            cell.setupValue(with: rmLinkStorage.posts[indexPath.row])
            return cell
        }
    }
}

// MARK: - NewsFeedViewController + UITableViewDelegate

extension NewsFeedViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let cellType = rowsType[indexPath.section]
        switch cellType {
        case .stories:
            return 85
        case .firstPost:
            return 455
        case .recommendation:
            return 270
        case .posts:
            return 455
        }
    }
}
