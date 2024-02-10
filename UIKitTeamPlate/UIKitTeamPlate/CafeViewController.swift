// CafeViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Экран кафе
final class CafeViewController: UIViewController {
    // MARK: - @IBOutlets

    @IBOutlet private var switchReservations: UISwitch!
    @IBOutlet private var switchPrepayments: UISwitch!
    @IBOutlet private var switchVipRoom: UISwitch!
    @IBOutlet private var invoiceButton: UIButton!

    // MARK: - Private Properties

    @IBAction private func backButton(_ sender: Any) {
        dismiss(animated: true)
    }

    @IBAction private func invoiceButton(_ sender: Any) {
        let alertController = UIAlertController(title: "Выставить счет?", message: nil, preferredStyle: .alert)

        let cancelAction = UIAlertAction(title: "Отмена", style: .default)
        let chequeAction = UIAlertAction(title: "Чек", style: .default) { [weak self] _ in
            guard let self = self else { return }

            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            if let cheque = storyboard.instantiateViewController(
                identifier: "Cheque"
            ) as? ChequeViewController {
                if switchReservations.isOn {
                    cheque.tableReserve += "да"
                } else {
                    cheque.tableReserve += "нет"
                }

                if switchPrepayments.isOn {
                    cheque.prepaid += "да"
                } else {
                    cheque.prepaid += "нет"
                }

                if switchVipRoom.isOn {
                    cheque.vipRoom += "да"
                } else {
                    cheque.vipRoom += "нет"
                }

                self.show(cheque, sender: nil)
            }
        }

        alertController.addAction(cancelAction)
        alertController.addAction(chequeAction)
        alertController.preferredAction = chequeAction
        present(alertController, animated: true)
    }
}
