// ElectronicReceiptViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Экран электронного чека
class ElectronicReceiptViewController: UIViewController {
    // MARK: - @IBOutlets

    @IBOutlet var infoLable: UILabel!
    @IBOutlet var closeButton: UIButton!

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        configureUIElements()
    }

    // MARK: - Methods

    func configureUIElements() {
        closeButton.layer.cornerRadius = 10
    }

    @IBAction func backButton(_ sender: UIButton) {
        dismiss(animated: true)
    }

    @IBAction func closeButton(_ sender: UIButton) {
        dismiss(animated: true)
    }
}
