// ShoppingCartViewController.swift
// Copyright © RoadMap. All rights reserved.

// Наташа
import UIKit

/// Экран корзины покупок
final class ShoppingCartViewController: UIViewController {
    
  // MARK: - Constants
    enum Constants {
        static let padding: CGFloat = 20
        static let cellHeight: CGFloat = 177
        static let purchaseButtonText = "Оформить заказ - "
        static let tabBarItemTitle = "Корзина"
        static let tabBarItemImage = UIImage(named: "basketImage")
        static let itemImagePlaceholder = UIImage.basket
        static let boldFontName = "Verdana-Bold"
        static let emptyCartLabelText = "Ваша корзина пуста\n:("
    }

    // MARK: - Private Properties

    private var padding = Constants.padding
    private var orderprice: Int {
        var sum = 0
        for item in SavedItems.shared.savedItems {
            sum += item.fullPrice
        }
        return sum
    }

    private var shoppingCartCells: [ShoppingCartReusableView] = []

    // MARK: - Visual Components

    private let emptyCartLabel: UILabel = {
        let label = UILabel()
        label.text = Constants.emptyCartLabelText
        label.font = UIFont(name: Constants.boldFontName, size: 14)
        label.numberOfLines = 2
        label.textAlignment = .center
        label.textColor = .gray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private lazy var purchaseButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .customMagenta
        button.layer.cornerRadius = 16
        button.layer.shadowOffset = CGSize(width: 0, height: 4)
        button.layer.shadowColor = UIColor.lightGray.cgColor
        button.layer.shadowRadius = 2
        button.layer.shadowOpacity = 5
        button.titleLabel?.font = UIFont(name: Constants.boldFontName, size: 18)
        button.setTitleColor(.white, for: .normal)
        button.setTitleColor(.lightGray, for: .highlighted)
        button.isHidden = SavedItems.shared.savedItems.isEmpty ? true : false
        button.addTarget(self, action: #selector(purchase), for: .touchUpInside)
        view.addSubview(button)
        return button
    }()

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        configureTabBar()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        configureUI()
        configureConstraints()
    }

    override func viewWillDisappear(_ animated: Bool) {
        shoppingCartCells.forEach { $0.removeFromSuperview() }
        padding = Constants.padding
    }

    // MARK: - Private Methods

    private func configureUI() {
        navigationItem.title = Constant.nameForTitleNavigationItem
        view.backgroundColor = .white
        navigationItem.title = Constants.tabBarItemTitle
        view.addSubview(emptyCartLabel)
        emptyCartLabel.isHidden = SavedItems.shared.savedItems.isEmpty ? false : true
        configureConstraints()
        purchaseButton.setTitle("\(Constants.purchaseButtonText)\(orderprice)", for: .normal)
        setupCollection()
    }

    private func setupCollection() {
        for (index, item) in SavedItems.shared.savedItems.enumerated() {
            let cell = ShoppingCartReusableView()
            cell.itemImageView.image = UIImage(named: item.imageName) ?? Constants.itemImagePlaceholder
            cell.itemNameLabel.text = item.model
            cell.quantityLabel.text = "\(item.quantity)"
            cell.priceLabel.text = "\(item.fullPrice) ₽"
            cell.highlightSizeButton(size: item.chosenSize)
            view.addSubview(cell)
            cell.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: Constants.padding)
                .isActive = true
            cell.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
            cell.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
            shoppingCartCells.append(cell)
            padding += Constants.cellHeight
            cell.increasingCompletion = { [weak self] in
                SavedItems.shared.savedItems[index].quantity += 1
                cell.quantityLabel.text = "\(SavedItems.shared.savedItems[index].quantity)"
                cell.priceLabel.text = "\(SavedItems.shared.savedItems[index].fullPrice) ₽"
                self?.purchaseButton.setTitle("\(Constants.purchaseButtonText)\(self?.orderprice ?? 0)", for: .normal)
            }
            cell.decreasingCompletion = { [weak self] in
                SavedItems.shared.savedItems[index].quantity -= 1
                cell.quantityLabel.text = "\(SavedItems.shared.savedItems[index].quantity)"
                cell.priceLabel.text = "\(SavedItems.shared.savedItems[index].fullPrice) ₽"
                self?.purchaseButton.setTitle("\(Constants.purchaseButtonText)\(self?.orderprice ?? 0)", for: .normal)
            }
        }
    }

    private func configureConstraints() {
        emptyCartLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 200).isActive = true
        emptyCartLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        emptyCartLabel.heightAnchor.constraint(equalToConstant: 60).isActive = true
        emptyCartLabel.widthAnchor.constraint(equalToConstant: 180).isActive = true

        purchaseButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -50)
            .isActive = true
        purchaseButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30).isActive = true
        purchaseButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30).isActive = true
        purchaseButton.heightAnchor.constraint(equalToConstant: 44).isActive = true
    }

    private func configureTabBar() {
        let tabBarItem = UITabBarItem(
            title: Constants.tabBarItemTitle,
            image: Constants.tabBarItemImage,
            selectedImage: nil
        )
        self.tabBarItem = tabBarItem
    }

    @objc private func purchase() {
        SavedItems.shared.savedItems.removeAll()
        purchaseButton.isHidden = true
    }
}
