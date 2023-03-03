//
//  DecoderTests.swift
//  WeatherTests
//
//  Created by hyosung on 2023/03/03.
//

import XCTest

@testable import Weather

final class DecoderTests: XCTestCase {

  override func setUpWithError() throws {
    try super.setUpWithError()
  }
  
  override func tearDownWithError() throws {
    try super.tearDownWithError()
  }
}

extension DecoderTests {
  func testDecoder() {
      let decoder = Decoder()
      let person: Person? = decoder.decode(Person.self, data: JSON)
      XCTAssertEqual(person?.name, "John")
      XCTAssertEqual(person?.age, 30)
  }
}
