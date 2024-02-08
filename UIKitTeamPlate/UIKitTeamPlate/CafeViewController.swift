// CafeViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Экран кафе
class CafeViewController: UIViewController {
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var numberOfGuestTextField: UITextField!
    @IBOutlet weak var tableNumberTextField: UITextField!
    @IBOutlet weak var switchReservations: UISwitch!
    @IBOutlet weak var switchPrepayments: UISwitch!
    @IBOutlet weak var switchVipRoom: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
    }
    
    
    @IBAction func backButton(_ sender: Any) {
    }
    
    @IBAction func invoiceButton(_ sender: Any) {
    }
    
}
