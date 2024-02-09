// ElectronicReceiptViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Экран электронного чека
final class ElectronicReceiptViewController: UIViewController {
    // MARK: - @IBOutlets

    @IBOutlet var infoLable: UILabel!
    @IBOutlet var closeButton: UIButton!

    // MARK: - Methods

    @IBAction func backButton(_ sender: UIButton) {
        dismiss(animated: true)
    }
    @IBAction func closeButton(_ sender: UIButton) {
        dismiss(animated: true)
    }
}
