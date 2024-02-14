// CoffeeMenuViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Протокол для передачи экземпляра модели Coffee между контроллерами после смены опций
protocol TransferCoffeeOptionsDelegate: AnyObject {
    /// Метод передачи экземпляра модели Coffee между контроллерами после смены опций
    func transferCoffeeOptions(item: Coffee)
}

/// Контролер кофейного меню
final class CoffeeMenuViewController: UIViewController {
    // MARK: - Constants

    enum Constants {
        static let coffeeTitles = ["Американо", "Капучино", "Латте"]
        static let coffeeTypes = [Coffee.CoffeeType.americano, Coffee.CoffeeType.cappuccino, Coffee.CoffeeType.latte]

        static let americanoImageName = "americano"
        static let cappuccinoImageName = "cappuccino"
        static let latteImageName = "latte"

        static let darkRoastImageName = "dark roast"
        static let lightRoastImageName = "light roast"

        static let addItemImageName = "addItem"
        static let addedItemImageName = "added"

        static let arrowImageName = "arrow"
        static let paperPlaneImageName = "plane"

        static let modificationLabelText = "Модификация"
        static let additionsButtonTitleLabelText = "Дополнительные ингредіенты"
        static let orderButtonTitleLabelText = "Заказать"
        static let promocodeText = "Лови промокод roadmaplove на любой напиток из Кофейнов"

        static let verdanaFont = "Verdana"
        static let verdanaBoldFont = "Verdana-Bold"

        static let startPriceText = "Цѣна - "
        static let endPriceText = " руб"
    }

    // MARK: - Private Properties

    private var coffeeItem = Coffee() {
        didSet { configureUI() }
    }

    private lazy var priceLabelText = "\(Constants.startPriceText)\(coffeeItem.fullPrice)\(Constants.endPriceText)"

    // MARK: - Visual Components

    private lazy var shareSheetController = UIActivityViewController(
        activityItems: [Constants.promocodeText],
        applicationActivities: nil
    )

    private lazy var backgroundView: UIView = {
        let backgroundView = UIView()
        backgroundView.frame = CGRect(x: 0, y: 0, width: view.frame.size.width, height: 346)
        backgroundView.backgroundColor = .beige
        backgroundView.layer.cornerRadius = 12
        backgroundView.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        return backgroundView
    }()

    private lazy var coffeeImageView: UIImageView = {
        let view = UIImageView()
        view.frame = CGRect(x: 112, y: 128, width: 150, height: 150)
        view.image = UIImage(named: Constants.americanoImageName)
        return view
    }()

