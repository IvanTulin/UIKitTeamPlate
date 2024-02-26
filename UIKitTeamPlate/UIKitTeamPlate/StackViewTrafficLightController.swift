// StackViewTrafficLightController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Экран Светофора с использованием StackView
final class StackViewTrafficLightController: UIViewController {
    // MARK: - Constants

    enum Constants {
        static let nameTitle = "StackView"
    }

    // MARK: - Visual Components

    private lazy var stackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [redView, yellowView, greenView])
        stackView.axis = .vertical
        stackView.backgroundColor = .darkGray
        stackView.spacing = 8
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()

    private let redView: UIView = {
        let view = UIView()
        view.backgroundColor = .red
        view.layer.cornerRadius = 55
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private let yellowView: UIView = {
        let view = UIView()
        view.backgroundColor = .yellow
        view.layer.cornerRadius = 55
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private let greenView: UIView = {
        let view = UIView()
        view.backgroundColor = .green
        view.layer.cornerRadius = 55
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        configureStackView()
        configureViews()
    }

    // MARK: - Private Methods

    private func configureStackView() {
        view.backgroundColor = .white
        view.addSubview(stackView)
        title = Constants.nameTitle

        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
//            stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 218),
//            stackView.widthAnchor.constraint(equalToConstant: 160),
//            stackView.heightAnchor.constraint(equalToConstant: 376)
        ])
    }

    private func configureViews() {
        stackView.addSubview(redView)
        stackView.addSubview(redView)
        stackView.addSubview(redView)

        NSLayoutConstraint.activate([
            redView.widthAnchor.constraint(equalToConstant: 110),
            redView.heightAnchor.constraint(equalToConstant: 110),

            yellowView.widthAnchor.constraint(equalToConstant: 110),
            yellowView.heightAnchor.constraint(equalToConstant: 110),

            greenView.widthAnchor.constraint(equalToConstant: 110),
            greenView.heightAnchor.constraint(equalToConstant: 110),
        ])
    }
}
