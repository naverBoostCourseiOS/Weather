//
//  JSONDecoder.swift
//  Weather
//
//  Created by hyosung on 2023/03/03.
//

import Foundation.NSJSONSerialization

protocol Decodable {
  func decode<T: Codable>(_ decodable: T.Type, data from: Data?) throws -> T
}

struct Decoder: Decodable {
  enum DecoderError: Error {
    case dataIsNil
    case catchError(Error)
  }
  
  func decode<T: Codable>(_ decodable: T.Type, data from: Data?) throws -> T {
    guard let data = from else { throw DecoderError.dataIsNil }
    do {
      let decoder = try JSONDecoder().decode(decodable.self, from: data)
      return decoder
    } catch {
      throw DecoderError.catchError(error)
    }
  }
}
