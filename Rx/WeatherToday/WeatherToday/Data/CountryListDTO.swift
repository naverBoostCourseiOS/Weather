//
//  CountryListDTO.swift
//  WeatherToday
//
//  Created by 강동영 on 2023/02/27.
//

import UIKit

struct CountriesDTO: Decodable {
    let koreanName: String
    let assetName: String
    
    enum CodingKeys: String, CodingKey {
        case koreanName = "korean_name"
        case assetName = "asset_name"
    }
}


struct CountryInfoDTO: Decodable {
    let cityName: String
    let state: WeatherStateCode
    let celsius: Float
    let rainfallProbability: Int
    
    enum CodingKeys: String, CodingKey {
        case cityName = "city_name"
        case state
        case celsius
        case rainfallProbability = "rainfall_probability"
    }
}

struct WeatherInfo {
    let cityName: String
    let image: UIImage?
    let localized: String
    let temperature: String
    let rainfallProbability: String
}
