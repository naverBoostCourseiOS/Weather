//
//  FahrenheitConverterMock.swift
//  WeatherTests
//
//  Created by hyosung on 2023/03/27.
//

@testable import Weather

struct FahrenheitConverterMock: FahrenheitConvertable {
  static func fahrenheit(to celsius: Double) -> Double {
    return (celsius * 1.8) + 32
  }
}
