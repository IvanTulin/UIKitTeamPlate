// BirthdayReminderViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Экран со списком дней рождения
class BirthdayReminderViewController: UIViewController {
    // MARK: - Private Constants

    private let photoHelenaImageView: UIImageView = {
        let photoHelenaImageView = UIImageView()
        photoHelenaImageView.image = UIImage(named: "photoHelena")
        photoHelenaImageView.frame = CGRect(x: 19, y: 105, width: 75, height: 75)
        return photoHelenaImageView
    }()

    private let photoVeronaImageView: UIImageView = {
        let photoHelenaImageView = UIImageView()
        photoHelenaImageView.image = UIImage(named: "photoVerona")
        photoHelenaImageView.frame = CGRect(x: 19, y: 200, width: 75, height: 75)
        return photoHelenaImageView
    }()

    private let photoAlexImageView: UIImageView = {
        let photoHelenaImageView = UIImageView()
        photoHelenaImageView.image = UIImage(named: "photoAlex")
        photoHelenaImageView.frame = CGRect(x: 19, y: 295, width: 75, height: 75)
        return photoHelenaImageView
    }()

    private let photoTomImageView: UIImageView = {
        let photoHelenaImageView = UIImageView()
        photoHelenaImageView.image = UIImage(named: "photoTom")
        photoHelenaImageView.frame = CGRect(x: 19, y: 390, width: 75, height: 75)
        return photoHelenaImageView
    }()

    private let helenaLabel: UILabel = {
        let helenaLabel = UILabel()
        helenaLabel.text = "Helena Link"
        helenaLabel.font = UIFont(name: "Verdana-Bold", size: 16)
        helenaLabel.frame = CGRect(x: 102, y: 119, width: 209, height: 20)
        return helenaLabel
    }()

    private let veronaLabel: UILabel = {
        let helenaLabel = UILabel()
        helenaLabel.text = "Verona Tusk"
        helenaLabel.font = UIFont(name: "Verdana-Bold", size: 16)
        helenaLabel.frame = CGRect(x: 102, y: 214, width: 209, height: 20)
        return helenaLabel
    }()

    private let alexLabel: UILabel = {
        let helenaLabel = UILabel()
        helenaLabel.text = "Alex Smith"
        helenaLabel.font = UIFont(name: "Verdana-Bold", size: 16)
        helenaLabel.frame = CGRect(x: 102, y: 309, width: 209, height: 20)
        return helenaLabel
    }()

    private let tomLabel: UILabel = {
        let helenaLabel = UILabel()
        helenaLabel.text = "Tom Johnson"
        helenaLabel.font = UIFont(name: "Verdana-Bold", size: 16)
        helenaLabel.frame = CGRect(x: 102, y: 404, width: 209, height: 20)
        return helenaLabel
    }()

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        configureNavigationBar()
        configureUI()
    }

    // MARK: - Private Methods

    private func configureNavigationBar() {
        title = "Birthday Reminder"
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            barButtonSystemItem: .add,
            target: self,
            action: #selector(createUserProfile)
        )
    }

    private func configureUI() {
        view.backgroundColor = .white
        view.addSubview(photoHelenaImageView)
        view.addSubview(photoVeronaImageView)
        view.addSubview(photoAlexImageView)
        view.addSubview(photoTomImageView)
        view.addSubview(helenaLabel)
        view.addSubview(veronaLabel)
        view.addSubview(alexLabel)
        view.addSubview(tomLabel)
    }

    @objc private func createUserProfile() {}
}