    private lazy var segmentedControl: UISegmentedControl = {
        let control = UISegmentedControl(items: Constants.coffeeTitles)
        control.frame = CGRect(x: 15, y: 368, width: 345, height: 44)
        control.selectedSegmentIndex = 0
        control.addTarget(self, action: #selector(changeCoffeeType), for: .valueChanged)
        return control
    }()

    private lazy var modificationLabel: UILabel = {
        let label = UILabel()
        label.frame = CGRect(x: 15, y: 432, width: 200, height: 30)
        label.text = Constants.modificationLabelText
        label.font = UIFont(name: Constants.verdanaBoldFont, size: 18)
        return label
    }()

    private lazy var chooseRoastButton: UIButton = {
        let button = UIButton()
        button.frame = CGRect(x: 15, y: 482, width: 165, height: 165)
        button.configuration = .plain()
        button.configuration?.imagePlacement = .top
        button.configuration?.image = UIImage(named: Constants.darkRoastImageName)
        button.setTitle(coffeeItem.roast.rawValue, for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.setTitleColor(.gray, for: .highlighted)
        button.titleLabel?.font = UIFont(name: Constants.verdanaFont, size: 14)
        button.backgroundColor = .customGray
        button.layer.cornerRadius = 12
        button.addTarget(self, action: #selector(chooseRoast), for: .touchUpInside)
        return button
    }()

    private lazy var additionsButton: UIButton = {
        let button = UIButton()
        button.frame = CGRect(x: 195, y: 482, width: 165, height: 165)
        button.configuration = .plain()
        button.configuration?.imagePlacement = .top
        button.configuration?.imagePadding = 10
        button.configuration?.image = UIImage(named: Constants.addItemImageName)
        button.setTitle(Constants.additionsButtonTitleLabelText, for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.setTitleColor(.gray, for: .highlighted)
        button.titleLabel?.textAlignment = .center
        button.titleLabel?.font = UIFont(name: Constants.verdanaFont, size: 10)
        button.backgroundColor = .customGray
        button.layer.cornerRadius = 12
        button.addTarget(self, action: #selector(chooseAdditions), for: .touchUpInside)
        return button
    }()

    private lazy var priceLabel: UILabel = {
        let label = UILabel()
        label.frame = CGRect(x: 15, y: 669, width: 345, height: 30)
        label.text = priceLabelText
        label.textAlignment = .right
        label.font = UIFont(name: Constants.verdanaBoldFont, size: 18)
        return label
    }()

    private lazy var orderButton: UIButton = {
        let button = UIButton()
        button.frame = CGRect(x: 15, y: 717, width: 345, height: 53)
        button.setTitle(Constants.orderButtonTitleLabelText, for: .normal)
        button.titleLabel?.font = UIFont(name: Constants.verdanaBoldFont, size: 18)
        button.layer.cornerRadius = 12
        button.backgroundColor = .seaGreen
        button.addTarget(self, action: #selector(makeOrder), for: .touchUpInside)
        return button
    }()

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }

    // MARK: - Private Methods

    private func configureUI() {
        navigationItem.leftBarButtonItem = createLeftBarButtonItem()
        navigationItem.rightBarButtonItem = createRightBarButtonItem()

        view.backgroundColor = .white
        [
            backgroundView,
            segmentedControl,
            modificationLabel,
            chooseRoastButton,
            coffeeImageView,
            additionsButton,
            priceLabel,
            orderButton
        ]
        .forEach { view.addSubview($0) }

        switch coffeeItem.roast {
        case .dark:
            chooseRoastButton.configuration?.image = UIImage(named: Constants.darkRoastImageName)
            chooseRoastButton.setTitle(coffeeItem.roast.rawValue, for: .normal)
        case .light:
            chooseRoastButton.configuration?.image = UIImage(named: Constants.lightRoastImageName)
            chooseRoastButton.setTitle(coffeeItem.roast.rawValue, for: .normal)
        }

        priceLabelText = "\(Constants.startPriceText)\(coffeeItem.fullPrice)\(Constants.endPriceText)"
        priceLabel.text = priceLabelText

        switch coffeeItem.fullPrice {
        case coffeeItem.standardPrice:
            additionsButton.configuration?.image = UIImage(named: Constants.addItemImageName)
        default:
            additionsButton.configuration?.image = UIImage(named: Constants.addedItemImageName)
        }
    }

    private func reloadOptions() {
        coffeeItem.roast = .dark
        coffeeItem.isStandardMilkAdded.0 = false
        coffeeItem.isSyrupAdded.0 = false
        coffeeItem.isSoyaMilkAdded.0 = false
        coffeeItem.isAlmondMilkAdded.0 = false
        coffeeItem.isEspressoChosen.0 = false
    }

    @objc private func popToPrevious() {
        navigationController?.popViewController(animated: true)
    }

    @objc private func changeCoffeeType() {
        let coffeeTypes = [Coffee.CoffeeType.americano, Coffee.CoffeeType.cappuccino, Coffee.CoffeeType.latte]
        let coffeeImageNames = ["americano", "cappuccino", "latte"]
        coffeeItem.coffeeType = coffeeTypes[segmentedControl.selectedSegmentIndex]
        coffeeImageView.image = UIImage(named: coffeeImageNames[segmentedControl.selectedSegmentIndex])
        reloadOptions()
        priceLabel.text = priceLabelText
    }

    @objc private func chooseRoast() {
        let controllerToMove = RoastingOptionViewController()
        controllerToMove.coffeeItem = coffeeItem
        controllerToMove.delegate = self
        present(controllerToMove, animated: true)
    }

    @objc private func chooseAdditions() {
        let controllerToMove = AdditionalIngredientsViewController()
        controllerToMove.delegate = self
        controllerToMove.coffeeItem = coffeeItem
        present(controllerToMove, animated: true)
    }

    @objc private func makeOrder() {
        let orderContoller = OrderListViewController()
        navigationController?.pushViewController(
            orderContoller,
            animated: true
        )
    }
}

/// Расширение для реализации метода делегата
extension CoffeeMenuViewController: TransferCoffeeOptionsDelegate {
    func transferCoffeeOptions(item: Coffee) {
        coffeeItem = item
    }
}

/// Расширение создает кастомные кнопки для навигейшн бара и функции для них.
extension CoffeeMenuViewController {
    /// Метод создания левой кнопки
    func createLeftBarButtonItem() -> UIBarButtonItem {
        let button = UIButton()
        button.frame = CGRect(x: 0, y: 0, width: 44, height: 44)
        button.clipsToBounds = true
        button.setImage(UIImage(named: Constants.arrowImageName), for: .normal)
        button.layer.backgroundColor = UIColor(red: 235 / 255, green: 246 / 255, blue: 247 / 255, alpha: 1).cgColor
        button.layer.cornerRadius = 22
        button.addTarget(self, action: #selector(popBack), for: .touchUpInside)
        let item = UIBarButtonItem(customView: button)
        return item
    }

    /// Метод создания правой кнопки
    func createRightBarButtonItem() -> UIBarButtonItem {
        let button = UIButton()
        button.frame = CGRect(x: 0, y: 0, width: 24, height: 24)
        button.clipsToBounds = true
        button.setImage(UIImage(named: Constants.paperPlaneImageName), for: .normal)
        button.addTarget(self, action: #selector(shareCode), for: .touchUpInside)
        let item = UIBarButtonItem(customView: button)
        return item
    }

    /// Метод-таргет для левой кнопки "Назад"
    @objc private func popBack() {
        navigationController?.popViewController(animated: true)
    }

    /// Метод-таргет для правой кнопки "Поделиться"
    @objc private func shareCode() {
        present(shareSheetController, animated: true)
    }
}
