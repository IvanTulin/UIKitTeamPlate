// CoffeeMenuViewController.swift
// Copyright © RoadMap. All rights reserved.

// Наташа
import UIKit

/// Протокол для передачи экземпляра модели Coffee между контроллерами после смены опций
protocol TransferCoffeeOptionsDelegate: AnyObject {
    /// Метод передачи экземпляра модели Coffee между контроллерами после смены опций
    func transferCoffeeOptions(item: Coffee)
}

/// Контролер кофейного меню
final class CoffeeMenuViewController: UIViewController, UIGestureRecognizerDelegate {
    // MARK: - Constants

    enum Constants {
        /// Массив заголовков для использования в сегмент контроллере
        static let coffeeTitles = ["Американо", "Капучино", "Латте"]

        /// Имена изображений для основного изображения
        static let americanoImage = "americano"
        static let cappuccinoImage = "cappuccino"
        static let latteImage = "latte"

        /// Имена изображений для кнопки типа обжарки
        static let darkRoastImage = "dark roast"
        static let lightRoastImage = "light roast"

        /// Имена изображений для кнопки выбора дополнительных опций
        static let addItemImage = "addItem"
        static let addedItemImage = "added"

        /// Имена изображений для кнопок Navigation Bar
        static let arrowImage = "arrow"
        static let paperPlaneImage = "plane"

        /// Строки для текстовых лейблов
        static let modificationLabelText = "Модификация"
        static let additionsButtonTitleLabelText = "Дополнительные ингредіенты"
        static let orderButtonTitleLabelText = "Заказать"
        static let promocodeText = "Лови промокод roadmaplove на любой напиток из Кофейнов"

        /// Шрифты
        static let verdanaFont = "Verdana"
        static let verdanaBoldFont = "Verdana-Bold"
    }

    // MARK: - Private Properties

    private lazy var coffeeItem = Coffee() {
        didSet { setupUI() }
    }

    private lazy var priceLabelText = "Цѣна - \(coffeeItem.fullPrice) руб"

    // MARK: - Visual Components

    /// Контроллер для передачи промокода в share
    private lazy var shareSheetController = UIActivityViewController(
        activityItems: [Constants.promocodeText],
        applicationActivities: nil
    )

    /// Вью-подложка, бежевый фон
    private lazy var backgroundView: UIView = {
        let backgroundView = UIView()
        backgroundView.frame = CGRect(x: 0, y: 0, width: view.frame.size.width, height: 346)
        backgroundView.backgroundColor = .beige
        backgroundView.layer.cornerRadius = 12
        backgroundView.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        return backgroundView
    }()

    /// Основная картинка
    private lazy var coffeeImageView: UIImageView = {
        let view = UIImageView()
        view.frame = CGRect(x: 112, y: 128, width: 150, height: 150)
        view.image = UIImage(named: Constants.americanoImage)
        return view
    }()

