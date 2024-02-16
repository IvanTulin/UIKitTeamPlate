// ShoppingCartViewController.swift
// Copyright © RoadMap. All rights reserved.

// Наташа
import UIKit

protocol ShoppingCartProtocol: AnyObject {
    func setupImage(image: UIImage)
}

/// Экран корзины покупок
class ShoppingCartViewController: UIViewController {
    // MARK: - Constants

    static let shared = ShoppingCartViewController()
    let choosingShoesViewController = ChoosingShoesViewController()

    lazy var imageView: UIImageView = {
        let image = UIImageView()
        // image.image = images.first
        image.layer.borderWidth = 2
        image.frame = CGRect(x: 100, y: 300, width: 150, height: 150)
        return image
    }()

    // MARK: - Visual Components

    lazy var selectedShoesView: ChoosingShoesView = {
        let view = ChoosingShoesView()
        view.backgroundColor = .appLightGray
        // view.shoesImageView.image = images.first
        view.shoesImageView.backgroundColor = .systemBlue
        view.shoppingCartButton.addTarget(self, action: #selector(pressButton), for: .touchUpInside)
        view.layer.cornerRadius = 15
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    // MARK: - Properties

    var images: [UIImage] = []

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        configureConstraints()

        choosingShoesViewController.delegate = self
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        configureUI()
        configureConstraints()
        imageView.image = images.first
    }

    // MARK: - Private Methods

    private func configureUI() {
        navigationItem.title = "Корзина"
        view.backgroundColor = .white
        view.addSubview(selectedShoesView)
        view.addSubview(imageView)
        selectedShoesView.shoesImageView.image = images.first
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
            selectedShoesView.heightAnchor.constraint(equalToConstant: 157)
        ])
    }

    @objc private func pressButton() {
        selectedShoesView.shoesImageView.image = images.first
        print("pressButton")
    }
}

extension ShoppingCartViewController: ShoppingCartProtocol {
    func setupImage(image: UIImage) {
        selectedShoesView.shoesImageView.image = image
    }
}
