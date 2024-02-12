// BirthdayReminderViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

protocol BirthdayDelegate: AnyObject {
    func update(photo: UIImage, name: String, dateOfBirth: String)
}

/// Экран со списком дней рождения
final class BirthdayReminderViewController: UIViewController {
    // MARK: - Private Constants

    private let userProfileVC = UserProfileViewController()

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
        return helenaLabel.createCustomLabel(
            text: "Helena Link",
            fontName: "Verdana-Bold",
            fontsize: 16,
            frame: CGRect(x: 102, y: 119, width: 209, height: 20),
            textAligment: .left
        )
    }()

    private let veronaLabel: UILabel = {
        let veronaLabel = UILabel()
        return veronaLabel.createCustomLabel(
            text: "Verona Tusk",
            fontName: "Verdana-Bold",
            fontsize: 16,
            frame: CGRect(x: 102, y: 214, width: 209, height: 20),
            textAligment: .left
        )
    }()

    private let alexLabel: UILabel = {
        let alexLabel = UILabel()
        return alexLabel.createCustomLabel(
            text: "Alex Smith",
            fontName: "Verdana-Bold",
            fontsize: 16,
            frame: CGRect(x: 102, y: 309, width: 209, height: 20),
            textAligment: .left
        )
    }()

    private let tomLabel: UILabel = {
        let tomLabel = UILabel()
        return tomLabel.createCustomLabel(
            text: "Tom Johnson",
            fontName: "Verdana-Bold",
            fontsize: 16,
            frame: CGRect(x: 102, y: 404, width: 209, height: 20),
            textAligment: .left
        )
    }()

    private let birthdayHelenaLabel: UILabel = {
        let birthdayLabel = UILabel()
        return birthdayLabel.createCustomLabel(
            text: "10.03 - turns 25!",
            fontName: "Verdana",
            fontsize: 16,
            frame: CGRect(x: 102, y: 147, width: 209, height: 20),
            textAligment: .left
        )
    }()

    private let birthdayVeronaLabel: UILabel = {
        let birthdayLabel = UILabel()
        return birthdayLabel.createCustomLabel(
            text: "20.03 - turns 39!",
            fontName: "Verdana",
            fontsize: 16,
            frame: CGRect(x: 102, y: 242, width: 209, height: 20),
            textAligment: .left
        )
    }()

    private let birthdayAlexLabel: UILabel = {
        let birthdayLabel = UILabel()
        return birthdayLabel.createCustomLabel(
            text: "21.04 - turns 51!",
            fontName: "Verdana",
            fontsize: 16,
            frame: CGRect(x: 102, y: 337, width: 209, height: 20),
            textAligment: .left
        )
    }()

    private let birthdayTomLabel: UILabel = {
        let birthdayLabel = UILabel()
        return birthdayLabel.createCustomLabel(
            text: "05.05 - turns 18!",
            fontName: "Verdana",
            fontsize: 16,
            frame: CGRect(x: 102, y: 432, width: 209, height: 20),
            textAligment: .left
        )

    }()

    private let daysBeforeVeronaBirthdayLabel: UILabel = {
        let daysBeforeHP = UILabel()
        return daysBeforeHP.createCustomLabel(
            text: "10\ndays",
            fontName: "Verdana-Bold",
            fontsize: 16,
            frame: CGRect(x: 310, y: 214, width: 52, height: 42),
            numberOfLine: 0,
            textAligment: .center,
            textColor: .appViolet
        )
    }()

    private let daysBeforeAlexBirthdayLabel: UILabel = {
        let daysBeforeHP = UILabel()
        return daysBeforeHP.createCustomLabel(
            text: "42\ndays",
            fontName: "Verdana-Bold",
            fontsize: 16,
            frame: CGRect(x: 310, y: 309, width: 52, height: 42),
            numberOfLine: 0,
            textAligment: .center,
            textColor: .appViolet
        )
    }()

    private let daysBeforeTomBirthdayLabel: UILabel = {
        let daysBeforeHP = UILabel()
        return daysBeforeHP.createCustomLabel(
            text: "82\ndays",
            fontName: "Verdana-Bold",
            fontsize: 16,
            frame: CGRect(x: 310, y: 404, width: 52, height: 42),
            numberOfLine: 0,
            textAligment: .center,
            textColor: .appViolet
        )
    }()

    // MARK: - Private Properties

    private var photoNewUserImageView: UIImageView = {
        let photoTomImageView = UIImageView()
        return photoTomImageView.createCustomUIImageView(
            imageName: "",
            frame: CGRect(x: 19, y: 485, width: 75, height: 75),
            clipsToBounds: true,
            cornerRadius: 37
        )
    }()

    private var newUserNameLabel: UILabel = {
        let newUserNameLabel = UILabel()
        return newUserNameLabel.createCustomLabel(
            text: "",
            fontName: "Verdana-Bold",
            fontsize: 16,
            frame: CGRect(x: 102, y: 499, width: 209, height: 20),
            textAligment: .left
        )
    }()

    private var birthdayNewUserLabel: UILabel = {
        let birthdayLabel = UILabel()
        return birthdayLabel.createCustomLabel(
            text: "",
            fontName: "Verdana",
            fontsize: 16,
            frame: CGRect(x: 102, y: 527, width: 209, height: 20),
            textAligment: .left
        )
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
        view.addSubview(photoNewUserImageView)
        view.addSubview(newUserNameLabel)
        view.addSubview(birthdayNewUserLabel)
    }

    /// переход на новый экрна создания пользователя
    @objc private func createUserProfile() {
        let userProfileVC = UserProfileViewController()
        userProfileVC.delegate = self
        present(userProfileVC, animated: true)
    }
}

// MARK: - BirthdayDelegate

extension BirthdayReminderViewController: BirthdayDelegate {
    func update(photo: UIImage, name: String, dateOfBirth: String) {
        photoNewUserImageView.image = photo
        newUserNameLabel.text = name
        birthdayNewUserLabel.text = dateOfBirth
    }
}
