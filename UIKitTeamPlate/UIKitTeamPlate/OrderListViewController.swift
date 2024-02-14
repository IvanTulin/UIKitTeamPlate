// OrderListViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Переход на корневой контроллер
protocol RootableDelegate: AnyObject {
    /// Уведомление, что контроллер только что был закртыт
    func didDismissModal()
}

/// Экран счета
final class OrderListViewController: UIViewController {
    // MARK: - Constants

    enum Constants {
        static let nameForLeftTraceryImage = "leftTraceryImage"
        static let nameForRightTraceryImage = "rightTraceryImage"
        static let nameFontName = "Verdana"
        static let nameFontBold = "Verdana-Bold"
        static let titleForYourOrderLabel = "Вашъ Заказъ"
        static let nameImageForBottomTracery = "bottomTraceryImage"
        static let titleForPaymentButton = "Оплатить"
        static let nameImageForExitButton = "cross"

        static let textForNameCoffee = "Название кофе"
        static let textForCostCoffee = "0 руб"
        static let textForMilkIndgredient = "Молоко"
        static let textForCostMilkLabel = "0 руб"
        static let textForSyrupIndgredient = "Сироп"
        static let textForCostSyrup = "0 руб"
        static let textForSoyMilkIndgredient = "Молоко соевое"
        static let textForCostSoyMilk = "0 руб"
        static let textForAlmondMilkIndgredient = "Молоко миндальное"
        static let textForCostAlmondMilkLabel = "0 руб"
        static let textForEspressoIndgredient = "Эспрессо"
        static let textForCostEspresso = "0 руб"
        static let textForResultCostLabel = "Цѣна - 0 руб"
    }

    // MARK: - Visual Components

