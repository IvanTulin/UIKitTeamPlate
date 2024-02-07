// ViewControllerTwo.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Второй экран
class ViewControllerTwo: UIViewController {
    // MARK: - Variable

    var number = 77

    // MARK: - Method

    override func loadView() {
        super.loadView()
        view.backgroundColor = .red
        print("loadView")
        hello()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        print("viewDidLoad")
    }

    override func viewWillAppear(_ animated: Bool) {
        print("viewWillAppear")
    }

    override func viewDidLayoutSubviews() {
        print("viewDidLayoutSubviews")
    }

    // MARK: - Func

    func hello() {
        print("Hi")
    }
}
