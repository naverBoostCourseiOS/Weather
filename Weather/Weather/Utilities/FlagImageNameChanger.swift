//
//  FlagImageNameChanger.swift
//  Weather
//
//  Created by hyosung on 2023/03/19.
//

protocol FlagImageNameChangable {
  static func change(_ name: String) -> String
}

struct FlagImageNameChanger: FlagImageNameChangable {
  static func change(_ name: String) -> String {
    let prefix: String = "flag_"
    return prefix + name
  }
}
