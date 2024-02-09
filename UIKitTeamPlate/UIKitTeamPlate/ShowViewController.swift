// ShowViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Экран демонстрации
class ShowViewController: UIViewController {
    // MARK: - Properties

    var model = Model()

    let labelOfTheFirstName: UILabel = {
        var labelOfTheFirstName = UILabel()
        let origin = CGPoint(x: 60, y: 106)
        let size = CGSize(width: 275, height: 57)
        labelOfTheFirstName.frame = CGRect(origin: origin, size: size)
        labelOfTheFirstName.textAlignment = .center
        labelOfTheFirstName.text = "Вы ввели слово"
        labelOfTheFirstName.font = UIFont.boldSystemFont(ofSize: 19)
        return labelOfTheFirstName
    }()

    let firstLabel: UILabel = {
        var firstLabel = UILabel()
        let origin = CGPoint(x: 50, y: 163)
        let size = CGSize(width: 275, height: 57)
        firstLabel.frame = CGRect(origin: origin, size: size)
        firstLabel.textAlignment = .center
        firstLabel.text = "Город"
        firstLabel.textColor = .gray
        let font = UIFont.boldSystemFont(ofSize: 19)
        if let descriptor = font.fontDescriptor.withSymbolicTraits(.traitItalic) {
            firstLabel.font = UIFont(descriptor: descriptor, size: 19)
        }
        return firstLabel
    }()

    let labelOfTheSecondName: UILabel = {
        var labelOfTheSecondName = UILabel()
        let origin = CGPoint(x: 50, y: 282)
        let size = CGSize(width: 275, height: 57)
        labelOfTheSecondName.frame = CGRect(origin: origin, size: size)
        labelOfTheSecondName.textAlignment = .center
        labelOfTheSecondName.numberOfLines = 0
        labelOfTheSecondName.text = "А вот что получится, если читать справо налево"
        labelOfTheSecondName.font = UIFont.boldSystemFont(ofSize: 19)
        return labelOfTheSecondName
    }()

    let secondLabel: UILabel = {
        let secondLabel = UILabel()
        let origin = CGPoint(x: 60, y: 339)
        let size = CGSize(width: 275, height: 57)
        secondLabel.frame = CGRect(origin: origin, size: size)
        secondLabel.textAlignment = .center
        secondLabel.textColor = .gray
        let font = UIFont.boldSystemFont(ofSize: 19)
        if let descriptor = font.fontDescriptor.withSymbolicTraits(.traitItalic) {
            secondLabel.font = UIFont(descriptor: descriptor, size: 19)
        }
        return secondLabel
    }()

    let startButton: UIButton = {
        var startButton = UIButton()
        let origin = CGPoint(x: 20, y: 611)
        let size = CGSize(width: 350, height: 44)
        startButton.frame = CGRect(origin: origin, size: size)
        startButton.setTitle("Начать", for: .normal)
        startButton.titleLabel?.font = UIFont(name: "Verdana", size: 16)
        startButton.backgroundColor = #colorLiteral(red: 0.2979461551, green: 0.8465514779, blue: 0.399361372, alpha:
            1)
        return startButton
    }()

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        view.addSubview(labelOfTheFirstName)
        view.addSubview(firstLabel)
        view.addSubview(labelOfTheSecondName)
        view.addSubview(secondLabel)
        view.addSubview(startButton)

        startButton.addTarget(self, action: #selector(getItInReverseOrder), for: .touchUpInside)
    }

    // MARK: - Method

    @objc func getItInReverseOrder() {
        if let text = firstLabel.text {
            secondLabel.text = model.flipOver(text)
        }
    }
}
