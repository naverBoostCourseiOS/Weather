//
//  FlagImageNameChanger.swift
//  Weather
//
//  Created by hyosung on 2023/03/19.
//

import Foundation

protocol FlagImageNameChangable {
  static func name(_ name: String) -> String
}

struct FlagImageNameChanger: FlagImageNameChangable {
  static func name(_ name: String) -> String {
    let prefix: String = "flag_"
    return prefix + name
  }
}
