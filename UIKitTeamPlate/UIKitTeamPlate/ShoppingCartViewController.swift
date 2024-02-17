// ShoppingCartViewController.swift
// Copyright © RoadMap. All rights reserved.

// Наташа
import UIKit

/// Экран корзины покупок
final class ShoppingCartViewController: UIViewController {
    // MARK: - Visual Components

    var selectedShoesView: ChoosingShoesView!
    var costLabel: UILabel!

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        configureConstraints()
    }

    // MARK: - Private Methods

    private func configureUI() {
        navigationItem.title = "Корзина"
        view.backgroundColor = .white
        configureChoosingShoesView()
    }

    private func configureConstraints() {
        NSLayoutConstraint.activate([
            selectedShoesView.leftAnchor.constraint(
                equalTo: view.leftAnchor,
                constant: 16
            ),
            selectedShoesView.topAnchor.constraint(
                equalTo: view.topAnchor,
                constant: 116
            ),
            selectedShoesView.widthAnchor.constraint(equalToConstant: 157),
            selectedShoesView.heightAnchor.constraint(equalToConstant: 157),

            costLabel.leftAnchor.constraint(
                equalTo: view.leftAnchor,
                constant: 296
            ),
            costLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 260),
            costLabel.widthAnchor.constraint(equalToConstant: 63),
            costLabel.heightAnchor.constraint(equalToConstant: 12)
        ])
    }

    private func configureChoosingShoesView() {
        selectedShoesView = ChoosingShoesView()
        selectedShoesView.backgroundColor = .appLightGray
        selectedShoesView.shoppingCartButton.addTarget(self, action: #selector(pressButton), for: .touchUpInside)
        selectedShoesView.layer.cornerRadius = 15
        selectedShoesView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(selectedShoesView)

        costLabel = UILabel()
        costLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(costLabel)

        if let image = ShoppingCartModel.shared.shoes {
            selectedShoesView.shoesImageView.image = image
        }
        if let text = ShoppingCartModel.shared.costShoes {
            // selectedShoesView.costLabel.text = text
            costLabel.text = text
        }
    }

    @objc private func pressButton() {
        print("pressButton")
    }
}
