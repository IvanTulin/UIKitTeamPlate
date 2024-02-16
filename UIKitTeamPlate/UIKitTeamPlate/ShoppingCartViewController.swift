// ShoppingCartViewController.swift
// Copyright © RoadMap. All rights reserved.

// Наташа
import UIKit

/// Экран корзины покупок
class ShoppingCartViewController: UIViewController {
    var padding: CGFloat = 20

    // MARK: - Visual Components

//    private lazy var cartCell = ShoppingCartReusableView()

    private var cartItems: [Shoes] = [Shoes(
        imageName: "invite",
        model: "Женские туфли",
        sostav: "кожа питона",
        chosenSize: 36,
        quantity: 1,
        itemPrice: 2750
    ), Shoes(imageName: "shoe", model: "лучшие ботинки", sostav: "", chosenSize: 37, quantity: 2, itemPrice: 3200)]

    private lazy var purchaseButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .customMagenta
        button.layer.cornerRadius = 16
        button.layer.shadowOffset = CGSize(width: 0, height: 4)
        button.layer.shadowColor = UIColor.lightGray.cgColor
        button.layer.shadowRadius = 2
        button.layer.shadowOpacity = 5
        button.setTitle("Оформить заказ", for: .normal)
        button.titleLabel?.font = UIFont(name: "Verdana-Bold", size: 18)
        button.setTitleColor(.white, for: .normal)
        button.setTitleColor(.lightGray, for: .highlighted)
        button.isHidden = false
//        button.addTarget(self, action: #selector(purchase), for: .touchUpInside)
        view.addSubview(button)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }

    private func configureUI() {
        view.backgroundColor = .white
        navigationItem.title = "Корзина"
        configureTabBar()
//        view.addSubview(cartCell)
        configureConstraints()
        setupCollection()
    }

    func setupCollection() {
        for (index, item) in cartItems.enumerated() {
            print(index)
            let cell = ShoppingCartReusableView()
            cell.itemImageView.image = UIImage(named: item.imageName) ?? UIImage(named: "logo")
            cell.itemNameLabel.text = item.model
            cell.quantityLabel.text = "\(item.quantity)"
            cell.priceLabel.text = "\(item.fullPrice) ₽"
            view.addSubview(cell)
            cell.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: padding).isActive = true
            cell.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
            cell.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
            padding += 177
            cell.increasingCompletion = { [weak self] in
                self?.cartItems[index].quantity += 1
                print("cell \(self?.cartItems[index].quantity ?? 00)")
                cell.quantityLabel.text = "\(self?.cartItems[index].quantity ?? 0)"
                cell.priceLabel.text = "\(self?.cartItems[index].fullPrice ?? 0) ₽"
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
