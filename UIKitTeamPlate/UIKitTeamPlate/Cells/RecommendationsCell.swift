// RecommendationsCell.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Ячейка рекомнндаций
class RecommendationsCell: UITableViewCell {
    static let identifier = "RecommendationsCell"

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureUI()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func configureUI() {
        backgroundColor = .systemBlue
    }
}
