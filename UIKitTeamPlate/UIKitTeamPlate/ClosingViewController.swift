// ClosingViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Закрывающий экран
final class ClosingViewController: UIViewController {
    // MARK: - Visual Components

    /// Изображение узора
    private let traceryImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "traceryImage")
        imageView.frame = CGRect(x: 92, y: 58, width: 0, height: 0)
        imageView.sizeToFit()
        return imageView
    }()

    /// Изображение спасибо за заказ
    private let thanksForTheOrderImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "thanksImage")
        imageView.frame = CGRect(x: 75, y: 184, width: 235, height: 128)
        return imageView
    }()

    /// Стоимость выбранного кофе
    private let textRecommendationLabel: UILabel = {
        let label = UILabel()
        return label.createCustomLabel(
            text: """
            Разскажи о насъ другу,отправь ему
            промокодъ
            на безплатный напитокъ и получи
            скидку 10% на слѣдующій заказъ.
            """,
            color: .gray,
            fontName: "Verdana",
            fontSize: 16,
            frame: CGRect(x: 30, y: 362, width: 315, height: 89),
            numberOfLines: 0,
            textAlignment: .center
        )
    }()

    /// Кнопка перехода на экран ClosingViewController
    private lazy var returnMainMenuScreenButton: UIButton = {
        let button = UIButton()
        button.setTitle("Хорошо", for: .normal)
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
        print("go to main")
        navigationController?.popViewController(animated: true)
        if let viewControllers = navigationController?.viewControllers {
            for viewController in viewControllers {
                if let mainMenuVC = viewController as? MainMenuViewController {
                    navigationController?.popToViewController(mainMenuVC, animated: true)
                }
            }
        }
    }
}
