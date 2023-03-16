//
//  CountriesRepository.swift
//  Weather
//
//  Created by hyosung on 2023/03/16.
//

protocol CountriesRepositorable {
  init(
    decoder: Decodable,
    nsDataAssetConvertor: NSDataAssetConvertable
  ) 
  func fetch() async -> [Country]
}

struct CountriesRepository: CountriesRepositorable {
  private let decoder: Decodable
  private let nsDataAssetConvertor: NSDataAssetConvertable
  private let dataAssetName: String = "countries"
  
  init(
    decoder: Decodable,
    nsDataAssetConvertor: NSDataAssetConvertable
  ) {
    self.decoder = decoder
    self.nsDataAssetConvertor = nsDataAssetConvertor
  }
}

extension CountriesRepository {  
  func fetch() async -> [Country] {
    guard let data = try? nsDataAssetConvertor.data(dataAssetName) else { return [] }
    guard let countries = try? decoder.decode([Country].self, data: data) else { return [] }
    return countries
  }
}
