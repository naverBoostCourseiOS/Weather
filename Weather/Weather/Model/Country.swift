//
//  Country.swift
//  Weather
//
//  Created by hyosung on 2023/03/16.
//

struct Country: Codable {
  let koreanName: String
  let assetName: String
  
  enum CodingKeys: String, CodingKey {
    case koreanName = "korean_name"
    case assetName = "asset_name"
  }
}
