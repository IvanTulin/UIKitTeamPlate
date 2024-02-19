// ChoosingShoesViewController.swift
// Copyright © RoadMap. All rights reserved.

// Иван
import UIKit

// protocol ShoppingCartProtocol: AnyObject {
//    func setupImage(image: UIImage)
// }

/// Экран выбора обуви
final class ChoosingShoesViewController: UIViewController {
    // MARK: - Constants

    enum Constant {
        static let nameForTitleNavigationItem = "Обувь"
        static let textForCostShoesWithHeelsLabel = "2250 ₽"
        static let textForCostBootsLabel = "4250 ₽"
        static let textForCostRunningShoesLabel = "5750 ₽"
        static let textForCostYellowShoesLabel = "3500 ₽"
        static let textForCostSneakersLabel = "5750 ₽"
    }

    // MARK: - Visual Components

    private lazy var shoesWithHeelsView: ChoosingShoesView = {
        let view = ChoosingShoesView()
        view.backgroundColor = .appLightGray
        view.shoesImageView.image = .shoesWithHeels
        view.costLabel.text = Constant.textForCostShoesWithHeelsLabel
        view.shoppingCartButton.tag = 1
        view.shoppingCartButton.addTarget(
            self,
            action: #selector(transferToShoppingCart),
            for: .touchUpInside
        )
        view.layer.cornerRadius = 15
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private lazy var bootsView: ChoosingShoesView = {
        let view = ChoosingShoesView()
        view.backgroundColor = .appLightGray
        view.shoesImageView.image = .boots
        view.costLabel.text = Constant.textForCostBootsLabel
        view.shoppingCartButton.tag = 2
        view.shoppingCartButton.addTarget(
            self,
            action: #selector(transferToShoppingCart2),
            for: .touchUpInside
        )
        view.layer.cornerRadius = 15
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private lazy var runningShoesView: ChoosingShoesView = {
        let view = ChoosingShoesView()
        view.backgroundColor = .appLightGray
        view.shoesImageView.image = .runningShoes
        view.costLabel.text = Constant.textForCostRunningShoesLabel
        view.layer.cornerRadius = 15
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private lazy var yellowShoesView: ChoosingShoesView = {
        let view = ChoosingShoesView()
        view.backgroundColor = .appLightGray
        view.shoesImageView.image = .yellowShoes
        view.costLabel.text = Constant.textForCostYellowShoesLabel
        view.layer.cornerRadius = 15
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private lazy var sneakersView: ChoosingShoesView = {
        let view = ChoosingShoesView()
        view.backgroundColor = .appLightGray
        view.shoesImageView.image = .sneakers
        view.costLabel.text = Constant.textForCostSneakersLabel
        view.layer.cornerRadius = 15
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private lazy var backButton: UIButton = {
        let button = UIButton()
        button.setImage(.backButton, for: .normal)
        button.sizeToFit()
        button.addTarget(self, action: #selector(returnCatalogViewController), for: .touchUpInside)
        return button
    }()

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        configureNavigationItem()
        configureUI()
        configureConstraints()
    }

    // MARK: - Private Methods

    private func configureUI() {
        view.backgroundColor = .white
        view.addSubview(shoesWithHeelsView)
        view.addSubview(bootsView)
        view.addSubview(runningShoesView)
        view.addSubview(yellowShoesView)
        view.addSubview(sneakersView)
    }

    private func configureNavigationItem() {
        navigationItem.title = Constant.nameForTitleNavigationItem
        let barButtonItem = UIBarButtonItem(customView: backButton)
        navigationItem.leftBarButtonItem = barButtonItem
    }

    private func configureConstraints() {
        NSLayoutConstraint.activate([
            shoesWithHeelsView.leftAnchor.constraint(
                equalTo: view.leftAnchor,
                constant: 20
            ),
            shoesWithHeelsView.topAnchor.constraint(equalTo: view.topAnchor, constant: 130),
            shoesWithHeelsView.widthAnchor.constraint(equalToConstant: 157),
            shoesWithHeelsView.heightAnchor.constraint(equalToConstant: 157),

            bootsView.leftAnchor.constraint(
                equalTo: shoesWithHeelsView.rightAnchor,
                constant: 20
            ),
            bootsView.topAnchor.constraint(equalTo: view.topAnchor, constant: 130),
            bootsView.widthAnchor.constraint(equalToConstant: 157),
            bootsView.heightAnchor.constraint(equalToConstant: 157),

            runningShoesView.leftAnchor.constraint(
                equalTo: view.leftAnchor,
                constant: 20
            ),
            runningShoesView.topAnchor.constraint(
                equalTo: shoesWithHeelsView.bottomAnchor,
                constant: 16
            ),
            runningShoesView.widthAnchor.constraint(equalToConstant: 157),
            runningShoesView.heightAnchor.constraint(equalToConstant: 157),

            yellowShoesView.leftAnchor.constraint(
                equalTo: runningShoesView.rightAnchor,
                constant: 20
            ),
            yellowShoesView.topAnchor.constraint(
                equalTo: bootsView.bottomAnchor,
                constant: 16
            ),
            yellowShoesView.widthAnchor.constraint(equalToConstant: 157),
            yellowShoesView.heightAnchor.constraint(equalToConstant: 157),

            sneakersView.leftAnchor.constraint(
                equalTo: view.leftAnchor,
                constant: 20
            ),
            sneakersView.topAnchor.constraint(
                equalTo: runningShoesView.bottomAnchor,
                constant: 16
            ),
            sneakersView.widthAnchor.constraint(equalToConstant: 157),
            sneakersView.heightAnchor.constraint(equalToConstant: 157)
        ])
    }

    @objc private func returnCatalogViewController() {
        navigationController?.popViewController(animated: true)
    }

    @objc private func transferToShoppingCart2() {
        if bootsView.shoppingCartButton.currentImage == .shoppinCart {
            bootsView.shoppingCartButton.setImage(
                .basketFill,
                for: .normal
            )
            let choosingSizeVewController = ChoosingTheSizeViewController()
            navigationController?.present(
                choosingSizeVewController,
                animated: true
            )
        } else {
            bootsView.shoppingCartButton.setImage(
                .shoppinCart,
                for: .normal
            )
        }

        ShoppingCartModel.shared.shoes = bootsView.shoesImageView.image
        ShoppingCartModel.shared.costShoes = bootsView.costLabel.text
    }

    @objc private func transferToShoppingCart() {
        if shoesWithHeelsView.shoppingCartButton.currentImage == .shoppinCart {
            shoesWithHeelsView.shoppingCartButton.setImage(
                .basketFill,
                for: .normal
            )
            let choosingSizeVewController = ChoosingTheSizeViewController()
            navigationController?.present(
                choosingSizeVewController,
                animated: true
            )
        } else {
            shoesWithHeelsView.shoppingCartButton.setImage(
                .shoppinCart,
                for: .normal
            )
        }
        if shoesWithHeelsView.shoppingCartButton.tag == 1 {
            print("Tag 1")
            ShoppingCartModel.shared.shoes = shoesWithHeelsView.shoesImageView.image
            ShoppingCartModel.shared.costShoes = shoesWithHeelsView.costLabel.text
        }

    }
}
