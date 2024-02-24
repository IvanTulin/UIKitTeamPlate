// TrafficLightThisNSLayoutAnchorController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Экран светофора с использованием NSLayoutAnchor
class TrafficLightThisNSLayoutAnchorController: UIViewController {
    // MARK: - Visual Components

    private let darkView: UIView = {
        let view = UIView()
        view.backgroundColor = .darkGray
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private let redView: UIView = {
        let view = UIView()
        view.backgroundColor = .red
        view.layer.cornerRadius = 85
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private let yellowView: UIView = {
        let view = UIView()
        view.backgroundColor = .yellow
        view.layer.cornerRadius = 85
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private let greenView: UIView = {
        let view = UIView()
        view.backgroundColor = .green
        view.layer.cornerRadius = 85
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    // MARK: - Properties

    var heightForDarkViewConstraint: NSLayoutConstraint!
    var widthForDarkViewConstraint: NSLayoutConstraint!

    var heightForRedViewConstraint: NSLayoutConstraint!
    var widthForRedViewConstraint: NSLayoutConstraint!

    var heightForYellowViewConstraint: NSLayoutConstraint!
    var widthForYellowViewConstraint: NSLayoutConstraint!

    var heightForGreenViewConstraint: NSLayoutConstraint!
    var widthForGreenViewConstraint: NSLayoutConstraint!

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
        configureColoredViews()
        configureSize()
    }

    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        coordinator.animate(alongsideTransition: { [weak self] _ in
            guard let self = self else { return }
            self.setupSizeWhenRotatingDevice()
            self.view.layoutIfNeeded()
        }, completion: nil)
        super.viewWillTransition(to: size, with: coordinator)
    }

    // MARK: - Private Method

    private func configureView() {
        view.backgroundColor = .gray
        view.addSubview(darkView)

        darkView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        darkView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }

    private func configureColoredViews() {
        darkView.addSubview(redView)
        darkView.addSubview(yellowView)
        darkView.addSubview(greenView)

        redView.centerXAnchor.constraint(equalTo: darkView.centerXAnchor).isActive = true
        redView.topAnchor.constraint(equalTo: darkView.topAnchor, constant: 15).isActive = true

        yellowView.centerXAnchor.constraint(equalTo: darkView.centerXAnchor).isActive = true
        yellowView.topAnchor.constraint(equalTo: redView.bottomAnchor, constant: 8).isActive = true

        greenView.centerXAnchor.constraint(equalTo: darkView.centerXAnchor).isActive = true
        greenView.topAnchor.constraint(equalTo: yellowView.bottomAnchor, constant: 8).isActive = true
    }

    /// задаем ширину и высоту новым переменным для всех вью, чтобы при повороте экрана инициализировать им новые
    /// значения
    private func configureSize() {
        heightForDarkViewConstraint = darkView.heightAnchor.constraint(equalToConstant: 546)
        heightForDarkViewConstraint.isActive = true
        widthForDarkViewConstraint = darkView.widthAnchor.constraint(equalToConstant: 220)
        widthForDarkViewConstraint.isActive = true

        heightForRedViewConstraint = redView.heightAnchor.constraint(equalToConstant: 170)
        heightForRedViewConstraint.isActive = true
        widthForRedViewConstraint = redView.widthAnchor.constraint(equalToConstant: 170)
        widthForRedViewConstraint.isActive = true

        heightForYellowViewConstraint = yellowView.heightAnchor.constraint(equalToConstant: 170)
        heightForYellowViewConstraint.isActive = true
        widthForYellowViewConstraint = yellowView.widthAnchor.constraint(equalToConstant: 170)
        widthForYellowViewConstraint.isActive = true

        heightForGreenViewConstraint = greenView.heightAnchor.constraint(equalToConstant: 170)
        heightForGreenViewConstraint.isActive = true
        widthForGreenViewConstraint = greenView.widthAnchor.constraint(equalToConstant: 170)
        widthForGreenViewConstraint.isActive = true
    }

    /// устанавливаем новые размеры Views при повороте экрана
    private func setupSizeWhenRotatingDevice() {
        if UIDevice.current.orientation.isLandscape {
            heightForDarkViewConstraint.constant = 316
            widthForDarkViewConstraint.constant = 140
            heightForRedViewConstraint.constant = 90
            widthForRedViewConstraint.constant = 90
            heightForYellowViewConstraint.constant = 90
            widthForYellowViewConstraint.constant = 90
            heightForGreenViewConstraint.constant = 90
            widthForGreenViewConstraint.constant = 90
            redView.layer.cornerRadius = 45
            yellowView.layer.cornerRadius = 45
            greenView.layer.cornerRadius = 45
        } else {
            heightForDarkViewConstraint.constant = 546
            widthForDarkViewConstraint.constant = 220
            heightForRedViewConstraint.constant = 170
            widthForRedViewConstraint.constant = 170
            heightForYellowViewConstraint.constant = 170
            widthForYellowViewConstraint.constant = 170
            heightForGreenViewConstraint.constant = 170
            widthForGreenViewConstraint.constant = 170
            redView.layer.cornerRadius = 85
            yellowView.layer.cornerRadius = 85
            greenView.layer.cornerRadius = 85
        }
    }
}
