// AdditionalIngredientsViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Экрн выбора дополнительных ингридиентов
final class AdditionalIngredientsViewController: UIViewController {
    // MARK: - Constants

    enum Constants {
        /// картинка закрывающей кнопки
        static let closeImage = "close"

        /// Строки для текстовых лейблов
        static let mainLabelText = "Выберите дополнительные ингредіенты"

        /// Строки для двуцветных лейблов
        static let milkText = "Молоко"
        static let greenMilkText = "+\(Coffee.CoffeePrice.milk) руб"
        static let syrupText = "Сироп"
        static let greenSyrupText = " +\(Coffee.CoffeePrice.syrup) руб"
        static let soyaMilkText = "Молоко соевое"
        static let greenSoyaMilkText = "+\(Coffee.CoffeePrice.soyaMilk) руб"
        static let almondMilkText = "Молоко миндальное"
        static let greenAlmondMilkText = "+\(Coffee.CoffeePrice.almondMilk) руб"
        static let espressoText = "Эспрессо 50мл"
        static let greenEspressoText = "+\(Coffee.CoffeePrice.espresso) руб"

        /// Шрифт
        static let verdanaBoldFont = "Verdana-Bold"
    }

    // MARK: - Public Properties

    /// Экземпляр модели
    var coffeeItem = Coffee()

    /// Экземпляр делегата для обмена экземпляром модели между контроллерами
    weak var delegate: TransferCoffeeOptionsDelegate?

    // MARK: - Visual Components

    /// Кнопка "Скрыть экран"
    private lazy var cancelButton: UIButton = {
        let button = UIButton()
        button.frame = CGRect(x: 20, y: 26, width: 14, height: 14)
        button.setImage(UIImage(named: Constants.closeImage), for: .normal)
        button.addTarget(self, action: #selector(closeView), for: .touchUpInside)
        return button
    }()

    /// Заголовок "Добавить опции"
    private lazy var addOptionLabel: UILabel = {
        let label = UILabel()
        label.frame = CGRect(x: 40, y: 53, width: 294, height: 44)
        label.text = Constants.mainLabelText
        label.textAlignment = .center
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.font = UIFont(name: Constants.verdanaBoldFont, size: 18)
        return label
    }()

    /// Текстовые лейблы для опций
    private lazy var standardMilkLabel = addLabel(
        yPoint: 124,
        blackText: Constants.milkText,
        greenText: Constants.greenMilkText
    )
    private lazy var syrupLabel = addLabel(
        yPoint: 174,
        blackText: Constants.syrupText,
        greenText: Constants.greenSyrupText
    )
    private lazy var soyaMilkLabel = addLabel(
        yPoint: 224,
        blackText: Constants.soyaMilkText,
        greenText: Constants.greenSoyaMilkText
    )
    private lazy var almondMilkLabel = addLabel(
        yPoint: 274,
        blackText: Constants.almondMilkText,
        greenText: Constants.greenAlmondMilkText
    )
    private lazy var espressoLabel = addLabel(
        yPoint: 324,
        blackText: Constants.espressoText,
        greenText: Constants.greenEspressoText
    )

    /// Свитчеры для выбора опций
    private lazy var milkSwitch = UISwitch(frame: CGRect(x: 301, y: 124, width: 31, height: 31))
    private lazy var syrupSwitch = UISwitch(frame: CGRect(x: 301, y: 174, width: 31, height: 31))
    private lazy var soyaMilkSwitch = UISwitch(frame: CGRect(x: 301, y: 224, width: 31, height: 31))
    private lazy var almondMilkSwitch = UISwitch(frame: CGRect(x: 301, y: 274, width: 31, height: 31))
    private lazy var espressoSwitch = UISwitch(frame: CGRect(x: 301, y: 324, width: 31, height: 31))

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    // MARK: - Private Methods

    /// Установка вью
    private func setupUI() {
        view.backgroundColor = .white
        [
            cancelButton,
            addOptionLabel,
            standardMilkLabel,
            syrupLabel,
            soyaMilkLabel,
            almondMilkLabel,
            espressoLabel,
            milkSwitch,
            syrupSwitch,
            soyaMilkSwitch,
            almondMilkSwitch,
            espressoSwitch
        ].forEach { view.addSubview($0) }
        setupSwitchers()
    }

    /// Конфигурация и установка состояния свитчеров
    private func setupSwitchers() {
        milkSwitch.isOn = coffeeItem.isStandardMilkAdded.0
        syrupSwitch.isOn = coffeeItem.isSyrupAdded.0
        soyaMilkSwitch.isOn = coffeeItem.isSoyaMilkAdded.0
        almondMilkSwitch.isOn = coffeeItem.isAlmondMilkAdded.0
        espressoSwitch.isOn = coffeeItem.isEspressoChosen.0

        milkSwitch.addTarget(self, action: #selector(changeOption(sender:)), for: .valueChanged)
        syrupSwitch.addTarget(self, action: #selector(changeOption(sender:)), for: .valueChanged)
        soyaMilkSwitch.addTarget(self, action: #selector(changeOption(sender:)), for: .valueChanged)
        almondMilkSwitch.addTarget(self, action: #selector(changeOption(sender:)), for: .valueChanged)
        espressoSwitch.addTarget(self, action: #selector(changeOption(sender:)), for: .valueChanged)
    }

    /// Функция для этого класса, создающая текстовые вьюшки одного стиля
    private func addLabel(yPoint: Int, blackText: String, greenText: String) -> UILabel {
        let label = UILabel()
        label.frame = CGRect(x: 20, y: yPoint, width: 275, height: 35)
        let blackText = blackText
        let space = " "
        let coloredText = blackText + space + greenText
        let colored = NSMutableAttributedString(string: coloredText)
        colored.setColor(color: .greenText, forText: greenText)
        label.attributedText = colored
        label.textAlignment = .left
        label.font = UIFont(name: "Verdana", size: 18)
        return label
    }

    /// Функция для сохранения значения по изменению состояния свитчера
    @objc private func changeOption(sender: UISwitch) {
        switch sender {
        case milkSwitch:
            coffeeItem.isStandardMilkAdded.0 = !coffeeItem.isStandardMilkAdded.0
        case syrupSwitch:
            coffeeItem.isSyrupAdded.0 = !coffeeItem.isSyrupAdded.0
        case soyaMilkSwitch:
            coffeeItem.isSoyaMilkAdded.0 = !coffeeItem.isSoyaMilkAdded.0
        case almondMilkSwitch:
            coffeeItem.isAlmondMilkAdded.0 = !coffeeItem.isAlmondMilkAdded.0
        case espressoSwitch:
            coffeeItem.isEspressoChosen.0 = !coffeeItem.isEspressoChosen.0
        default:
            break
        }
    }

    /// Функция закрытия экрана
    @objc private func closeView() {
        delegate?.transferCoffeeOptions(item: coffeeItem)
        dismiss(animated: true)
    }
}
