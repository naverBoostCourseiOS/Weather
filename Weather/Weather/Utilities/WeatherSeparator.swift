//
//  WeatherSeparator.swift
//  Weather
//
//  Created by hyosung on 2023/03/27.
//

protocol WeatherSeparatorable {
 static func weather(celsius: Double, rainfallProbability: Int) -> Weather
}

struct WeatherSeparator: WeatherSeparatorable {
  static func weather(celsius: Double, rainfallProbability: Int) -> Weather {
    switch (rainfallProbability, celsius) {
    case (0, _):
      return .sunny
    case (1...30, _):
      return .cloudy
    case (_, ..<0):
      return .snowy
    case (_, _):
      return .rainy
    }
  }
}
