// UserProfileViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Экран создания профиля
final class UserProfileViewController: UIViewController {
    weak var delegate: BirthdayDelegate?

    // MARK: - Private Constants

    private let profilePhotoImageView: UIImageView = {
        let profilePhotoImageView = UIImageView()
        return profilePhotoImageView.createCustomUIImageView(
            imageName: "userPhoto",
            frame: CGRect(x: 125, y: 66, width: 125, height: 125),
            clipsToBounds: true,
            cornerRadius: 62
        )
    }()

    private let nameLabel: UILabel = {
        let nameLabel = UILabel()
        return nameLabel.createCustomLabel(
            text: "Name Surname",
            fontName: "Verdana-Bold",
            fontsize: 16,
            frame: CGRect(x: 20, y: 239, width: 175, height: 19),
            textAligment: .left
        )
    }()

    private let birthdayLabel: UILabel = {
        let birthdayLabel = UILabel()
        return birthdayLabel.createCustomLabel(
            text: "Birthday",
            fontName: "Verdana-Bold",
            fontsize: 16,
            frame: CGRect(x: 20, y: 314, width: 175, height: 19),
            textAligment: .left
        )
    }()

    private let ageLabel: UILabel = {
        let ageLabel = UILabel()
        return ageLabel.createCustomLabel(
            text: "Age",
            fontName: "Verdana-Bold",
            fontsize: 16,
            frame: CGRect(x: 20, y: 389, width: 175, height: 19),
            textAligment: .left
        )
    }()

    private let genderLabel: UILabel = {
        let genderLabel = UILabel()
        return genderLabel.createCustomLabel(
            text: "Gender",
            fontName: "Verdana-Bold",
            fontsize: 16,
            frame: CGRect(x: 20, y: 462, width: 175, height: 19),
            textAligment: .left
        )
    }()

    private let telegramLabel: UILabel = {
        let telegramLabel = UILabel()
        return telegramLabel.createCustomLabel(
            text: "Telegram",
            fontName: "Verdana-Bold",
            fontsize: 16,
            frame: CGRect(x: 20, y: 537, width: 175, height: 19),
            textAligment: .left
        )
    }()

    private let nameTextField: UITextField = {
        let nameTextField = UITextField()
        return nameTextField.createCustomUITextField(
            frame: CGRect(x: 20, y: 268, width: 250, height: 17),
            placeholder: "Typing Name Surname",
            fontName: "Verdana",
            fontSize: 14
        )
    }()

    private let birthdayTextField: UITextField = {
        let birthdayTextField = UITextField()
        return birthdayTextField.createCustomUITextField(
            frame: CGRect(x: 20, y: 343, width: 250, height: 17),
            placeholder: "Typing Date of Birth",
            fontName: "Verdana",
            fontSize: 14
        )
    }()

    private let ageTextField: UITextField = {
        let ageTextField = UITextField()
        return ageTextField.createCustomUITextField(
            frame: CGRect(x: 20, y: 418, width: 250, height: 17),
            placeholder: "Typing age",
            fontName: "Verdana",
            fontSize: 14
        )
    }()

    private let genderTextField: UITextField = {
        let genderTextField = UITextField()
        return genderTextField.createCustomUITextField(
            frame: CGRect(x: 20, y: 491, width: 250, height: 17),
            placeholder: "Indicate Gender",
            fontName: "Verdana",
            fontSize: 14
        )
    }()

    private var telegramTextField: UITextField = {
        let telegramTextField = UITextField()
        return telegramTextField.createCustomUITextField(
            frame: CGRect(x: 20, y: 566, width: 250, height: 17),
            placeholder: "Typing Telegram",
            fontName: "Verdana",
            fontSize: 14
        )
    }()

    private let lineButtonName: CALayer = {
        let lineButtonName = CALayer()
        return lineButtonName.createCustomCALayer(
            frame: CGRect(x: 20, y: 293, width: 335, height: 1),
            backgroundColor: .systemGray4
        )
    }()

    private let lineButtonBirthday: CALayer = {
        let lineButtonBirthday = CALayer()
        return lineButtonBirthday.createCustomCALayer(
            frame: CGRect(x: 20, y: 368, width: 335, height: 1),
            backgroundColor: .systemGray4
        )
    }()

