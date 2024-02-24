// TrafficLightStoryboardController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Экран светофора созданный сторибордом
final class TrafficLightStoryboardController: UIViewController {
    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
    }

    // MARK: - Private Methods

    private func configureView() {
        view.backgroundColor = .lightGray
    }
}
