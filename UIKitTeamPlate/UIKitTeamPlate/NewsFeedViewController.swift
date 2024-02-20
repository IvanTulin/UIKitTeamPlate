// NewsFeedViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Экран новостей
class NewsFeedViewController: UIViewController {
    // MARK: - Constants

    let news = ["", "", "", "", ""]
//    let indetifier = "MyCell"

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
        table.register(
            UITableViewCell.self,
            forCellReuseIdentifier: NewStoriesCell.identifier
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

// MARK: - UITableViewDataSource

extension NewsFeedViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        news.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: NewStoriesCell.identifier, for: indexPath)
        cell.textLabel?.text = "section: \(indexPath.section) - row: \(indexPath.row)"
        cell.backgroundColor = .orange

        return cell
    }
}

// MARK: - UITableViewDelegate

extension NewsFeedViewController: UITableViewDelegate {}