    private let lineButtonAge: CALayer = {
        let lineButtonAge = CALayer()
        return lineButtonAge.createCustomCALayer(
            frame: CGRect(x: 20, y: 443, width: 335, height: 1),
            backgroundColor: .systemGray4
        )
    }()

    private let lineButtonGender: CALayer = {
        let lineButtonGender = CALayer()
        return lineButtonGender.createCustomCALayer(
            frame: CGRect(x: 20, y: 516, width: 335, height: 1),
            backgroundColor: .systemGray4
        )
    }()

    private let lineButtonTelegram: CALayer = {
        let lineButtonTelegram = CALayer()
        return lineButtonTelegram.createCustomCALayer(
            frame: CGRect(x: 20, y: 591, width: 335, height: 1),
            backgroundColor: .systemGray4
        )
    }()

    private let datePicker: UIDatePicker = {
        let datePicker = UIDatePicker()
        datePicker.datePickerMode = .date
        datePicker.preferredDatePickerStyle = .wheels
        return datePicker
    }()

    private let gender = ["Male", "Female"]

    // MARK: - Private Properties

    private lazy var addNewUserButton: UIButton = {
        let addButton = UIButton()
        addButton.setTitle("Add", for: .normal)
        addButton.setTitleColor(.systemBlue, for: .normal)
        addButton.frame = CGRect(x: 325, y: 15, width: 0, height: 0)
        addButton.sizeToFit()
        addButton.addTarget(
            self,
            action: #selector(addUserProfile),
            for: .touchUpInside
        )
        return addButton
    }()

    private lazy var cancelButton: UIButton = {
        let addButton = UIButton()
        addButton.setTitle("Cancel", for: .normal)
        addButton.setTitleColor(.systemBlue, for: .normal)
        addButton.frame = CGRect(x: 20, y: 15, width: 0, height: 0)
        addButton.sizeToFit()
        addButton.addTarget(
            self,
            action: #selector(logOutOfProfile),
            for: .touchUpInside
        )
        return addButton
    }()

    private lazy var changePhotoButton: UIButton = {
        let changePhotoButton = UIButton()
        changePhotoButton.setTitle("Change photo", for: .normal)
        changePhotoButton.setTitleColor(.systemBlue, for: .normal)
        changePhotoButton.frame = CGRect(x: 125, y: 199, width: 125, height: 20)
        changePhotoButton.addTarget(self, action: #selector(selectImage), for: .touchUpInside)
        return changePhotoButton
    }()

    private lazy var imagePicker: UIImagePickerController = {
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        return imagePicker
    }()

    private lazy var agePicker: UIPickerView = {
        let agePicker = UIPickerView()
        agePicker.tag = 0
        agePicker.delegate = self
        agePicker.dataSource = self
        return agePicker
    }()

    private lazy var genderPicker: UIPickerView = {
        let genderPicker = UIPickerView()
        genderPicker.tag = 1
        genderPicker.delegate = self
        genderPicker.dataSource = self
        return genderPicker
    }()

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        configureDatePicker()
        congigurePickerView()
    }

    // MARK: - Private Methods

