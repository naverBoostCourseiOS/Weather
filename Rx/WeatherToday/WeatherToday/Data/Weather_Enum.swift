//
//  Weather_Enum.swift
//  WeatherToday
//
//  Created by 강동영 on 2023/03/07.
//

import Foundation

enum WeatherStateCode: Int, Decodable {
    case sunny = 10
    case cloudy
    case rainy
    case snowy
}

enum WeatherState: Int {
    case sunny = 10
    case cloudy
    case rainy
    case snowy
    
    var imageName: String {
        switch self {
            
        case .sunny: return "sunny"
        case .cloudy: return "cloudy"
        case .rainy: return "rainy"
        case .snowy: return "snowy"
        }
    }
    
    var title: String {
        switch self {
            
        case .sunny: return "sunny"
        case .cloudy: return "cloudy"
        case .rainy: return "rainy"
        case .snowy: return "snowy"
        }
    }
}
