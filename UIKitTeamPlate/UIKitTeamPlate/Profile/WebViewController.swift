// WebViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit
import WebKit

/// Экран сайта
class WebViewController: UIViewController {
    // MARK: - Visual Components

    private let webView: WKWebView = {
        let webView = WKWebView()
        webView.translatesAutoresizingMaskIntoConstraints = false

        return webView
    }()

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        configureWebView()
        loadRequest()
    }

    // MARK: - Private Methods

    private func configureWebView() {
        view.backgroundColor = .red
        view.addSubview(webView)
        NSLayoutConstraint.activate([
            webView.topAnchor.constraint(equalTo: view.topAnchor),
            webView.leftAnchor.constraint(equalTo: view.leftAnchor),
            webView.rightAnchor.constraint(equalTo: view.rightAnchor),
            webView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
    }

    private func loadRequest() {
        guard let url = URL(string: "https://www.spacex.com/vehicles/starship/") else { return }
        let urlRequest = URLRequest(url: url)
        webView.load(urlRequest)
    }
}
