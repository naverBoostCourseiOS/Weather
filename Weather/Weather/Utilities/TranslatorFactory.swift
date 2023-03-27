//
//  TranslatorFactory.swift
//  Weather
//
//  Created by hyosung on 2023/03/27.
//

protocol TranslatorFactory {
  func translate(_ weather: Weather) -> String
}

struct KoreanTranslatorFactory: TranslatorFactory {
  func translate(_ weather: Weather) -> String {
    switch weather {
    case .sunny: return "맑음"
    case .snowy: return "눈"
    case .rainy: return "비"
    case .cloudy: return "구름"
    }
  }
}
