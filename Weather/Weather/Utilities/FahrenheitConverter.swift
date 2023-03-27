//
//  FahrenheitConverter.swift
//  Weather
//
//  Created by hyosung on 2023/03/27.
//

protocol FahrenheitConvertable {
  static func fahrenheit(to celsius: Double) -> Double
}

struct FahrenheitConverter: FahrenheitConvertable {
  static func fahrenheit(to celsius: Double) -> Double {
    return (celsius * 1.8) + 32
  }
}
