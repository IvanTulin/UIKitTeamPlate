// CafeViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Экран кафе
class CafeViewController: UIViewController {
    // MARK: - Constants
    let segueIdentifier = "goToCheque"
    
    // MARK: - @IBOutlets
    @IBOutlet var nameTextField: UITextField!
    @IBOutlet var numberOfGuestTextField: UITextField!
    @IBOutlet var tableNumberTextField: UITextField!
    @IBOutlet var switchReservations: UISwitch!
    @IBOutlet var switchPrepayments: UISwitch!
    @IBOutlet var switchVipRoom: UISwitch!
    @IBOutlet var invoiceButton: UIButton!

    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUIElements()
    }
    
    // MARK: - Methods
    func configureUIElements() {
        invoiceButton.layer.cornerRadius = 10
    }

    @IBAction func backButton(_ sender: Any) {
        dismiss(animated: true)
    }

    @IBAction func invoiceButton(_ sender: Any) {
        let alertController = UIAlertController(title: "Выставить счет?", message: nil, preferredStyle: .alert)

        let cancelAction = UIAlertAction(title: "Отмена", style: .default)
        let chequeAction = UIAlertAction(title: "Чек", style: .default)
        { [weak self]  _ in
            guard let self = self else { return }
            self.performSegue(withIdentifier: self.segueIdentifier, sender: nil)
        }
        
        alertController.addAction(cancelAction)
        alertController.addAction(chequeAction)
        alertController.preferredAction = chequeAction
        present(alertController, animated: true)
    }
}
