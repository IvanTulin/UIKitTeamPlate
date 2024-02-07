// ViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Стартовый экран
class ViewController: UIViewController {
    // MARK: - Properties

    lazy var imageView: UIImageView = {
        var image = UIImageView()
        image.image = UIImage(named: "Background")
        let origin = CGPoint(x: 0, y: 0)
        image.frame = CGRect(origin: origin, size: view.bounds.size)
        return image
    }()

    var nameLabel: UILabel = {
        var label = UILabel()
        let origin = CGPoint(x: 0, y: 48)
        label.frame = CGRect(x: origin.x, y: origin.y, width: 393, height: 82)
        label.backgroundColor = #colorLiteral(red: 0.5936434865, green: 0.7938520312, blue: 0.8973758817, alpha: 1)
        label.textAlignment = .center
        label.isHidden = true
        return label
    }()

    var calculateButton: UIButton = {
        var calculateButton = UIButton()
        calculateButton.frame = CGRect(x: 142, y: 500, width: 200, height: 200)
        calculateButton.setTitle("Калькулятор", for: .normal)
        calculateButton.backgroundColor = #colorLiteral(red: 0.3939370811, green: 0.7096473575, blue: 0.5092409849, alpha: 1)
        calculateButton.layer.cornerRadius = 25

        return calculateButton
    }()

    var guessTheNumberButton: UIButton = {
        var guessTheNumberButton = UIButton()
        guessTheNumberButton.frame = CGRect(x: 92, y: 304, width: 150, height: 150)
        guessTheNumberButton.setTitle("Угадай число", for: .normal)
        guessTheNumberButton.backgroundColor = #colorLiteral(red: 0.6101519465, green: 0.4977072477, blue: 0.7082346082, alpha: 1)
        guessTheNumberButton.layer.cornerRadius = 25

        return guessTheNumberButton
    }()

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white

        view.addSubview(imageView)
        view.addSubview(nameLabel)
        view.addSubview(guessTheNumberButton)
        view.addSubview(calculateButton)

        calculateButton.addTarget(self, action: #selector(calclulate), for: .touchUpInside)
        guessTheNumberButton.addTarget(self, action: #selector(guess), for: .touchUpInside)
    }

    override func viewDidAppear(_ animated: Bool) {
        requestName()
    }

    // MARK: - Method

    @objc func guess() {
        let alertController = UIAlertController(
            title: "Угадайте число от 1 до 10",
            message: nil,
            preferredStyle: .alert
        )
        let randomNumber = String(Int.random(in: 1 ... 10))

        alertController.addTextField { text in
            text.placeholder = "Введите текст"
        }
        let actionOK = UIAlertAction(title: "OK", style: .default) { [weak self] _ in
            let text = alertController.textFields?.first
            if text?.text == randomNumber {
                let alert = UIAlertController(title: "Поздравляю!", message: "Вы угадали", preferredStyle: .alert)
                let cancelButton = UIAlertAction(title: "OK", style: .cancel)

                alert.addAction(cancelButton)
                self?.present(alert, animated: true)
            } else {
                let alert = UIAlertController(title: "Упс!", message: "Это неверный ответ", preferredStyle: .alert)
                let cancelButton = UIAlertAction(title: "OK", style: .cancel)

                alert.addAction(cancelButton)
                self?.present(alert, animated: true)
            }
        }

        alertController.addAction(actionOK)
        present(alertController, animated: true)
    }

    @objc func calclulate() {
        let alertController = UIAlertController(title: "Введите ваши числа", message: nil, preferredStyle: .alert)

        alertController.addTextField { textField in
            textField.placeholder = "Число 1"
        }
        alertController.addTextField { textField in
            textField.placeholder = "Число 2"
        }

        let actionFold = UIAlertAction(title: "Сложить", style: .cancel) { [weak self] _ in

            let firstNumber = alertController.textFields?[0]
            let secondNumber = alertController.textFields?[1]
            if let firstNumberText = firstNumber?.text, let secondNumberText = secondNumber?.text {
                if let firstInt = Int(firstNumberText), let secondInt = Int(secondNumberText) {
                    let result = String(firstInt + secondInt)

                    let alertResult = UIAlertController(title: "Ваш результат", message: result, preferredStyle: .alert)
                    let stepForward = UIAlertAction(title: "Ок", style: .default)
                    let actionaCancel = UIAlertAction(title: "Отмена", style: .cancel)

                    alertResult.addAction(actionaCancel)
                    alertResult.addAction(stepForward)

                    self?.present(alertResult, animated: true)
                }
            }
        }

        let actionCancel = UIAlertAction(title: "Сancel", style: .default)
        alertController.addAction(actionFold)
        alertController.addAction(actionCancel)

        present(alertController, animated: true)
    }

    func requestName() {
        let alertController = UIAlertController(
            title: "Пожалуйста, предтсавьтесь",
            message: nil,
            preferredStyle: .alert
        )

        alertController.addTextField { textField in
            textField.placeholder = "Введите ваше имя"
        }

        let okAction = UIAlertAction(title: "Готово", style: .default) { [weak self] _ in
            guard let textField = alertController.textFields?.first, let name = textField.text else {
                return
            }
            self?.nameLabel.text = "Приветсвую, \(name)!"
            self?.nameLabel.isHidden = false
        }

        alertController.addAction(okAction)

        present(alertController, animated: true, completion: nil)
    }
}
