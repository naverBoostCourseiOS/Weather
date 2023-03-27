//
//  UIStackView+Extension.swift
//  Weather
//
//  Created by hyosung on 2023/03/27.
//

import UIKit

extension UIStackView {
  func addArrangedSubviews(_ views: UIView...) {
    views.forEach(self.addArrangedSubview(_:))
  }
}
