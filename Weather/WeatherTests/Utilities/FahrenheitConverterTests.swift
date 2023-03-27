//
//  FahrenheitConverterTests.swift
//  WeatherTests
//
//  Created by hyosung on 2023/03/27.
//

import XCTest

@testable import Weather

final class FahrenheitConverterTests: XCTestCase {
  override func setUpWithError() throws {
    try super.setUpWithError()
  }
  
  override func tearDownWithError() throws {
    try super.tearDownWithError()
    
  }
}

extension FahrenheitConverterTests {
  func testFahrenheitConverter() {
    let celsius: Double = 10
    let fahrenheit: Double = 50
    
    XCTAssertEqual(FahrenheitConverterMock.fahrenheit(to: celsius), fahrenheit)
  }
}
