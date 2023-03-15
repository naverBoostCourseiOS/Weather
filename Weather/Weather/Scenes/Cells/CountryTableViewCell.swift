//
//  CountryTableViewCell.swift
//  Weather
//
//  Created by hyosung on 2023/03/03.
//

import UIKit

final class CountryTableViewCell: UITableViewCell {
  static let ID = "CountryTableViewCell"
  
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}

extension CountryTableViewCell {
  func configure(image: UIImage, title: String) {
    var contents = self.defaultContentConfiguration()
    contents.image = image
    contents.text = title
    self.contentConfiguration = contents
  }
}
