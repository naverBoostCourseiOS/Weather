//
//  Country.swift
//  Weather
//
//  Created by Doyeon on 2023/03/09.
//

import Foundation

enum Country: String {
    case kr = "한국"
    case de = "독일"
    case it = "이탈리아"
    case us = "미국"
    case fr = "프랑스"
    case jp = "일본"
    
    var flagImageName: String {
        switch self {
        case .kr:
            return "flag_kr"
        case .de:
            return "flag_de"
        case .it:
            return "flag_it"
        case .us:
            return "flag_us"
        case .fr:
            return "flag_fr"
        case .jp:
            return "flag_jp"
        }
    }
    
    var code: String {
        switch self {
        case .kr:
            return "kr"
        case .de:
            return "de"
        case .it:
            return "it"
        case .us:
            return "us"
        case .fr:
            return "fr"
        case .jp:
            return "jp"
        }
    }
}
