//
//  Ex_String.swift
//  WeatherToday
//
//  Created by dongyeongkang on 2023/04/03.
//

import Foundation

extension String {
    
    var localized: String {
        return NSLocalizedString(self, tableName: nil, bundle: Bundle.main, value: "", comment: "")
    }
}
