// WebViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit
import WebKit

/// Экран сайта
final class WebViewController: UIViewController {
    // MARK: - Visual Components

    private let webView: WKWebView = {
        let webView = WKWebView()
        webView.translatesAutoresizingMaskIntoConstraints = false

        return webView
    }()

    private let backButtonItem: UIBarButtonItem = {
        let button = UIBarButtonItem(systemItem: .rewind)
        button.action = #selector(backAction)
        return button
    }()

    private let forwardButtonItem: UIBarButtonItem = {
        let button = UIBarButtonItem(systemItem: .fastForward)
        button.action = #selector(forwardAction)
        return button
    }()

    private let spacerButtonItem: UIBarButtonItem = {
        let button = UIBarButtonItem(systemItem: .flexibleSpace)
        return button
    }()

    private let refreshButtonItem: UIBarButtonItem = {
        let button = UIBarButtonItem(systemItem: .refresh)
        button.action = #selector(refreshAction)
        return button
    }()

    private lazy var toolBar: UIToolbar = {
        let toolBar = UIToolbar()
        toolBar.items = [
            backButtonItem, forwardButtonItem,
            spacerButtonItem, refreshButtonItem
        ]
        toolBar.translatesAutoresizingMaskIntoConstraints = false

        return toolBar
    }()

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        loadRequest()
    }

    // MARK: - Private Methods

    private func configureUI() {
        view.backgroundColor = .red
        view.addSubview(webView)
        view.addSubview(toolBar)
        NSLayoutConstraint.activate([
            webView.topAnchor.constraint(equalTo: view.topAnchor),
            webView.leftAnchor.constraint(equalTo: view.leftAnchor),
            webView.rightAnchor.constraint(equalTo: view.rightAnchor),
            webView.bottomAnchor.constraint(equalTo: view.bottomAnchor),

            // toolBar.topAnchor.constraint(equalTo: webView.bottomAnchor),
            toolBar.leftAnchor.constraint(equalTo: view.leftAnchor),
            toolBar.rightAnchor.constraint(equalTo: view.rightAnchor),
            toolBar.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            toolBar.widthAnchor.constraint(equalToConstant: 100)
        ])
    }

    private func loadRequest() {
        guard let url = URL(string: "https://www.spacex.com/vehicles/starship/") else { return }
        let urlRequest = URLRequest(url: url)
        webView.load(urlRequest)
    }

    @objc private func backAction() {
        guard webView.canGoBack else { return }
        webView.goBack()
    }

    @objc private func forwardAction() {
        guard webView.canGoForward else { return }
        webView.goForward()
    }

    @objc private func refreshAction() {
        webView.reload()
    }
}
