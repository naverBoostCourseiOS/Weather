//
//  NSDataAssetConvertor.swift
//  Weather
//
//  Created by hyosung on 2023/03/16.
//

import UIKit

protocol NSDataAssetConvertable {
  func data(_ name: String) throws -> Data
}

struct NSDataAssetConvertor: NSDataAssetConvertable {
  enum NSDataConvertorError: Error {
    case unknownDataAsset
  }
  
  func data(_ name: String) throws -> Data {
    guard let dataAsset = NSDataAsset(name: name) else { throw NSDataConvertorError.unknownDataAsset }
    return dataAsset.data
  }
}
