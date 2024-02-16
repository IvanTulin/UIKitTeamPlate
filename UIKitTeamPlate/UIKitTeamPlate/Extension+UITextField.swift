// Extension+UITextField.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

extension UITextField {
    func addDoneCancelToolbar(
        onDone: (target: Any, action: Selector)? = nil,
        onCancel: (target: Any, action: Selector)? = nil
    ) {
        let onCancel = onCancel ?? (target: self, action: #selector(cancelButtonTapped))
        let onDone = onDone ?? (target: self, action: #selector(doneButtonTapped))

        let toolbar = UIToolbar()
        toolbar.barStyle = .default
        toolbar.items = [
            UIBarButtonItem(title: "Cancel", style: .plain, target: onCancel.target, action: onCancel.action),
            UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: self, action: nil),
            UIBarButtonItem(title: "Done", style: .done, target: onDone.target, action: onDone.action)
        ]
        toolbar.sizeToFit()

        inputAccessoryView = toolbar
    }

    @objc func doneButtonTapped() { resignFirstResponder() }

    @objc func cancelButtonTapped() {
        text = ""
        resignFirstResponder()
    }
}