    private func configureUI() {
        view.backgroundColor = .white

        view.addSubview(profilePhotoImageView)
        view.addSubview(changePhotoButton)
        view.addSubview(nameLabel)
        view.addSubview(birthdayLabel)
        view.addSubview(nameLabel)
        view.addSubview(birthdayLabel)
        view.addSubview(ageLabel)
        view.addSubview(genderLabel)
        view.addSubview(telegramLabel)
        view.addSubview(nameTextField)
        view.addSubview(birthdayTextField)
        view.addSubview(ageTextField)
        view.addSubview(genderTextField)
        view.addSubview(telegramTextField)
        view.addSubview(addNewUserButton)
        view.addSubview(cancelButton)

        view.layer.addSublayer(lineButtonName)
        view.layer.addSublayer(lineButtonBirthday)
        view.layer.addSublayer(lineButtonAge)
        view.layer.addSublayer(lineButtonGender)
        view.layer.addSublayer(lineButtonTelegram)

        /// убираем пикеры и клавиатуру по нажатию на экран
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(removeKeyboard))
        view.addGestureRecognizer(tapGesture)
        telegramTextField.delegate = self
    }

    /// возращаем дату на birthdayTextField, используя datePicker
    private func configureDatePicker() {
        let toolBar = UIToolbar()
        toolBar.sizeToFit()
        let doneButton = UIBarButtonItem(
            barButtonSystemItem: .done,
            target: self,
            action: #selector(transferringDataToTheTextField)
        )
        let flexspace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        toolBar.setItems([flexspace, doneButton], animated: true)

        birthdayTextField.inputAccessoryView = toolBar
        birthdayTextField.inputView = datePicker
    }

    /// возращаем данные из PickerView в ageTextField, genderTextField
    private func congigurePickerView() {
        let toolBar = UIToolbar()
        toolBar.sizeToFit()

        let doneButton = UIBarButtonItem(title: "ОK", style: .plain, target: self, action: #selector(closePickerView))
        let flexspace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        toolBar.setItems([flexspace, doneButton], animated: true)

        // добавляем toolBar
        ageTextField.inputAccessoryView = toolBar
        genderTextField.inputAccessoryView = toolBar

        ageTextField.inputView = agePicker
        genderTextField.inputView = genderPicker
    }

    /// закрываем PickerView
    @objc func closePickerView() {
        view.endEditing(true)
    }

    /// передаем данных в birthdayTextField и  закрывающий DatePicker
    @objc private func transferringDataToTheTextField() {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd.MM.yy"

        birthdayTextField.text = dateFormatter.string(from: datePicker.date)
        view.endEditing(true)
    }

    @objc private func selectImage() {
        imagePicker.allowsEditing = false
        imagePicker.sourceType = .photoLibrary

        present(imagePicker, animated: true)
    }

    /// убираем клавиатуру
    @objc func removeKeyboard() {
        view.endEditing(true)
    }

    @objc private func logOutOfProfile() {
        dismiss(animated: true)
    }

    /// добавляем новые данные пользлвателя
    @objc private func addUserProfile() {
        print(#function)
        guard let photo = profilePhotoImageView.image,
              let name = nameTextField.text,
              let dateBirth = birthdayTextField.text else { return }

        delegate?.update(
            photo: photo,
            name: name,
            dateOfBirth: dateBirth
        )
        dismiss(animated: true)
    }
}

// MARK: - UIPickerViewDelegate

extension UserProfileViewController: UIPickerViewDelegate {
    /// сохраняем наш выбранный picker в тексфилд
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        switch pickerView.tag {
        case 0:
            ageTextField.text = String(row)
        case 1:
            genderTextField.text = gender[row]
        default:
            break
        }
    }
}

// MARK: - UIPickerViewDataSource

extension UserProfileViewController: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
    }

    /// задаем количесто строк в пикере
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        switch pickerView.tag {
        case 0:
            return 100
        case 1:
            return gender.count
        default:
            return 1
        }
    }

    /// задаем что будет показывать каждый пикер
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        switch pickerView.tag {
        case 0:
            return String(row)
        case 1:
            return gender[row]
        default:
            return ""
        }
    }
}

// MARK: - UITextFieldDelegate

extension UserProfileViewController: UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        let alert = UIAlertController(title: "Please enter Telegram", message: nil, preferredStyle: .alert)

        alert.addTextField { text in
            text.placeholder = "Typing Telegram"
        }

        let performAction = UIAlertAction(title: "Ok", style: .default) { _ in
            guard let text = alert.textFields?.first?.text else { return }
            self.telegramTextField.text = String(text)
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .default)

        alert.addAction(cancelAction)
        alert.addAction(performAction)
        alert.preferredAction = performAction
        present(alert, animated: true)
    }
}

// MARK: - UIImagePickerControllerDelegate & UINavigationControllerDelegate

extension UserProfileViewController: UIImagePickerControllerDelegate & UINavigationControllerDelegate {
    /// устанавливаем выбранное изображение из библиотеки в profilePhotoImageView
    func imagePickerController(
        _ picker: UIImagePickerController,
        didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any]
    ) {
        if let pickedImage = info[.originalImage] as? UIImage {
            profilePhotoImageView.image = pickedImage
        }
        dismiss(animated: true)
    }

    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true)
    }
}
