// TrafficLightWhisNSLayoutConstraintController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Экран светофора с использованием NSLayoutConstraint
final class TrafficLightWhisNSLayoutConstraintController: UIViewController {
    // MARK: - Constants

    enum Constants {
        static let nameTitle = "NSLayoutConstraint"
    }

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
        configureDarkView()
        configureRedView()
        configureYelowView()
        configureGreenView()
        configureSize()
        view.layoutIfNeeded()
    }

    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        coordinator.animate(alongsideTransition: { [weak self] _ in
            guard let self = self else { return }
            self.setupSizeWhenRotatingDevice()
            self.view.layoutIfNeeded()
        }, completion: nil)
    }

    // MARK: - Private Method

    private func configureDarkView() {
        view.backgroundColor = .white
        title = Constants.nameTitle
        view.addSubview(darkView)

        NSLayoutConstraint(
            item: darkView,
            attribute: .centerX,
            relatedBy: .equal,
            toItem: view,
            attribute: .centerX,
            multiplier: 1,
            constant: 0
        ).isActive = true

        NSLayoutConstraint(
            item: darkView,
            attribute: .centerY,
            relatedBy: .equal,
            toItem: view,
            attribute: .centerY,
            multiplier: 1,
            constant: 0
        ).isActive = true
    }

    private func configureRedView() {
        view.addSubview(redView)

        NSLayoutConstraint(
            item: redView,
            attribute: .centerX,
            relatedBy: .equal,
            toItem: darkView,
            attribute: .centerX,
            multiplier: 1,
            constant: 0
        ).isActive = true

        NSLayoutConstraint(
            item: redView,
            attribute: .topMargin,
            relatedBy: .equal,
            toItem: darkView,
            attribute: .topMargin,
            multiplier: 1,
            constant: 15
        ).isActive = true
    }

    private func configureYelowView() {
        view.addSubview(yellowView)

        NSLayoutConstraint(
            item: yellowView,
            attribute: .centerX,
            relatedBy: .equal,
            toItem: darkView,
            attribute: .centerX,
            multiplier: 1,
            constant: 0
        ).isActive = true

        NSLayoutConstraint(
            item: yellowView,
            attribute: .top,
            relatedBy: .equal,
            toItem: redView,
            attribute: .bottom,
            multiplier: 1,
            constant: 8
        ).isActive = true
    }

    private func configureGreenView() {
        view.addSubview(greenView)

        NSLayoutConstraint(
            item: greenView,
            attribute: .centerX,
            relatedBy: .equal,
            toItem: darkView,
            attribute: .centerX,
            multiplier: 1,
            constant: 0
        ).isActive = true

        NSLayoutConstraint(
            item: greenView,
            attribute: .top,
            relatedBy: .equal,
            toItem: yellowView,
            attribute: .bottom,
            multiplier: 1,
            constant: 8
        ).isActive = true
    }

    /// задаем ширину и высоту новым переменным для всех вью, чтобы при повороте экрана инициализировать им новые
    /// значения
    private func configureSize() {
        heightForDarkViewConstraint = NSLayoutConstraint(
            item: darkView,
            attribute: .height,
            relatedBy: .equal,
            toItem: nil,
            attribute: .notAnAttribute,
            multiplier: 1,
            constant: 546
        )
        heightForDarkViewConstraint.isActive = true
        widthForDarkViewConstraint = NSLayoutConstraint(
            item: darkView,
            attribute: .width,
            relatedBy: .equal,
            toItem: nil,
            attribute: .notAnAttribute,
            multiplier: 1,
            constant: 220
        )
        widthForDarkViewConstraint.isActive = true

        heightForRedViewConstraint = NSLayoutConstraint(
            item: redView,
            attribute: .height,
            relatedBy: .equal,
            toItem: nil,
            attribute: .notAnAttribute,
            multiplier: 1,
            constant: 170
        )
        heightForRedViewConstraint.isActive = true
        widthForRedViewConstraint = NSLayoutConstraint(
            item: redView,
            attribute: .width,
            relatedBy: .equal,
            toItem: nil,
            attribute: .notAnAttribute,
            multiplier: 1,
            constant: 170
        )
        widthForRedViewConstraint.isActive = true

        heightForYellowViewConstraint = NSLayoutConstraint(
            item: yellowView,
            attribute: .height,
            relatedBy: .equal,
            toItem: nil,
            attribute: .notAnAttribute,
            multiplier: 1,
            constant: 170
        )
        heightForYellowViewConstraint.isActive = true
        widthForYellowViewConstraint = NSLayoutConstraint(
            item: yellowView,
            attribute: .width,
            relatedBy: .equal,
            toItem: nil,
            attribute: .notAnAttribute,
            multiplier: 1,
            constant: 170
        )
        widthForYellowViewConstraint.isActive = true

        heightForGreenViewConstraint = NSLayoutConstraint(
            item: greenView,
            attribute: .height,
            relatedBy: .equal,
            toItem: nil,
            attribute: .notAnAttribute,
            multiplier: 1,
            constant: 170
        )
        heightForGreenViewConstraint.isActive = true
        widthForGreenViewConstraint = NSLayoutConstraint(
            item: greenView,
            attribute: .width,
            relatedBy: .equal,
            toItem: nil,
            attribute: .notAnAttribute,
            multiplier: 1,
            constant: 170
        )
        widthForGreenViewConstraint.isActive = true
    }

    /// устанавливаем новые размеры Views при повороте экрана
    private func setupSizeWhenRotatingDevice() {
        if UIDevice.current.orientation.isLandscape {
            heightForDarkViewConstraint = NSLayoutConstraint(
                item: darkView,
                attribute: .height,
                relatedBy: .equal,
                toItem: nil,
                attribute: .notAnAttribute,
                multiplier: 1,
                constant: 290
            )
            heightForDarkViewConstraint.isActive = true
            widthForDarkViewConstraint = NSLayoutConstraint(
                item: darkView,
                attribute: .width,
                relatedBy: .equal,
                toItem: nil,
                attribute: .notAnAttribute,
                multiplier: 1,
                constant: 140
            )

            heightForRedViewConstraint = NSLayoutConstraint(
                item: redView,
                attribute: .height,
                relatedBy: .equal,
                toItem: nil,
                attribute: .notAnAttribute,
                multiplier: 1,
                constant: 90
            )
            heightForRedViewConstraint.isActive = true
            widthForRedViewConstraint = NSLayoutConstraint(
                item: redView,
                attribute: .width,
                relatedBy: .equal,
                toItem: nil,
                attribute: .notAnAttribute,
                multiplier: 1,
                constant: 90
            )
            widthForRedViewConstraint.isActive = true
            NSLayoutConstraint(
                item: redView,
                attribute: .topMargin,
                relatedBy: .equal,
                toItem: darkView,
                attribute: .topMargin,
                multiplier: 1,
                constant: 1
            ).isActive = true

            heightForYellowViewConstraint = NSLayoutConstraint(
                item: yellowView,
                attribute: .height,
                relatedBy: .equal,
                toItem: nil,
                attribute: .notAnAttribute,
                multiplier: 1,
                constant: 90
            )
            heightForYellowViewConstraint.isActive = true
            widthForYellowViewConstraint = NSLayoutConstraint(
                item: yellowView,
                attribute: .width,
                relatedBy: .equal,
                toItem: nil,
                attribute: .notAnAttribute,
                multiplier: 1,
                constant: 90
            )
            widthForYellowViewConstraint.isActive = true

            heightForGreenViewConstraint = NSLayoutConstraint(
                item: greenView,
                attribute: .height,
                relatedBy: .equal,
                toItem: nil,
                attribute: .notAnAttribute,
                multiplier: 1,
                constant: 90
            )
            heightForGreenViewConstraint.isActive = true
            widthForGreenViewConstraint = NSLayoutConstraint(
                item: greenView,
                attribute: .width,
                relatedBy: .equal,
                toItem: nil,
                attribute: .notAnAttribute,
                multiplier: 1,
                constant: 90
            )
            widthForGreenViewConstraint.isActive = true

            redView.layer.cornerRadius = 45
            yellowView.layer.cornerRadius = 45
            greenView.layer.cornerRadius = 45

        } else if UIDevice.current.orientation.isPortrait {
            heightForDarkViewConstraint = NSLayoutConstraint(
                item: darkView,
                attribute: .height,
                relatedBy: .equal,
                toItem: nil,
                attribute: .notAnAttribute,
                multiplier: 1,
                constant: 546
            )
            heightForDarkViewConstraint.isActive = true
            widthForDarkViewConstraint = NSLayoutConstraint(
                item: darkView,
                attribute: .width,
                relatedBy: .equal,
                toItem: nil,
                attribute: .notAnAttribute,
                multiplier: 1,
                constant: 220
            )
            widthForDarkViewConstraint.isActive = true

            heightForRedViewConstraint = NSLayoutConstraint(
                item: redView,
                attribute: .height,
                relatedBy: .equal,
                toItem: nil,
                attribute: .notAnAttribute,
                multiplier: 1,
                constant: 170
            )
            heightForRedViewConstraint.isActive = true
            widthForRedViewConstraint = NSLayoutConstraint(
                item: redView,
                attribute: .width,
                relatedBy: .equal,
                toItem: nil,
                attribute: .notAnAttribute,
                multiplier: 1,
                constant: 170
            )
            widthForRedViewConstraint.isActive = true

            heightForYellowViewConstraint = NSLayoutConstraint(
                item: yellowView,
                attribute: .height,
                relatedBy: .equal,
                toItem: nil,
                attribute: .notAnAttribute,
                multiplier: 1,
                constant: 170
            )
            heightForYellowViewConstraint.isActive = true
            widthForYellowViewConstraint = NSLayoutConstraint(
                item: yellowView,
                attribute: .width,
                relatedBy: .equal,
                toItem: nil,
                attribute: .notAnAttribute,
                multiplier: 1,
                constant: 170
            )
            widthForYellowViewConstraint.isActive = true

            heightForGreenViewConstraint = NSLayoutConstraint(
                item: greenView,
                attribute: .height,
                relatedBy: .equal,
                toItem: nil,
                attribute: .notAnAttribute,
                multiplier: 1,
                constant: 170
            )
            heightForGreenViewConstraint.isActive = true
            widthForGreenViewConstraint = NSLayoutConstraint(
                item: greenView,
                attribute: .width,
                relatedBy: .equal,
                toItem: nil,
                attribute: .notAnAttribute,
                multiplier: 1,
                constant: 170
            )
            widthForGreenViewConstraint.isActive = true

            redView.layer.cornerRadius = 85
            yellowView.layer.cornerRadius = 85
            greenView.layer.cornerRadius = 85
        }
    }
}
