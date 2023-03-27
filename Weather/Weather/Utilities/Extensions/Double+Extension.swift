//
//  Double+Extension.swift
//  Weather
//
//  Created by hyosung on 2023/03/27.
//

extension Double {
  func toString(_ format: String = "%.1f") -> String {
    return String(format: format, self)
  }
}
