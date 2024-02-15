// CatalogViewController.swift
// Copyright © RoadMap. All rights reserved.

// Иван
import UIKit

/// Экран католога
class CatalogViewController: UIViewController {
    // MARK: - Constants

    enum Constant {
        static let nameForNavigationTitle = "Каталог"
        static let genders = ["Женщинам", "Мужчинам", "Детям"]
    }

    // MARK: - Visual Components

    private let segmentController: UISegmentedControl = {
        let segmentController = UISegmentedControl(items: Constant.genders)
        segmentController.translatesAutoresizingMaskIntoConstraints = false

        return segmentController
    }()

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        configureConstraints()
    }

    // MARK: - Private Methods

    private func configureUI() {
        navigationItem.title = Constant.nameForNavigationTitle
        view.backgroundColor = .white
        view.addSubview(segmentController)
    }

    private func configureConstraints() {
        NSLayoutConstraint.activate([
            segmentController.leftAnchor.constraint(
                equalTo: view.leftAnchor,
                constant: 15
            ),
            segmentController.topAnchor.constraint(
                equalTo: view.topAnchor,
                constant: 122
            ),
            segmentController.widthAnchor.constraint(equalToConstant: 345),
            segmentController.heightAnchor.constraint(equalToConstant: 44)
        ])
    }
}