    /// Сегмент контроллер с выбором типа кофе
    private lazy var segmentedControl: UISegmentedControl = {
        let control = UISegmentedControl(items: Constants.coffeeTitles)
        control.frame = CGRect(x: 15, y: 368, width: 345, height: 44)
        control.selectedSegmentIndex = 0
        control.addTarget(self, action: #selector(changeCoffeeType), for: .valueChanged)
        return control
    }()

    /// Заголовок над кнопками модификаций
    private lazy var modificationLabel: UILabel = {
        let label = UILabel()
        label.frame = CGRect(x: 15, y: 432, width: 200, height: 30)
        label.text = Constants.modificationLabelText
        label.font = UIFont(name: Constants.verdanaBoldFont, size: 18)
        return label
    }()

    /// Кнопка выбора обжарки
    private lazy var chooseRoastButton: UIButton = {
        let button = UIButton()
        button.frame = CGRect(x: 15, y: 482, width: 165, height: 165)
        button.configuration = .plain()
        button.configuration?.imagePlacement = .top
        button.configuration?.image = UIImage(named: Constants.darkRoastImage)
        button.setTitle(coffeeItem.roast.rawValue, for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.setTitleColor(.gray, for: .highlighted)
        button.titleLabel?.font = UIFont(name: Constants.verdanaFont, size: 14)
        button.backgroundColor = .customGray
        button.layer.cornerRadius = 12
        button.addTarget(self, action: #selector(chooseRoast), for: .touchUpInside)
        return button
    }()

    /// Кнопка добавления опций
    private lazy var additionsButton: UIButton = {
        let button = UIButton()
        button.frame = CGRect(x: 195, y: 482, width: 165, height: 165)
        button.configuration = .plain()
        button.configuration?.imagePlacement = .top
        button.configuration?.imagePadding = 10
        button.configuration?.image = UIImage(named: Constants.addItemImage)
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

    /// Лейбл цены заказа
    private lazy var priceLabel: UILabel = {
        let label = UILabel()
        label.frame = CGRect(x: 15, y: 669, width: 345, height: 30)
        label.text = priceLabelText
        label.textAlignment = .right
        label.font = UIFont(name: Constants.verdanaBoldFont, size: 18)
        return label
    }()

    /// Кнопка формирования заказа
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
        setupUI()
    }

    // MARK: - Private Methods

    /// Установка вью на супервью
    private func setupUI() {
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
            chooseRoastButton.configuration?.image = UIImage(named: Constants.darkRoastImage)
            chooseRoastButton.setTitle(coffeeItem.roast.rawValue, for: .normal)
        case .light:
            chooseRoastButton.configuration?.image = UIImage(named: Constants.lightRoastImage)
            chooseRoastButton.setTitle(coffeeItem.roast.rawValue, for: .normal)
        }

        priceLabelText = "Цѣна - \(coffeeItem.fullPrice) руб"
        priceLabel.text = priceLabelText

        switch coffeeItem.fullPrice {
        case coffeeItem.standardPrice:
            additionsButton.configuration?.image = UIImage(named: Constants.addItemImage)
        default:
            additionsButton.configuration?.image = UIImage(named: Constants.addedItemImage)
        }
    }

    /// Метод сброса опций модели
    private func reloadOptions() {
        coffeeItem.roast = .dark
        coffeeItem.isStandardMilkAdded.0 = false
        coffeeItem.isSyrupAdded.0 = false
        coffeeItem.isSoyaMilkAdded.0 = false
        coffeeItem.isAlmondMilkAdded.0 = false
        coffeeItem.isEspressoChosen.0 = false
    }

    /// Метод возврата на один экран назад
    @objc private func popToPrevious() {
        navigationController?.popViewController(animated: true)
    }

    /// Метод изменения вью и модели от изменения состояния свитчера
    @objc private func changeCoffeeType() {
        switch segmentedControl.selectedSegmentIndex {
        case 0:
            coffeeItem.coffeeType = .americano
            reloadOptions()
            coffeeImageView.image = UIImage(named: Constants.americanoImage)
            priceLabel.text = priceLabelText
        case 1:
            coffeeItem.coffeeType = .cappuccino
            reloadOptions()
            coffeeImageView.image = UIImage(named: Constants.cappuccinoImage)
            priceLabel.text = priceLabelText
        case 2:
            coffeeItem.coffeeType = .latte
            reloadOptions()
            coffeeImageView.image = UIImage(named: Constants.latteImage)
            priceLabel.text = priceLabelText
        default:
            break
        }
    }

    /// Метод перехода к экрану выбора обжарки
    @objc private func chooseRoast() {
        let controllerToMove = RoastingOptionViewController()
        controllerToMove.coffeeItem = coffeeItem
        controllerToMove.delegate = self
        present(controllerToMove, animated: true)
    }

    /// Метод перехода к экрану выбора опций
    @objc private func chooseAdditions() {
        let controllerToMove = AdditionalIngredientsViewController()
        controllerToMove.delegate = self
        controllerToMove.coffeeItem = coffeeItem
        present(controllerToMove, animated: true)
    }

    /// Метод "Сделать заказ"
    @objc private func makeOrder() {
        let controllerToMove = OrderListViewController()
//        newVC.coffeeItem = coffeeItem
        present(controllerToMove, animated: true)
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
        button.setImage(UIImage(named: Constants.arrowImage), for: .normal)
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
        button.setImage(UIImage(named: Constants.paperPlaneImage), for: .normal)
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
