//
//  FlagImageNameChangerTest.swift
//  WeatherTests
//
//  Created by hyosung on 2023/03/19.
//

import XCTest

@testable import Weather

final class FlagImageNameChangerTests: XCTestCase {
    override func setUpWithError() throws {
        try super.setUpWithError()
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
    }
}

extension FlagImageNameChangerTests {
  func textFlagImageChanger() {
    FlagImageNameChangerMock.nameReturnValue = "flag_kr"
    let name = "kr"
    let actualName = FlagImageNameChangerMock.name(name)
    XCTAssertEqual(actualName, FlagImageNameChangerMock.nameReturnValue)
  }
}
