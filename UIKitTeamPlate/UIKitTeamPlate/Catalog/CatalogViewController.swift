// CatalogViewController.swift
// Copyright © RoadMap. All rights reserved.

// Иван
import UIKit

/// Экран католога
final class CatalogViewController: UIViewController {
    // MARK: - Constants

    enum Constant {
        static let nameForNavigationTitle = "Каталог"
        static let genders = ["Женщинам", "Мужчинам", "Детям"]
        static let nameFontBold = "Verdana-Bold"
    }

    let imagePickerController = UIImagePickerController()

    // MARK: - Visual Components

    private lazy var cameraButton: UIBarButtonItem = {
        let button = UIBarButtonItem(
            barButtonSystemItem: .camera,
            target: self,
            action: #selector(openCamera)
        )
        button.tintColor = .black
        imagePickerController.delegate = self
        return button
    }()

    private let qrCodeButton: UIBarButtonItem = {
        let button = UIBarButtonItem()
        button.image = .qrCode
        button.style = .plain
        button.tintColor = .black
        return button
    }()

    private let flexibleSpace: UIBarButtonItem = {
        let button = UIBarButtonItem(
            barButtonSystemItem: .flexibleSpace,
            target: nil,
            action: nil
        )
        return button
    }()

    private let manCatalogView: CatalogView = {
        let view = CatalogView()
        view.newProductImageView.image = ModelMensCatalog.Constant.imageOfTheNewProduct
        view.saleImageView.image =
            ModelMensCatalog.Constant.imageOfTheSale
        view.brendImageView.image = ModelMensCatalog.Constant.imageForTheBrandsView
        view.shoesImageView.image = ModelMensCatalog.Constant.imageForTheShoesView
        view.bagsImageView.image = ModelMensCatalog.Constant.imageForTheBagsView

        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private let childrenCatalogView: CatalogView = {
        let view = CatalogView()
        view.newProductImageView.image = ModelChildrensCatalog.Constant.imageOfTheNewProduct
        view.saleImageView.image =
            ModelChildrensCatalog.Constant.imageOfTheSale
        view.brendImageView.image = ModelChildrensCatalog.Constant.imageForTheBrandsView
        view.shoesImageView.image = ModelChildrensCatalog.Constant.imageForTheShoesView
        view.bagsImageView.image = ModelChildrensCatalog.Constant.imageForTheBagsView

        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private lazy var segmentController: UISegmentedControl = {
        let segmentController = UISegmentedControl(items: Constant.genders)
        segmentController.translatesAutoresizingMaskIntoConstraints = false
        segmentController.setBolbFont(name: Constant.nameFontBold, size: 12)
        segmentController.addTarget(
            self,
            action: #selector(selectedValue),
            for: .valueChanged
        )
        return segmentController
    }()

    private lazy var womensCatalogView: CatalogView = {
        let view = CatalogView()
        view.newProductImageView.image = ModelWomensCatalog.Constant.imageOfTheNewProduct
        view.saleImageView.image =
            ModelWomensCatalog.Constant.imageOfTheSale
        view.brendImageView.image = ModelWomensCatalog.Constant.imageForTheBrandsView
        view.shoesImageView.image = ModelWomensCatalog.Constant.imageForTheShoesView
        view.bagsImageView.image = ModelWomensCatalog.Constant.imageForTheBagsView
        view.showChoosingShoesButton.addTarget(
            self,
            action: #selector(showChoosingShoesController),
            for: .touchUpInside
        )

        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        configureConstraints()
    }

    // MARK: - Private Methods

    private func configureUI() {
        navigationItem.title = Constant.nameForNavigationTitle
        navigationItem.rightBarButtonItems = [flexibleSpace, qrCodeButton, cameraButton]
        view.backgroundColor = .white
        view.addSubview(segmentController)
        view.addSubview(womensCatalogView)
        view.addSubview(manCatalogView)
        view.addSubview(childrenCatalogView)
    }

    private func configureConstraints() {
        NSLayoutConstraint.activate([
            segmentController.leftAnchor.constraint(
                equalTo: view.leftAnchor,
                constant: 15
            ),
            segmentController.topAnchor.constraint(
                equalTo: view.topAnchor,
                constant: 122
            ),
            segmentController.widthAnchor.constraint(equalToConstant: 345),
            segmentController.heightAnchor.constraint(equalToConstant: 44),

            womensCatalogView.leftAnchor.constraint(
                equalTo: view.leftAnchor
            ),
            womensCatalogView.topAnchor.constraint(
                equalTo: segmentController.bottomAnchor,
                constant: 20
            ),
            womensCatalogView.widthAnchor.constraint(
                equalTo: view.widthAnchor
            ),
            womensCatalogView.heightAnchor.constraint(
                equalToConstant: 350
            ),
            womensCatalogView.centerYAnchor.constraint(equalTo: view.centerYAnchor),

            manCatalogView.leftAnchor.constraint(
                equalTo: view.leftAnchor
            ),
            manCatalogView.topAnchor.constraint(
                equalTo: segmentController.bottomAnchor,
                constant: 20
            ),
            manCatalogView.widthAnchor.constraint(
                equalTo: view.widthAnchor
            ),
            manCatalogView.heightAnchor.constraint(
                equalToConstant: 350
            ),
            manCatalogView.centerYAnchor.constraint(equalTo: view.centerYAnchor),

            childrenCatalogView.leftAnchor.constraint(
                equalTo: view.leftAnchor
            ),
            childrenCatalogView.topAnchor.constraint(
                equalTo: segmentController.bottomAnchor,
                constant: 20
            ),
            childrenCatalogView.widthAnchor.constraint(
                equalTo: view.widthAnchor
            ),
            childrenCatalogView.heightAnchor.constraint(
                equalToConstant: 350
            ),
            childrenCatalogView.centerYAnchor.constraint(equalTo: view.centerYAnchor)

        ])
    }

    @objc private func openCamera() {
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            imagePickerController.sourceType = .camera
            present(imagePickerController, animated: true)
        } else {
            print("Камера недоступна на этом устройстве")
        }
    }

    @objc private func selectedValue() {
        if segmentController.selectedSegmentIndex == 0 {
            womensCatalogView.isHidden = false
            manCatalogView.isHidden = true
            childrenCatalogView.isHidden = true
        } else if segmentController.selectedSegmentIndex == 1 {
            manCatalogView.isHidden = false
            womensCatalogView.isHidden = true
            childrenCatalogView.isHidden = true
        } else {
            childrenCatalogView.isHidden = false
            manCatalogView.isHidden = true
            womensCatalogView.isHidden = true
        }
    }

    @objc private func showChoosingShoesController() {
        let choosingShoesViewController = ChoosingShoesViewController()
        navigationController?.pushViewController(
            choosingShoesViewController,
            animated: true
        )
    }
}

extension CatalogViewController: UIImagePickerControllerDelegate & UINavigationControllerDelegate {
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true)
    }
}
