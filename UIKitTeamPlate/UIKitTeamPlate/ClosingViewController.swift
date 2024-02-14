// ClosingViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Закрывающий экран
final class ClosingViewController: UIViewController {
    // MARK: - Constants

    enum Constants {
        static let textRecommendation = """
        Разскажи о насъ другу,отправь ему
        промокодъ
        на безплатный напитокъ и получи
        скидку 10% на слѣдующій заказъ.
        """
        static let nameFont = "Verdana"
        static let nameFontBold = "Verdana-Bold"
        static let imageNameTracery = "traceryImage"
        static let imageNameThanksForTheOrder = "thanksImage"
        static let titleNameForButton = "Хорошо"
    }

    // MARK: - Visual Components

    /// Изображение узора
    private let traceryImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: Constants.imageNameTracery)
        imageView.frame = CGRect(x: 92, y: 58, width: 0, height: 0)
        imageView.sizeToFit()
        return imageView
    }()

    /// Изображение спасибо за заказ
    private let thanksForTheOrderImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(
            named: Constants.imageNameThanksForTheOrder
        )
        imageView.frame = CGRect(x: 75, y: 184, width: 235, height: 128)
        return imageView
    }()

    /// Текст приглашения
    private let textRecommendationLabel: UILabel = {
        let label = UILabel()
        return label.createCustomLabel(
            text: Constants.textRecommendation,
            color: .gray,
            fontName: Constants.nameFont,
            fontSize: 16,
            frame: CGRect(x: 30, y: 362, width: 315, height: 89),
            numberOfLines: 0,
            textAlignment: .center
        )
    }()

    /// Кнопка перехода на экран ClosingViewController
    private lazy var returnMainMenuScreenButton: UIButton = {
        let button = UIButton()
        button.setTitle(Constants.titleNameForButton, for: .normal)
        button.titleLabel?.font = UIFont(name: Constants.nameFontBold, size: 16)
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

    // MARK: - Properties

    /// Делегирование перехода на корневой контроллер при исчезновении модального
    weak var delegate: Rootable?

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }

    // MARK: - Private Methods

    /// добавляем и конфигурируем UI элементы на контроллер
    private func configureUI() {
        view.backgroundColor = .white
        view.addSubview(traceryImageView)
        view.addSubview(thanksForTheOrderImageView)
        view.addSubview(textRecommendationLabel)
        view.addSubview(returnMainMenuScreenButton)
        navigationController?.navigationBar.isHidden = true
    }

    /// возврат на экран MainMenuViewController
    @objc private func buttonPressed() {
        delegate?.didDismissModal()
        dismiss(animated: false)
    }
}
