//
//  UIFont+Extension.swift
//  Weather
//
//  Created by Doyeon on 2023/02/20.
//

import UIKit

extension UIFont {
    class func Pretendard(type: PretendardType, size: CGFloat) -> UIFont! {
        guard let font = UIFont(name: type.name, size: size) else {
            return nil
        }
        return font
    }
    
    public enum PretendardType {
        case Bold
        case Light
        case Medium
        case Regular
        case SemiBold
        
        var name: String {
            switch self {
            case .Bold:
                return "Pretendard-Bold"
            case .Light:
                return "Pretendard-Light"
            case .Medium:
                return "Pretendard-Medium"
            case .Regular:
                return "Pretendard-Regular"
            case .SemiBold:
                return "Pretendard-SemiBold"
            }
        }
    }
}
