// UserDataViewController.swift
// Copyright © RoadMap. All rights reserved.

// Наташа
import UIKit

/// Экран с данными пользлвателя
final class UserDataViewController: UIViewController {
    // MARK: - Constants

    enum Constants {
        static let namePlaceholder = "Имя"
        static let lastNamePlaceholder = "Фамилия"
        static let phonePlaceholder = "Номер телефона"
        static let shoeSizePlaceholder = "Размер ноги"
        static let birthdayDatePlaceholder = "Дата рождения"
        static let emailPlaceholder = "Почта"
        static let maxNumberCount = 11
    }

    // MARK: - Visual Components

    private lazy var nameTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = Constants.namePlaceholder
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = .backgroundGray
        textField.layer.cornerRadius = 12
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 10))
        textField.leftViewMode = .always
        textField.tag = 1
        textField.returnKeyType = .done
        view.addSubview(textField)
        return textField
    }()

    private lazy var lastNameTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = Constants.lastNamePlaceholder
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = .backgroundGray
        textField.layer.cornerRadius = 12
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 10))
        textField.leftViewMode = .always
        textField.tag = 2
        view.addSubview(textField)
        textField.returnKeyType = .done
        return textField
    }()

    private lazy var phoneTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = Constants.phonePlaceholder
        textField.keyboardType = .numberPad
        textField.leftViewMode = .always
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = .backgroundGray
        textField.layer.cornerRadius = 12
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 10))
        textField.leftViewMode = .always
        textField.tag = 3
        textField.addDoneCancelToolbar()
        view.addSubview(textField)
        return textField
    }()

    private lazy var shoeSizeTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = Constants.shoeSizePlaceholder
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = .backgroundGray
        textField.layer.cornerRadius = 12
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 10))
        textField.leftViewMode = .always
        textField.tag = 4
        view.addSubview(textField)
        return textField
    }()

    private lazy var birthdayTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = Constants.birthdayDatePlaceholder
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = .backgroundGray
        textField.layer.cornerRadius = 12
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 10))
        textField.leftViewMode = .always
        textField.tag = 5
        textField.inputView = datePicker
        view.addSubview(textField)
        return textField
    }()

    private lazy var datePicker: UIDatePicker = {
        let datePicker = UIDatePicker()
        datePicker.center = view.center
        datePicker.frame = CGRect(x: 0, y: 150, width: 200, height: 200)
        datePicker.preferredDatePickerStyle = .inline
        datePicker.datePickerMode = .date
        datePicker.backgroundColor = .white
        datePicker.maximumDate = Date()
        datePicker.addTarget(self, action: #selector(chooseBirthdayDate), for: .valueChanged)
        return datePicker
    }()

    private lazy var emailTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = Constants.emailPlaceholder
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = .backgroundGray
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 10))
        textField.leftViewMode = .always
        textField.layer.cornerRadius = 12
        textField.keyboardType = .emailAddress
        textField.tag = 6
        textField.returnKeyType = .done
        view.addSubview(textField)
        return textField
    }()

    private lazy var saveDataButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .customMagenta
        button.layer.cornerRadius = 16
        button.layer.shadowOffset = CGSize(width: 0, height: 4)
        button.layer.shadowColor = UIColor.lightGray.cgColor
        button.layer.shadowRadius = 2
        button.layer.shadowOpacity = 5
        button.setTitle("Сохранить", for: .normal)
        button.titleLabel?.font = UIFont(name: "Verdana-Bold", size: 18)
        button.setTitleColor(.white, for: .normal)
        button.setTitleColor(.lightGray, for: .highlighted)
        button.isHidden = false
        button.addTarget(self, action: #selector(saveUserData), for: .touchUpInside)
        view.addSubview(button)
        return button
    }()

    // MARK: - Private Properties

    private lazy var user = User()

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }

    // MARK: - Private Methods

    private func configureUI() {
        navigationController?.navigationBar.topItem?.title = ""
        navigationController?.navigationBar.tintColor = .black

        view.backgroundColor = .white
        view.addSubview(nameTextField)
        view.addSubview(lastNameTextField)
        view.addSubview(phoneTextField)
        view.addSubview(shoeSizeTextField)
        view.addSubview(birthdayTextField)
        view.addSubview(emailTextField)
        setupConstrains()
        navigationItem.title = "Мои данные"

        nameTextField.delegate = self
        lastNameTextField.delegate = self
        phoneTextField.delegate = self
        shoeSizeTextField.delegate = self
        birthdayTextField.delegate = self
        emailTextField.delegate = self
    }

    private func setupConstrains() {
        nameTextField.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 113).isActive = true
        nameTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        nameTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        nameTextField.heightAnchor.constraint(equalToConstant: 44).isActive = true

        lastNameTextField.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 167)
            .isActive = true
        lastNameTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        lastNameTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        lastNameTextField.heightAnchor.constraint(equalToConstant: 44).isActive = true

        phoneTextField.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 221).isActive = true
        phoneTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        phoneTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        phoneTextField.heightAnchor.constraint(equalToConstant: 44).isActive = true

        shoeSizeTextField.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 275)
            .isActive = true
        shoeSizeTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        shoeSizeTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        shoeSizeTextField.heightAnchor.constraint(equalToConstant: 44).isActive = true

        birthdayTextField.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 329)
            .isActive = true
        birthdayTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        birthdayTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        birthdayTextField.heightAnchor.constraint(equalToConstant: 44).isActive = true

        emailTextField.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 383).isActive = true
        emailTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        emailTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        emailTextField.heightAnchor.constraint(equalToConstant: 44).isActive = true

        saveDataButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -50)
            .isActive = true
        saveDataButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30).isActive = true
        saveDataButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30).isActive = true
        saveDataButton.heightAnchor.constraint(equalToConstant: 44).isActive = true
    }

    private func format(phoneNumber: String, shoulRemoveLastDigit: Bool) -> String {
        var number = ""
        do {
            let regex = try NSRegularExpression(pattern: "[\\+\\s-\\(\\)]", options: .caseInsensitive)
            guard !(shoulRemoveLastDigit && phoneNumber.count <= 2) else { return "+" }
            let range = NSString(string: phoneNumber).range(of: phoneNumber)
            number = regex.stringByReplacingMatches(in: phoneNumber, options: [], range: range, withTemplate: "")
            if number.count > Constants.maxNumberCount {
                let maxIndex = number.index(number.startIndex, offsetBy: Constants.maxNumberCount)
                number = String(number[number.startIndex ..< maxIndex])
            }
            if shoulRemoveLastDigit {
                let maxIndex = number.index(number.startIndex, offsetBy: number.count - 1)
                number = String(number[number.startIndex ..< maxIndex])
            }
            let maxIndex = number.index(number.startIndex, offsetBy: number.count)
            let regRange = number.startIndex ..< maxIndex

            if number.count < 7 {
                let pattern = "(\\d)(\\d{3})(\\d+)"
                number = number.replacingOccurrences(
                    of: pattern,
                    with: "$1 ($2) $3",
                    options: .regularExpression,
                    range: regRange
                )
            } else {
                let pattern = "(\\d)(\\d{3})(\\d{3})(\\d{2})(\\d+)"
                number = number.replacingOccurrences(
                    of: pattern,
                    with: "$1 ($2) $3-$4-$5",
                    options: .regularExpression,
                    range: regRange
                )
            }
        } catch {
            print("phone format error")
        }
        return "+\(number)"
    }

    @objc private func chooseBirthdayDate() {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd.MM.yyyy"
        birthdayTextField.text = formatter.string(from: datePicker.date)
        view.endEditing(true)
        emailTextField.becomeFirstResponder()
    }

    @objc private func saveUserData() {
        let user = User(
            name: nameTextField.text ?? "",
            lastName: lastNameTextField.text ?? "",
            shoeSize: shoeSizeTextField.text ?? "",
            phoneNumber: phoneTextField.text ?? "no number",
            birthdayDate: birthdayTextField.text ?? "no date",
            email: emailTextField.text ?? ""
        )
        print("save data button tapped \(user.phoneNumber)")
        saveDataButton.isHidden = true
    }
}

extension UserDataViewController: UITextFieldDelegate {
    func textField(
        _ textField: UITextField,
        shouldChangeCharactersIn range: NSRange,
        replacementString string: String
    ) -> Bool {
        let fullString = (textField.text ?? "") + string
        switch textField {
        case phoneTextField:
            textField.text = format(phoneNumber: fullString, shoulRemoveLastDigit: range.length == 1)
            return false
        default:
            return true
        }
    }

    func textFieldDidBeginEditing(_ textField: UITextField) {
        saveDataButton.isHidden = false
    }

    func textFieldDidEndEditing(_ textField: UITextField) {}

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        switch textField.tag {
        case 1:
            lastNameTextField.becomeFirstResponder()
        case 2:
            phoneTextField.becomeFirstResponder()
        case 3:
            shoeSizeTextField.becomeFirstResponder()
        case 4:
            birthdayTextField.becomeFirstResponder()
        case 5:
            emailTextField.becomeFirstResponder()
        case 6:
            textField.resignFirstResponder()
        default:
            textField.resignFirstResponder()
        }
        return true
    }
}
