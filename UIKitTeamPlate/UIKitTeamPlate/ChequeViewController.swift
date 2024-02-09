// ChequeViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Экран чека
class ChequeViewController: UIViewController {
    // MARK: - Constants

    let segueIdentifier = "goToElectronicCheque"

    // MARK: - @IBOutlets

    @IBOutlet var resultButton: UIButton!

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        configureUIElements()
    }

    // MARK: - Methods

    func configureUIElements() {
        resultButton.layer.cornerRadius = 10
    }

    @IBAction func backButton(_ sender: UIButton) {
        dismiss(animated: true)
    }

    @IBAction func resultButton(_ sender: UIButton) {
        let alertController = UIAlertController(title: "Вы хотите оплатить чек?", message: nil, preferredStyle: .alert)

        let actionYes = UIAlertAction(title: "Да", style: .default) { [weak self] _ in
            guard let self = self else { return }
            self.performSegue(withIdentifier: self.segueIdentifier, sender: nil)
        }
        let actionCancel = UIAlertAction(title: "Отмена", style: .default)

        alertController.addAction(actionCancel)
        alertController.addAction(actionYes)
        alertController.preferredAction = actionYes
        present(alertController, animated: true)
    }
}
