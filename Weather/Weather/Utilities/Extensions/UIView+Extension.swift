//
//  UIView+Extension.swift
//  Weather
//
//  Created by hyosung on 2023/03/03.
//

import UIKit

extension UIView {
  func addSubviews(_ views: UIView...) {
    views.forEach(self.addSubview(_:))
  }
}

