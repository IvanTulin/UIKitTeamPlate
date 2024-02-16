// ShoppingCartViewController.swift
// Copyright © RoadMap. All rights reserved.

// Наташа
import UIKit

/// Экран корзины покупок
class ShoppingCartViewController: UIViewController {
    var padding: CGFloat = 20
    var orderprice: Int {
        var sum = 0
        for item in SavedItems.shared.savedItems {
            sum += item.fullPrice
        }
        return sum
    }

    var shoppingCartCells: [ShoppingCartReusableView] = []

    // MARK: - Visual Components

    private lazy var purchaseButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .customMagenta
        button.layer.cornerRadius = 16
        button.layer.shadowOffset = CGSize(width: 0, height: 4)
        button.layer.shadowColor = UIColor.lightGray.cgColor
        button.layer.shadowRadius = 2
        button.layer.shadowOpacity = 5
        button.titleLabel?.font = UIFont(name: "Verdana-Bold", size: 18)
        button.setTitleColor(.white, for: .normal)
        button.setTitleColor(.lightGray, for: .highlighted)
        button.isHidden = false
//        button.addTarget(self, action: #selector(purchase), for: .touchUpInside)
        view.addSubview(button)
        return button
    }()

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        configureUI()
    }

    override func viewWillDisappear(_ animated: Bool) {
        shoppingCartCells.forEach { $0.removeFromSuperview() }
        padding = 20
//        }
    }

    private func configureUI() {
        view.backgroundColor = .white
        navigationItem.title = "Корзина"
        configureTabBar()
        configureConstraints()
        purchaseButton.setTitle("Оформить заказ - \(orderprice)", for: .normal)
        setupCollection()
    }

    func setupCollection() {
        for (index, item) in SavedItems.shared.savedItems.enumerated() {
            let cell = ShoppingCartReusableView()
            cell.itemImageView.image = UIImage(named: item.imageName) ?? UIImage(named: "logo")
            cell.itemNameLabel.text = item.model
            cell.quantityLabel.text = "\(item.quantity)"
            cell.priceLabel.text = "\(item.fullPrice) ₽"
            view.addSubview(cell)
            cell.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: padding).isActive = true
            cell.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
            cell.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
            shoppingCartCells.append(cell)
            padding += 177
            cell.increasingCompletion = { [weak self] in
                SavedItems.shared.savedItems[index].quantity += 1
                cell.quantityLabel.text = "\(SavedItems.shared.savedItems[index].quantity)"
                cell.priceLabel.text = "\(SavedItems.shared.savedItems[index].fullPrice) ₽"
                self?.purchaseButton.setTitle("Оформить заказ - \(self?.orderprice ?? 0)", for: .normal)
            }
            cell.decreasingCompletion = { [weak self] in
                SavedItems.shared.savedItems[index].quantity -= 1
                cell.quantityLabel.text = "\(SavedItems.shared.savedItems[index].quantity)"
                cell.priceLabel.text = "\(SavedItems.shared.savedItems[index].fullPrice) ₽"
                self?.purchaseButton.setTitle("Оформить заказ - \(self?.orderprice ?? 0)", for: .normal)
            }
        }
    }

    private func configureConstraints() {
        purchaseButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -50)
            .isActive = true
        purchaseButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30).isActive = true
        purchaseButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30).isActive = true
        purchaseButton.heightAnchor.constraint(equalToConstant: 44).isActive = true
    }

    private func configureTabBar() {
        let tabBarItem = UITabBarItem(
            title: "Корзина",
            image: UIImage(named: "basketImage"),
            selectedImage: nil
        )
        self.tabBarItem = tabBarItem
    }
}
