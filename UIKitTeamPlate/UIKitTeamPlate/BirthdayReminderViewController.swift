// BirthdayReminderViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Экран со списком дней рождения
class BirthdayReminderViewController: UIViewController {
    // MARK: - Private Constants

    private let photoHelenaImageView: UIImageView = {
        let photoHelenaImageView = UIImageView()
        return photoHelenaImageView.createCustomUIImageView(
            imageName: "photoHelena",
            frame: CGRect(x: 19, y: 105, width: 75, height: 75)
        )
    }()

    private let happyBirthdayImageView: UIImageView = {
        let happyBirthdayImageView = UIImageView()
        return happyBirthdayImageView.createCustomUIImageView(
            imageName: "imageHP",
            frame: CGRect(x: 314, y: 119, width: 44, height: 44)
        )
    }()

    private let photoVeronaImageView: UIImageView = {
        let photoVeronaImageView = UIImageView()
        return photoVeronaImageView.createCustomUIImageView(
            imageName: "photoVerona",
            frame: CGRect(x: 19, y: 200, width: 75, height: 75)
        )
    }()

    private let photoAlexImageView: UIImageView = {
        let photoAlexImageView = UIImageView()
        return photoAlexImageView.createCustomUIImageView(
            imageName: "photoAlex",
            frame: CGRect(x: 19, y: 295, width: 75, height: 75)
        )
    }()

    private let photoTomImageView: UIImageView = {
        let photoTomImageView = UIImageView()
        return photoTomImageView.createCustomUIImageView(
            imageName: "photoTom",
            frame: CGRect(x: 19, y: 390, width: 75, height: 75)
        )
    }()

    private let helenaLabel: UILabel = {
        let helenaLabel = UILabel()
        helenaLabel.text = "Helena Link"
        helenaLabel.font = UIFont(name: "Verdana-Bold", size: 16)
        helenaLabel.frame = CGRect(x: 102, y: 119, width: 209, height: 20)
        return helenaLabel
    }()

    private let veronaLabel: UILabel = {
        let veronaLabel = UILabel()
        veronaLabel.text = "Verona Tusk"
        veronaLabel.font = UIFont(name: "Verdana-Bold", size: 16)
        veronaLabel.frame = CGRect(x: 102, y: 214, width: 209, height: 20)
        return veronaLabel
    }()

    private let alexLabel: UILabel = {
        let alexLabel = UILabel()
        alexLabel.text = "Alex Smith"
        alexLabel.font = UIFont(name: "Verdana-Bold", size: 16)
        alexLabel.frame = CGRect(x: 102, y: 309, width: 209, height: 20)
        return alexLabel
    }()

    private let tomLabel: UILabel = {
        let tomLabel = UILabel()
        tomLabel.text = "Tom Johnson"
        tomLabel.font = UIFont(name: "Verdana-Bold", size: 16)
        tomLabel.frame = CGRect(x: 102, y: 404, width: 209, height: 20)
        return tomLabel
    }()

    private let birthdayHelenaLabel: UILabel = {
        let birthdayLabel = UILabel()
        birthdayLabel.text = "10.03 - turns 25!"
        birthdayLabel.font = UIFont(name: "Verdana", size: 16)
        birthdayLabel.frame = CGRect(x: 102, y: 147, width: 209, height: 20)
        return birthdayLabel
    }()

    private let birthdayVeronaLabel: UILabel = {
        let birthdayLabel = UILabel()
        birthdayLabel.text = "20.03 - turns 39!"
        birthdayLabel.font = UIFont(name: "Verdana", size: 16)
        birthdayLabel.frame = CGRect(x: 102, y: 242, width: 209, height: 20)
        return birthdayLabel
    }()

    private let birthdayAlexLabel: UILabel = {
        let birthdayLabel = UILabel()
        birthdayLabel.text = "21.04 - turns 51!"
        birthdayLabel.font = UIFont(name: "Verdana", size: 16)
        birthdayLabel.frame = CGRect(x: 102, y: 337, width: 209, height: 20)
        return birthdayLabel
    }()

    private let birthdayTomLabel: UILabel = {
        let birthdayLabel = UILabel()
        birthdayLabel.text = "05.05 - turns 18!"
        birthdayLabel.font = UIFont(name: "Verdana", size: 16)
        birthdayLabel.frame = CGRect(x: 102, y: 432, width: 209, height: 20)
        return birthdayLabel
    }()

    private let daysBeforeVeronaBirthdayLabel: UILabel = {
        let daysBeforeHP = UILabel()
        daysBeforeHP.text = "42\ndays"
        daysBeforeHP.numberOfLines = 0
        daysBeforeHP.font = UIFont(name: "Verdana-Bold", size: 16)
        daysBeforeHP.textAlignment = .center
        daysBeforeHP.textColor = .appViolet
        daysBeforeHP.frame = CGRect(x: 310, y: 214, width: 52, height: 42)
        return daysBeforeHP
    }()

    private let daysBeforeAlexBirthdayLabel: UILabel = {
        let daysBeforeHP = UILabel()
        daysBeforeHP.text = "42\ndays"
        daysBeforeHP.numberOfLines = 0
        daysBeforeHP.font = UIFont(name: "Verdana-Bold", size: 16)
        daysBeforeHP.textAlignment = .center
        daysBeforeHP.textColor = .appViolet
        daysBeforeHP.frame = CGRect(x: 310, y: 309, width: 52, height: 42)
        return daysBeforeHP
    }()

    private let daysBeforeTomBirthdayLabel: UILabel = {
        let daysBeforeHP = UILabel()
        daysBeforeHP.text = "87\ndays"
        daysBeforeHP.numberOfLines = 0
        daysBeforeHP.font = UIFont(name: "Verdana-Bold", size: 16)
        daysBeforeHP.textAlignment = .center
        daysBeforeHP.textColor = .appViolet
        daysBeforeHP.frame = CGRect(x: 310, y: 404, width: 52, height: 42)
        return daysBeforeHP
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
        view.addSubview(birthdayHelenaLabel)
        view.addSubview(birthdayVeronaLabel)
        view.addSubview(birthdayAlexLabel)
        view.addSubview(birthdayTomLabel)
        view.addSubview(happyBirthdayImageView)
        view.addSubview(daysBeforeVeronaBirthdayLabel)
        view.addSubview(daysBeforeAlexBirthdayLabel)
        view.addSubview(daysBeforeTomBirthdayLabel)
    }

    @objc private func createUserProfile() {
        let userProfileVC = UserProfileViewController()
        let navigationController = UINavigationController(
            rootViewController: userProfileVC
        )
        navigationController.modalPresentationStyle = .popover
        present(navigationController, animated: true)
    }
}
