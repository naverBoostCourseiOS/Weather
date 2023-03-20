//
//  FlagImageNameChangerMock.swift
//  WeatherTests
//
//  Created by hyosung on 2023/03/19.
//

@testable import Weather

struct FlagImageNameChangerMock: FlagImageNameChangable {
  static var nameReturnValue: String?
  
  static func change(_ name: String) -> String {
    guard let returnValue = nameReturnValue else { return "" }
    return returnValue
  }
}
