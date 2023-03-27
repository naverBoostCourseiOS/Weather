//
//  CountryRepository.swift
//  Weather
//
//  Created by hyosung on 2023/03/21.
//

protocol CitiesRepositorable {
  init(
    country: String,
    decoder: Decodable,
    nsDataAssetConvertor: NSDataAssetConvertable
  )
  func fetch() async -> [City]
}

struct CitiesRepository: CitiesRepositorable {
  private let decoder: Decodable
  private let nsDataAssetConvertor: NSDataAssetConvertable
  private let dataAssetName: String
  
  init(
    country: String,
    decoder: Decodable,
    nsDataAssetConvertor: NSDataAssetConvertable
  ) {
    self.dataAssetName = country
    self.decoder = decoder
    self.nsDataAssetConvertor = nsDataAssetConvertor
  }
}

extension CitiesRepository {
  func fetch() async -> [City] {
    guard let data = try? nsDataAssetConvertor.data(dataAssetName) else { return [] }
    guard let cities = try? decoder.decode([City].self, data: data) else { return [] }
    return cities
  }
}
