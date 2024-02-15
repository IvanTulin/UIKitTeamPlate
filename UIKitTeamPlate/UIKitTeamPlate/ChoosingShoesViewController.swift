// ChoosingShoesViewController.swift
// Copyright © RoadMap. All rights reserved.

// Иван
import UIKit

/// Экран выбора обуви
class ChoosingShoesViewController: UIViewController {
    // MARK: - Constants

    enum Constant {
        static let nameForTitleNavigationItem = "Обувь"
    }

    private lazy var backButton: UIButton = {
        let button = UIButton()
        button.setImage(.backButton, for: .normal)
        button.sizeToFit()
        button.addTarget(self, action: #selector(returnCatalogViewController), for: .touchUpInside)
        return button
    }()

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        configureNavigationItem()
        configureUI()
    }

    // MARK: - Private Methods

    private func configureUI() {
        view.backgroundColor = .white
    }

    private func configureNavigationItem() {
        navigationItem.title = Constant.nameForTitleNavigationItem
        let barButtonItem = UIBarButtonItem(customView: backButton)
        navigationItem.leftBarButtonItem = barButtonItem
    }

    @objc private func returnCatalogViewController() {
        navigationController?.popViewController(animated: true)
    }
}
