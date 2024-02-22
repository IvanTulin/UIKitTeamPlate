// NotificationViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Экран уведомлений
final class NotificationViewController: UIViewController {
    // MARK: - Constants

    enum Constants {
        static let textForTitleNavigationItem = "Уведомления"
        static let textForSubscriptionRequestLabel = "Запросы на подписку"
        static let textForTodayHeader = "Сегодня"
        static let textForThisWeekHeader = "На этой недели"
        static let nameFontName = "Verdana"
        static let nameFontBold = "Verdana-Bold"
    }

    /// Тип уведомления
    enum NotificationType {
        /// уведомления за сегодня
        case today
        /// уведомления за эту неделю
        case thisweek
    }

    let notificationStorage = NotificationStorage()
    let notificationType: [NotificationType] = [.today, .thisweek]

    // MARK: - Visual Components

    private let requestForLabelSubscription: UILabel = {
        let label = UILabel()
        label.text = Constants.textForSubscriptionRequestLabel
        label.font = UIFont(name: Constants.nameFontName, size: 14)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private lazy var tableView: UITableView = {
        let table = UITableView()
        table.translatesAutoresizingMaskIntoConstraints = false
        table.delegate = self
        table.dataSource = self
        table.showsVerticalScrollIndicator = false
        table.separatorColor = .clear
        table.register(
            TodayNotificationsCell.self,
            forCellReuseIdentifier: TodayNotificationsCell.identifier
        )
        table.register(
            ThisWeekNotificationsCell.self,
            forCellReuseIdentifier: ThisWeekNotificationsCell.identifier
        )

        return table
    }()

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        addConstraints()
    }

    // MARK: - Private Method

    private func configureUI() {
        view.backgroundColor = .white
        navigationItem.title = Constants.textForTitleNavigationItem
        navigationController?.navigationBar.prefersLargeTitles = true
        view.addSubview(requestForLabelSubscription)
        view.addSubview(tableView)
    }

    private func addConstraints() {
        NSLayoutConstraint.activate([
            requestForLabelSubscription.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 13),
            requestForLabelSubscription.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16),
            requestForLabelSubscription.widthAnchor.constraint(equalToConstant: 251),
            requestForLabelSubscription.heightAnchor.constraint(equalToConstant: 17),

            tableView.topAnchor.constraint(equalTo: requestForLabelSubscription.bottomAnchor, constant: 0),
            tableView.leftAnchor.constraint(equalTo: view.leftAnchor),
            tableView.rightAnchor.constraint(equalTo: view.rightAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
    }
}

// MARK: - NotificationViewController + UITableViewDataSource

extension NotificationViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        switch notificationType[section] {
        case .today:
            return configureHeaderView(with: Constants.textForTodayHeader)
        case .thisweek:
            return configureHeaderView(with: Constants.textForThisWeekHeader)
        }

        func configureHeaderView(with text: String) -> UIView {
            let headerView = UIView()
            headerView.backgroundColor = UIColor.white
            let headerLabel = UILabel()
            headerLabel.font = UIFont(name: Constants.nameFontBold, size: 14)
            headerLabel.textColor = UIColor.black
            headerLabel.text = text
            headerLabel.frame = CGRect(
                x: 14, y: -5,
                width: tableView.bounds.size.width, height: 30
            )
            headerView.addSubview(headerLabel)
            return headerView
        }
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        notificationType.count
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch notificationType[section] {
        case .today:
            return notificationStorage.notificationToday.count
        case .thisweek:
            return notificationStorage.notificationThisWeek.count
        }
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch notificationType[indexPath.section] {
        case .today:
            guard let cell = tableView.dequeueReusableCell(
                withIdentifier: TodayNotificationsCell.identifier,
                for: indexPath
            ) as? TodayNotificationsCell else { return UITableViewCell() }
            cell.setupValue(with: notificationStorage.notificationToday[indexPath.row])

            return cell
        case .thisweek:
            guard let cell = tableView.dequeueReusableCell(
                withIdentifier: ThisWeekNotificationsCell.identifier,
                for: indexPath
            ) as? ThisWeekNotificationsCell else { return UITableViewCell() }
            cell.configureCell(with: notificationStorage.notificationThisWeek[indexPath.row])
            return cell
        }
    }
}

// MARK: - NotificationViewController + UITableViewDelegate

extension NotificationViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch notificationType[indexPath.section] {
        case .today:
            return 48
        case .thisweek:
            return 60
        }
    }
}
