// ChequeViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Экран чека
final class ChequeViewController: UIViewController {
    // MARK: - @IBOutlets

    @IBOutlet private var resultButton: UIButton!
    @IBOutlet private var tableReservationLabel: UILabel!
    @IBOutlet private var prepaidLabel: UILabel!
    @IBOutlet private var labelVipRoom: UILabel!

    // MARK: - Properties

    var tableReserve = "Стол забронирован: "
    var prepaid = "Номер стола: "
    var vipRoom = "VIP комната: "

    // MARK: - Private Properties

    private let segueIdentifier = "goToElectronicCheque"

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        configureUIElements()
    }

    // MARK: - Private Method

    private func configureUIElements() {
        tableReservationLabel.text = tableReserve
        prepaidLabel.text = prepaid
        labelVipRoom.text = vipRoom
    }

    @IBAction private func backButton(_ sender: UIButton) {
        dismiss(animated: true)
    }

    @IBAction private func resultButton(_ sender: UIButton) {
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
