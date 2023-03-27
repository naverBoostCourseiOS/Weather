//
//  City.swift
//  Weather
//
//  Created by hyosung on 2023/03/21.
//

struct City: Codable {
  let cityName: String
  let state: Int
  let celsius: Double
  let rainfallProbability: Int
  
  enum CodingKeys: String, CodingKey {
    case cityName = "city_name"
    case state
    case celsius
    case rainfallProbability = "rainfall_probability"
  }
}
