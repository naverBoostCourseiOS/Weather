//
//  HeaderView.swift
//  Weather
//
//  Created by hyosung on 2023/03/16.
//

import UIKit

final class HeaderView: UIView {
  
  private let titleLabel: UILabel = {
    let label = UILabel()
    label.font = UIFont.systemFont(ofSize: 20)
    label.textAlignment = .center
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()
  
  init(
    text: String,
    textColor: UIColor,
    backgroundColor: UIColor
  ) {
    super.init(frame: .zero)
    self.titleLabel.text = text
    self.titleLabel.textColor = textColor
    self.backgroundColor = backgroundColor
    configureUI()
    setupConstraints()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}

extension HeaderView {
  private func configureUI() {
    addSubviews(
      titleLabel
    )
  }
  
  private func setupConstraints() {
    [
      titleLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
      titleLabel.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
      titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
      titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
      titleLabel.heightAnchor.constraint(equalToConstant: 44),
    ]
      .forEach { $0.isActive = true }
  }
}
