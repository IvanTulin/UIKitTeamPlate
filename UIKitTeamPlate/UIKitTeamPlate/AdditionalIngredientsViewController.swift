// AdditionalIngredientsViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Экрн выбора дополнительных ингридиентов
final class AdditionalIngredientsViewController: UIViewController {
    // MARK: - Constants

    enum Constants {
        static let closeImage = "close"

        static let mainLabelText = "Выберите дополнительные ингредіенты"

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

        static let verdanaBoldFont = "Verdana-Bold"
    }

    // MARK: - Public Properties

    var coffeeItem = Coffee()

    weak var delegate: TransferCoffeeOptionsDelegate?

    // MARK: - Visual Components

    private lazy var cancelButton: UIButton = {
        let button = UIButton()
        button.frame = CGRect(x: 20, y: 26, width: 14, height: 14)
        button.setImage(UIImage(named: Constants.closeImage), for: .normal)
        button.addTarget(self, action: #selector(closeView), for: .touchUpInside)
        return button
    }()

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

    private lazy var standardMilkLabel = makeLabel(
        yPoint: 124,
        blackText: Constants.milkText,
        greenText: Constants.greenMilkText
    )
    private lazy var syrupLabel = makeLabel(
        yPoint: 174,
        blackText: Constants.syrupText,
        greenText: Constants.greenSyrupText
    )
    private lazy var soyaMilkLabel = makeLabel(
        yPoint: 224,
        blackText: Constants.soyaMilkText,
        greenText: Constants.greenSoyaMilkText
    )
    private lazy var almondMilkLabel = makeLabel(
        yPoint: 274,
        blackText: Constants.almondMilkText,
        greenText: Constants.greenAlmondMilkText
    )
    private lazy var espressoLabel = makeLabel(
        yPoint: 324,
        blackText: Constants.espressoText,
        greenText: Constants.greenEspressoText
    )

    private lazy var milkSwitch: UISwitch = {
        var switcher = UISwitch(frame: CGRect(x: 301, y: 124, width: 31, height: 31))
        switcher.addTarget(self, action: #selector(changeOption(sender:)), for: .valueChanged)
        return switcher
    }()

    private lazy var syrupSwitch: UISwitch = {
        var switcher = UISwitch(frame: CGRect(x: 301, y: 174, width: 31, height: 31))
        switcher.addTarget(self, action: #selector(changeOption(sender:)), for: .valueChanged)
        return switcher
    }()

    private lazy var soyaMilkSwitch: UISwitch = {
        var switcher = UISwitch(frame: CGRect(x: 301, y: 224, width: 31, height: 31))
        switcher.addTarget(self, action: #selector(changeOption(sender:)), for: .valueChanged)
        return switcher
    }()

    private lazy var almondMilkSwitch: UISwitch = {
        var switcher = UISwitch(frame: CGRect(x: 301, y: 274, width: 31, height: 31))
        switcher.addTarget(self, action: #selector(changeOption(sender:)), for: .valueChanged)
        return switcher
    }()

    private lazy var espressoSwitch: UISwitch = {
        var switcher = UISwitch(frame: CGRect(x: 301, y: 324, width: 31, height: 31))
        switcher.addTarget(self, action: #selector(changeOption(sender:)), for: .valueChanged)
        return switcher
    }()

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    // MARK: - Private Methods

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

    private func setupSwitchers() {
        milkSwitch.isOn = coffeeItem.isStandardMilkAdded.0
        syrupSwitch.isOn = coffeeItem.isSyrupAdded.0
        soyaMilkSwitch.isOn = coffeeItem.isSoyaMilkAdded.0
        almondMilkSwitch.isOn = coffeeItem.isAlmondMilkAdded.0
        espressoSwitch.isOn = coffeeItem.isEspressoChosen.0
    }

    private func makeLabel(yPoint: Int, blackText: String, greenText: String) -> UILabel {
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

    @objc private func closeView() {
        delegate?.transferCoffeeOptions(item: coffeeItem)
        dismiss(animated: true)
    }
}