    private let leftTraceryImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: Constants.nameForLeftTraceryImage)
        imageView.frame = CGRect(x: 20, y: 48, width: 0, height: 0)
        imageView.sizeToFit()
        return imageView
    }()

    private let rightTraceryImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: Constants.nameForRightTraceryImage)
        imageView.frame = CGRect(x: 260, y: 48, width: 0, height: 0)
        imageView.sizeToFit()
        return imageView
    }()

    private let yourOrderLabel: UILabel = {
        let label = UILabel()
        return label.createCustomLabel(
            text: Constants.titleForYourOrderLabel,
            color: .black,
            fontName: Constants.nameFontBold,
            fontSize: 18,
            frame: CGRect(x: 120, y: 100, width: 140, height: 30)
        )
    }()

    private let bottomTraceryImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: Constants.nameImageForBottomTracery)
        imageView.frame = CGRect(x: 145, y: 472, width: 0, height: 0)
        imageView.sizeToFit()
        return imageView
    }()

    private lazy var paymentButton: UIButton = {
        let button = UIButton()
        button.setTitle(Constants.titleForPaymentButton, for: .normal)
        button.titleLabel?.font = UIFont(
            name: Constants.nameFontBold,
            size: 16
        )
        button.tintColor = .white
        button.backgroundColor = .appTurquoise
        button.frame = CGRect(x: 20, y: 632, width: 345, height: 53)
        button.layer.cornerRadius = 10
        button.addTarget(
            self,
            action: #selector(showClosingViewController),
            for: .touchUpInside
        )
        return button
    }()

    private lazy var exitButton: UIButton = {
        let exitButton = UIButton()
        exitButton.setImage(UIImage(named: Constants.nameImageForExitButton), for: .normal)
        exitButton.tintColor = .black
        exitButton.addTarget(
            self,
            action: #selector(exitOrderController),
            for: .touchUpInside
        )
        return exitButton
    }()

    // MARK: - Properties

    var nameCoffeeLabel: UILabel = {
        let label = UILabel()
        return label.createCustomLabel(
            text: Constants.textForNameCoffee,
            color: .black,
            fontName: Constants.nameFontBold,
            fontSize: 16,
            frame: CGRect(x: 20, y: 155, width: 150, height: 30)
        )
    }()

    var costCoffeeLabel: UILabel = {
        let label = UILabel()
        return label.createCustomLabel(
            text: Constants.textForCostCoffee,
            color: .black,
            fontName: Constants.nameFontBold,
            fontSize: 16,
            frame: CGRect(x: 215, y: 155, width: 150, height: 30),
            textAlignment: .right
        )
    }()

    var milkIndgredientLabel: UILabel = {
        let label = UILabel()
        return label.createCustomLabel(
            text: Constants.textForMilkIndgredient,
            color: .black,
            fontName: Constants.nameFontName,
            fontSize: 16,
            frame: CGRect(x: 20, y: 191, width: 150, height: 30)
        )
    }()

    var costMilkLabel: UILabel = {
        let label = UILabel()
        return label.createCustomLabel(
            text: Constants.textForCostMilkLabel,
            color: .black,
            fontName: Constants.nameFontName,
            fontSize: 16,
            frame: CGRect(x: 215, y: 191, width: 150, height: 30),
            textAlignment: .right
        )
    }()

    var syrupIndgredientLabel: UILabel = {
        let label = UILabel()
        return label.createCustomLabel(
            text: Constants.textForSyrupIndgredient,
            color: .black,
            fontName: Constants.nameFontName,
            fontSize: 16,
            frame: CGRect(x: 20, y: 227, width: 150, height: 30)
        )
    }()

    var costSyrupLabel: UILabel = {
        let label = UILabel()
        return label.createCustomLabel(
            text: Constants.textForCostSyrup,
            color: .black,
            fontName: Constants.nameFontName,
            fontSize: 16,
            frame: CGRect(x: 215, y: 227, width: 150, height: 30),
            textAlignment: .right
        )
    }()

    var soyMilkIndgredientLabel: UILabel = {
        let label = UILabel()
        return label.createCustomLabel(
            text: Constants.textForSoyMilkIndgredient,
            color: .black,
            fontName: Constants.nameFontName,
            fontSize: 16,
            frame: CGRect(x: 20, y: 263, width: 150, height: 30)
        )
    }()

    var costSoyMilkLabel: UILabel = {
        let label = UILabel()
        return label.createCustomLabel(
            text: Constants.textForCostSoyMilk,
            color: .black,
            fontName: Constants.nameFontName,
            fontSize: 16,
            frame: CGRect(x: 215, y: 263, width: 150, height: 30),
            textAlignment: .right
        )
    }()

    var almondMilkIndgredientLabel: UILabel = {
        let label = UILabel()
        return label.createCustomLabel(
            text: Constants.textForAlmondMilkIndgredient,
            color: .black,
            fontName: Constants.nameFontName,
            fontSize: 16,
            frame: CGRect(x: 20, y: 299, width: 170, height: 30)
        )
    }()

    var costAlmondMilkLabel: UILabel = {
        let label = UILabel()
        return label.createCustomLabel(
            text: Constants.textForCostAlmondMilkLabel,
            color: .black,
            fontName: Constants.nameFontName,
            fontSize: 16,
            frame: CGRect(x: 215, y: 299, width: 150, height: 30),
            textAlignment: .right
        )
    }()

    var espressoIndgredientLabel: UILabel = {
        let label = UILabel()
        return label.createCustomLabel(
            text: Constants.textForEspressoIndgredient,
            color: .black,
            fontName: Constants.nameFontName,
            fontSize: 16,
            frame: CGRect(x: 20, y: 335, width: 150, height: 30)
        )
    }()

    var costEspressoLabel: UILabel = {
        let label = UILabel()
        return label.createCustomLabel(
            text: Constants.textForCostEspresso,
            color: .black,
            fontName: Constants.nameFontName,
            fontSize: 16,
            frame: CGRect(x: 215, y: 335, width: 150, height: 30),
            textAlignment: .right
        )
    }()

    var resultCostLabel: UILabel = {
        let label = UILabel()
        return label.createCustomLabel(
            text: Constants.textForResultCostLabel,
            fontName: Constants.nameFontBold,
            fontSize: 18,
            frame: CGRect(x: 80, y: 433, width: 231, height: 30),
            textAlignment: .center
        )
    }()

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }

    // MARK: - Private Methods

    /// добавляем и конфигурируем UI элементы на контроллер
    private func configureUI() {
        view.backgroundColor = .white

        view.addSubview(leftTraceryImageView)
        view.addSubview(rightTraceryImageView)
        view.addSubview(yourOrderLabel)

        view.addSubview(nameCoffeeLabel)
        view.addSubview(milkIndgredientLabel)
        view.addSubview(syrupIndgredientLabel)
        view.addSubview(soyMilkIndgredientLabel)
        view.addSubview(almondMilkIndgredientLabel)
        view.addSubview(espressoIndgredientLabel)

        view.addSubview(costCoffeeLabel)
        view.addSubview(costMilkLabel)
        view.addSubview(costSyrupLabel)
        view.addSubview(costSoyMilkLabel)
        view.addSubview(costAlmondMilkLabel)
        view.addSubview(costEspressoLabel)

        view.addSubview(resultCostLabel)
        view.addSubview(bottomTraceryImageView)
        view.addSubview(paymentButton)

        let buttomItem = UIBarButtonItem(customView: exitButton)
        navigationItem.leftBarButtonItem = buttomItem
        navigationController?.navigationBar.isHidden = false
    }

    /// Создаем переход на экран спасибо
    @objc private func showClosingViewController() {
        let closingViewController = ClosingViewController()
        // navigationController?.pushViewController(closingVC, animated: true)
        closingViewController.delegate = self
        closingViewController.modalPresentationStyle = .fullScreen
        present(closingViewController, animated: true)
    }

    /// вернуться на экран меню кофе
    @objc private func exitOrderController() {
        navigationController?.popViewController(animated: true)
    }
}

/// Расширение, реализующее возврат в корневой контроллер
extension OrderListViewController: RootableDelegate {
    func didDismissModal() {
        navigationController?.popToRootViewController(animated: true)
    }
}
