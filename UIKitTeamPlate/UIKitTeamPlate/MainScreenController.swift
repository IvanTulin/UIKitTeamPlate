// MainScreenController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Стартовый экран
final class MainScreenController: UIViewController {
    // MARK: - Visual Components

    private lazy var showTrafficLightStoryboardButton: UIButton = {
        let button = UIButton()
        button.setTitle("Светофор созданный Storybord", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 10
        button.sizeToFit()
        button.addTarget(self, action: #selector(showTrafficLightStoryboard), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    private lazy var showStackViewTrafficLightButton: UIButton = {
        let button = UIButton()
        button.setTitle("Светофор со StackView", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .orange
        button.layer.cornerRadius = 10
        button.sizeToFit()
        button.addTarget(self, action: #selector(showStackViewTrafficLight), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    private lazy var showTrafficLightNSLayoutAnchorButton: UIButton = {
        let button = UIButton()
        button.setTitle("Светофор с NSLayoutAnchor", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .lightGray
        button.layer.cornerRadius = 10
        button.sizeToFit()
        button.addTarget(self, action: #selector(showTrafficLightNSLayoutAnchor), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        configureButtons()
    }

    // MARK: - Private Methods

    private func configureButtons() {
        view.backgroundColor = .white
        view.addSubview(showTrafficLightStoryboardButton)
        view.addSubview(showStackViewTrafficLightButton)
        view.addSubview(showTrafficLightNSLayoutAnchorButton)

        NSLayoutConstraint.activate([
            showTrafficLightStoryboardButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            showTrafficLightStoryboardButton.topAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.topAnchor,
                constant: 90
            ),

            showStackViewTrafficLightButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            showStackViewTrafficLightButton.topAnchor.constraint(
                equalTo: showTrafficLightStoryboardButton.bottomAnchor,
                constant: 35
            ),

            showTrafficLightNSLayoutAnchorButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            showTrafficLightNSLayoutAnchorButton.topAnchor.constraint(
                equalTo: showStackViewTrafficLightButton.bottomAnchor,
                constant: 35
            ),
        ])
    }

    @objc private func showTrafficLightStoryboard() {
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        guard let trafficLightStoryboardController = storyBoard
            .instantiateViewController(
                identifier: "TrafficLightStoryboardController"
            ) as? TrafficLightStoryboardController
        else { return }
        navigationController?.pushViewController(trafficLightStoryboardController, animated: true)
    }

    @objc private func showStackViewTrafficLight() {
        let stackViewTrafficLightController = StackViewTrafficLightController()
        navigationController?.pushViewController(stackViewTrafficLightController, animated: true)
    }

    @objc private func showTrafficLightNSLayoutAnchor() {
        let trafficLightThisNSLayoutAnchorController = TrafficLightThisNSLayoutAnchorController()
        navigationController?.pushViewController(trafficLightThisNSLayoutAnchorController, animated: true)
    }
}
