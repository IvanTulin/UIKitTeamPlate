// TrafficLightStoryboardController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Экран светофора созданный сторибордом
final class TrafficLightStoryboardController: UIViewController {
    // MARK: - Constants

    enum Constants {
        static let nameTitle = "Storyboard"
    }

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
    }

    // MARK: - Private Methods

    private func configureView() {
        view.backgroundColor = .lightGray
        title = Constants.nameTitle
    }
}
