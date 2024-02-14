// OrderListViewController.swift
// Copyright © RoadMap. All rights reserved.

// Иван
import UIKit

/// Экран счета
final class OrderListViewController: UIViewController {
    // MARK: - Visual Components

    /// Изображение левого узора
    private let leftTraceryImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "leftTraceryImage")
        imageView.frame = CGRect(x: 20, y: 48, width: 0, height: 0)
        imageView.sizeToFit()
        return imageView
    }()

    /// Изображение правого узора
    private let rightTraceryImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "rightTraceryImage")
        imageView.frame = CGRect(x: 260, y: 48, width: 0, height: 0)
        imageView.sizeToFit()
        return imageView
    }()

    /// Лейбл-Ваш заказ
    private let yourOrderLabel: UILabel = {
        let label = UILabel()
        return label.createCustomLabel(
            text: "Вашъ Заказъ",
            color: .black,
            fontName: "Verdana-Bold",
            fontSize: 18,
            frame: CGRect(x: 120, y: 100, width: 140, height: 30)
        )
    }()

    /// Узор под итоговой ценой
    private let bottomTraceryImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "bottomTraceryImage")
        imageView.frame = CGRect(x: 145, y: 472, width: 0, height: 0)
        imageView.sizeToFit()
        return imageView
    }()

    /// Кнопка перехода на экран ClosingViewController
    private lazy var paymentButton: UIButton = {
        let button = UIButton()
        button.setTitle("Оплатить", for: .normal)
        button.titleLabel?.font = UIFont(name: "Verdana-Bold", size: 16)
        button.tintColor = .white
        button.backgroundColor = .appTurquoise
        button.frame = CGRect(x: 20, y: 632, width: 345, height: 53)
        button.layer.cornerRadius = 10
        button.addTarget(
            self,
            action: #selector(buttonPressed),
            for: .touchUpInside
        )
        return button
    }()

    private lazy var exitButton: UIButton = {
        let exitButton = UIButton()
        exitButton.setImage(UIImage(named: "cross"), for: .normal)
        exitButton.tintColor = .black
        exitButton.addTarget(
            self,
            action: #selector(exitOrderController),
            for: .touchUpInside
        )
        return exitButton
    }()

    // MARK: - Properties

    /// Название выбранного кофе
    var nameCoffeeLabel: UILabel = {
        let label = UILabel()
        return label.createCustomLabel(
            text: "Название кофе",
            color: .black,
            fontName: "Verdana-Bold",
            fontSize: 16,
            frame: CGRect(x: 20, y: 155, width: 150, height: 30)
        )
    }()

    /// Стоимость выбранного кофе
    var costCoffeeLabel: UILabel = {
        let label = UILabel()
        return label.createCustomLabel(
            text: "0 руб",
            color: .black,
            fontName: "Verdana-Bold",
            fontSize: 16,
            frame: CGRect(x: 215, y: 155, width: 150, height: 30),
            textAlignment: .right
        )
    }()

    /// Лейбл ингридиента - молоко
    var milkIndgredientLabel: UILabel = {
        let label = UILabel()
        return label.createCustomLabel(
            text: "Молоко",
            color: .black,
            fontName: "Verdana",
            fontSize: 16,
            frame: CGRect(x: 20, y: 191, width: 150, height: 30)
        )
    }()

    /// Стоимость молока
    var costMilkLabel: UILabel = {
        let label = UILabel()
        return label.createCustomLabel(
            text: "0 руб",
            color: .black,
            fontName: "Verdana",
            fontSize: 16,
            frame: CGRect(x: 215, y: 191, width: 150, height: 30),
            textAlignment: .right
        )
    }()

    /// Лейбл ингридиента - сироп
    var syrupIndgredientLabel: UILabel = {
        let label = UILabel()
        return label.createCustomLabel(
            text: "Сироп",
            color: .black,
            fontName: "Verdana",
            fontSize: 16,
            frame: CGRect(x: 20, y: 227, width: 150, height: 30)
        )
    }()

    /// Стоимость сиропа
    var costSyrupLabel: UILabel = {
        let label = UILabel()
        return label.createCustomLabel(
            text: "0 руб",
            color: .black,
            fontName: "Verdana",
            fontSize: 16,
            frame: CGRect(x: 215, y: 227, width: 150, height: 30),
            textAlignment: .right
        )
    }()

    /// Лейбл ингридиента - соевое молоко
    var soyMilkIndgredientLabel: UILabel = {
        let label = UILabel()
        return label.createCustomLabel(
            text: "Молоко соевое",
            color: .black,
            fontName: "Verdana",
            fontSize: 16,
            frame: CGRect(x: 20, y: 263, width: 150, height: 30)
        )
    }()

    /// Стоимость соевого молока
    var costSoyMilkLabel: UILabel = {
        let label = UILabel()
        return label.createCustomLabel(
            text: "0 руб",
            color: .black,
            fontName: "Verdana",
            fontSize: 16,
            frame: CGRect(x: 215, y: 263, width: 150, height: 30),
            textAlignment: .right
        )
    }()

    /// Лейбл ингридиента - миндальное молоко
    var almondMilkIndgredientLabel: UILabel = {
        let label = UILabel()
        return label.createCustomLabel(
            text: "Молоко миндальное",
            color: .black,
            fontName: "Verdana",
            fontSize: 16,
            frame: CGRect(x: 20, y: 299, width: 170, height: 30)
        )
    }()

    /// Стоимость миндального молока
    var costAlmondMilkLabel: UILabel = {
        let label = UILabel()
        return label.createCustomLabel(
            text: "0 руб",
            color: .black,
            fontName: "Verdana",
            fontSize: 16,
            frame: CGRect(x: 215, y: 299, width: 150, height: 30),
            textAlignment: .right
        )
    }()

    /// Лейбл ингридиента - экспрессо
    var espressoIndgredientLabel: UILabel = {
        let label = UILabel()
        return label.createCustomLabel(
            text: "Эспрессо",
            color: .black,
            fontName: "Verdana",
            fontSize: 16,
            frame: CGRect(x: 20, y: 335, width: 150, height: 30)
        )
    }()

    /// Стоимость экспрессо
    var costEspressoLabel: UILabel = {
        let label = UILabel()
        return label.createCustomLabel(
            text: "0 руб",
            color: .black,
            fontName: "Verdana",
            fontSize: 16,
            frame: CGRect(x: 215, y: 335, width: 150, height: 30),
            textAlignment: .right
        )
    }()

    /// Итоговая цена
    var resultCostLabel: UILabel = {
        let label = UILabel()
        return label.createCustomLabel(
            text: "Цѣна - 0 руб",
            fontName: "Verdana-Bold",
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
    @objc private func buttonPressed() {
        let closingVC = ClosingViewController()
        navigationController?.pushViewController(closingVC, animated: true)
    }

    /// вернуться на экран меню кофе
    @objc private func exitOrderController() {
        navigationController?.popViewController(animated: true)
    }
}
