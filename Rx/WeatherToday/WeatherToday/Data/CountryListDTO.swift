//
//  CountryListDTO.swift
//  WeatherToday
//
//  Created by 강동영 on 2023/02/27.
//

import Foundation

struct ContriesDTO: Decodable {
    let korean_name: String
    let asset_name: String
}


struct CountryInfoDTO: Decodable {
    let city_name: String
    let state: Int
    let celsius: Float
    let rainfall_probability: Int
}
