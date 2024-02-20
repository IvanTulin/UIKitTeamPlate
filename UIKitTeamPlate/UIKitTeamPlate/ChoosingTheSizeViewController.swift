// ChoosingTheSizeViewController.swift
// Copyright © RoadMap. All rights reserved.

// Иван
import UIKit

/// Экран выбора размера
final class ChoosingTheSizeViewController: UIViewController {
    // MARK: - Constants

    enum Constant {
        static let nameFontName = "Verdana"
        static let nameFontBold = "Verdana-Bold"
        static let textForChooseSizeLabel = "Выберите размер"
        static let textForThirtyFifthSizeLabel = "35 EU"
        static let textForThirtySixSizeLabel = "36 EU"
        static let textForThirtySevenSizeLabel = "37 EU"
        static let textForThirtyEightLabel = "38 EU"
        static let textForThirtyNineLabel = "39 EU"
    }

    // MARK: - Visual Components

    private let chooseSizeLabel: UILabel = {
        let label = UILabel()
        label.text = Constant.textForChooseSizeLabel
        label.textAlignment = .center
        label.font = UIFont(name: Constant.nameFontBold, size: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let labelIsThirtyFifthSize: UILabel = {
        let label = UILabel()
        label.text = Constant.textForThirtyFifthSizeLabel
        label.font = UIFont(name: Constant.nameFontName, size: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let bottomLineThirtyFifthSize: CALayer = {
        let layer = CALayer()
        layer.backgroundColor = UIColor.systemGray5.cgColor
        layer.frame = CGRect(x: 20, y: 103, width: 335, height: 1)
        return layer
    }()

    private let labelIsThirtySixSize: UILabel = {
        let label = UILabel()
        label.text = Constant.textForThirtySixSizeLabel
        label.font = UIFont(name: Constant.nameFontName, size: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let bottomLineThirtySixSize: CALayer = {
        let layer = CALayer()
        layer.backgroundColor = UIColor.systemGray5.cgColor
        layer.frame = CGRect(x: 20, y: 140, width: 335, height: 1)
        return layer
    }()

    private let labelIsThirtySevenSize: UILabel = {
        let label = UILabel()
        label.text = Constant.textForThirtySevenSizeLabel
        label.font = UIFont(name: Constant.nameFontName, size: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let bottomLineThirtySevenSize: CALayer = {
        let layer = CALayer()
        layer.backgroundColor = UIColor.systemGray5.cgColor
        layer.frame = CGRect(x: 20, y: 177, width: 335, height: 1)
        return layer
    }()

    private let labelIsThirtyEightSize: UILabel = {
        let label = UILabel()
        label.text = Constant.textForThirtyEightLabel
        label.font = UIFont(name: Constant.nameFontName, size: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let bottomLineThirtyEightSize: CALayer = {
        let layer = CALayer()
        layer.backgroundColor = UIColor.systemGray5.cgColor
        layer.frame = CGRect(x: 20, y: 214, width: 335, height: 1)
        return layer
    }()

    private let labelIsThirtyNineSize: UILabel = {
        let label = UILabel()
        label.text = Constant.textForThirtyNineLabel
        label.font = UIFont(name: Constant.nameFontName, size: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let bottomLineThirtyNineSize: CALayer = {
        let layer = CALayer()
        layer.backgroundColor = UIColor.systemGray5.cgColor
        layer.frame = CGRect(x: 20, y: 251, width: 335, height: 1)
        return layer
    }()

    private lazy var backButton: UIButton = {
        let backButton = UIButton()
        backButton.setImage(.cross, for: .normal)
        backButton.sizeToFit()
        backButton.translatesAutoresizingMaskIntoConstraints = false
        backButton.addTarget(
            self,
            action: #selector(returnChoosingShoesViewController),
            for: .touchUpInside
        )
        return backButton
    }()

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        configureConstrints()
    }

    // MARK: - Private Methods

    private func configureUI() {
        view.backgroundColor = .white
        view.addSubview(chooseSizeLabel)
        view.addSubview(labelIsThirtyFifthSize)
        view.addSubview(backButton)
        view.addSubview(labelIsThirtySixSize)
        view.addSubview(labelIsThirtySevenSize)
        view.addSubview(labelIsThirtyEightSize)
        view.addSubview(labelIsThirtyNineSize)
        view.layer.addSublayer(bottomLineThirtyFifthSize)
        view.layer.addSublayer(bottomLineThirtySixSize)
        view.layer.addSublayer(bottomLineThirtySevenSize)
        view.layer.addSublayer(bottomLineThirtyEightSize)
        view.layer.addSublayer(bottomLineThirtyNineSize)
    }

    private func configureConstrints() {
        NSLayoutConstraint.activate([
            backButton.leftAnchor.constraint(
                equalTo: view.leftAnchor,
                constant: 20
            ),
            backButton.topAnchor.constraint(
                equalTo: view.topAnchor,
                constant: 26
            ),

            chooseSizeLabel.leftAnchor.constraint(
                equalTo: backButton.rightAnchor,
                constant: 53
            ),
            chooseSizeLabel.topAnchor.constraint(
                equalTo: view.topAnchor,
                constant: 11
            ),
            chooseSizeLabel.widthAnchor.constraint(equalToConstant: 200),
            chooseSizeLabel.heightAnchor.constraint(equalToConstant: 44),

            labelIsThirtyFifthSize.leftAnchor.constraint(
                equalTo: view.leftAnchor,
                constant: 20
            ),
            labelIsThirtyFifthSize.topAnchor.constraint(
                equalTo: chooseSizeLabel.bottomAnchor,
                constant: 22
            ),
            labelIsThirtyFifthSize.widthAnchor.constraint(equalToConstant: 278),
            labelIsThirtyFifthSize.heightAnchor.constraint(equalToConstant: 19),

            labelIsThirtySixSize.leftAnchor.constraint(
                equalTo: view.leftAnchor,
                constant: 20
            ),
            labelIsThirtySixSize.topAnchor.constraint(
                equalTo: labelIsThirtyFifthSize.bottomAnchor,
                constant: 18
            ),
            labelIsThirtySixSize.widthAnchor.constraint(equalToConstant: 278),
            labelIsThirtySixSize.heightAnchor.constraint(equalToConstant: 19),

            labelIsThirtySevenSize.leftAnchor.constraint(
                equalTo: view.leftAnchor,
                constant: 20
            ),
            labelIsThirtySevenSize.topAnchor.constraint(
                equalTo: labelIsThirtySixSize.bottomAnchor,
                constant: 18
            ),
            labelIsThirtySevenSize.widthAnchor.constraint(equalToConstant: 278),
            labelIsThirtySevenSize.heightAnchor.constraint(equalToConstant: 19),

            labelIsThirtyEightSize.leftAnchor.constraint(
                equalTo: view.leftAnchor,
                constant: 20
            ),
            labelIsThirtyEightSize.topAnchor.constraint(
                equalTo: labelIsThirtySevenSize.bottomAnchor,
                constant: 18
            ),
            labelIsThirtyEightSize.widthAnchor.constraint(equalToConstant: 278),
            labelIsThirtyEightSize.heightAnchor.constraint(equalToConstant: 19),

            labelIsThirtyNineSize.leftAnchor.constraint(
                equalTo: view.leftAnchor,
                constant: 20
            ),
            labelIsThirtyNineSize.topAnchor.constraint(
                equalTo: labelIsThirtyEightSize.bottomAnchor,
                constant: 18
            ),
            labelIsThirtyNineSize.widthAnchor.constraint(equalToConstant: 278),
            labelIsThirtyNineSize.heightAnchor.constraint(equalToConstant: 19),
        ])
    }

    @objc private func returnChoosingShoesViewController() {
        dismiss(animated: true)
    }
}
