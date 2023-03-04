//
//  JSONDecoder.swift
//  Weather
//
//  Created by hyosung on 2023/03/03.
//

import Foundation.NSJSONSerialization

protocol Decodable {
  func decode<T: Codable>(_ decodable: T.Type, data from: Data?) -> T?
}

struct Decoder: Decodable {
  func decode<T: Codable>(_ decodable: T.Type, data from: Data?) -> T? {
    do {
      let decoder = try JSONDecoder().decode(decodable.self, from: from!)
      return decoder
    } catch {
      return nil
    }
  }
}
