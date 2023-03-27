//
//  WeatherTranslator.swift
//  Weather
//
//  Created by hyosung on 2023/03/27.
//

protocol WeatherTranslatable {
  func translate(_ weather: Weather) -> String
}

struct WeatherTranslator: WeatherTranslatable {
  private let translatorFactory: TranslatorFactory
  
  init(_ translatorFactory: TranslatorFactory) {
    self.translatorFactory = translatorFactory
  }
}

extension WeatherTranslator {
  func translate(_ weather: Weather) -> String {
    return translatorFactory.translate(weather)
  }
}

