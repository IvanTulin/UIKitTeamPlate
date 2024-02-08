// StartViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Стартовый экран
class StartViewController: UIViewController {
    var startButton: UIButton = {
        var startButton = UIButton()
        let origin = CGPoint(x: 20, y: 406)
        let size = CGSize(width: 335, height: 44)
        startButton.frame = CGRect(origin: origin, size: size)
        startButton.setTitle("Начать", for: .normal)
        startButton.titleLabel?.font = UIFont(name: "Verdana", size: 16)
        startButton.backgroundColor = #colorLiteral(red: 0.2979461551, green: 0.8465514779, blue: 0.399361372, alpha: 1)
        return startButton
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(startButton)
        
        startButton.addTarget(self, action: #selector(enterWord), for: .touchUpInside)
    }
    
    
    @objc func enterWord() {
        let alertController = UIAlertController(title: "Введите ваше слово", message: nil, preferredStyle: .alert)
        alertController.addTextField { text in
            text.placeholder = "Введите слово"
        }
        let forwardAction = UIAlertAction(title: "Ok", style: .cancel) { _ in
            
        }
    }
}
