// UserProfileViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Экран создания профиля
class UserProfileViewController: UIViewController {
    private lazy var cancelProfileButton = UIBarButtonItem(
        title: "Cancel",
        style: .plain,
        target: self,
        action: #selector(logOutOfProfile)
    )

    private lazy var addProfileButton = UIBarButtonItem(
        title: "Add",
        style: .plain,
        target: self,
        action: #selector(addUserProfile)
    )

    private let profilePhotoImageView: UIImageView = {
        let profilePhotoImageView = UIImageView()
        profilePhotoImageView.image = UIImage(named: "userPhoto")
        profilePhotoImageView.frame = CGRect(
            x: 125,
            y: 66,
            width: 125,
            height: 125
        )
        return profilePhotoImageView
    }()

    private let nameLabel: UILabel = {
        let nameLabel = UILabel()
        nameLabel.text = "Name Surname"
        nameLabel.font = UIFont(name: "Verdana-Bold", size: 16)
        nameLabel.frame = CGRect(x: 20, y: 239, width: 175, height: 19)
        return nameLabel
    }()

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }

    // MARK: - Private Methods

    private func configureUI() {
        view.backgroundColor = .white
        navigationItem.leftBarButtonItem = cancelProfileButton
        navigationItem.rightBarButtonItem = addProfileButton

        view.addSubview(profilePhotoImageView)
        view.addSubview(nameLabel)
    }

    @objc func logOutOfProfile() {}

    @objc func addUserProfile() {}
}
