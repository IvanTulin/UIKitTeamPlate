// CatalogViewController.swift
// Copyright © RoadMap. All rights reserved.

// Иван
import UIKit

/// Экран католога
class CatalogViewController: UIViewController {
    let shoe = Shoes(
        imageName: "shoe",
        model: "лучшие ботинки",
        sostav: "",
        chosenSize: 37,
        quantity: 2,
        itemPrice: 3200
    )

    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }

    private func configureUI() {
        view.backgroundColor = .white
        navigationItem.title = "Каталог"
        configureTabBar()

        SavedItems.shared.savedItems.append(Shoes(
            imageName: "invite",
            model: "Женские туфли",
            sostav: "кожа питона",
            chosenSize: 36,
            quantity: 1,
            itemPrice: 2750
        ))

        let button = UIButton(frame: CGRect(x: 40, y: 120, width: 50, height: 50))
        view.addSubview(button)
        button.layer.backgroundColor = UIColor.magenta.cgColor
        button.setImage(UIImage.info, for: .normal)
    }

    private func configureTabBar() {
        let tabBarItem = UITabBarItem(
            title: "Каталог",
            image: .catalog,
            selectedImage: nil
        )
        self.tabBarItem = tabBarItem
    }
}
