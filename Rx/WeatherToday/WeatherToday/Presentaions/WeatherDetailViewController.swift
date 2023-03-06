//
//  WeatherDetailViewController.swift
//  WeatherToday
//
//  Created by 강동영 on 2023/03/07.
//

import UIKit

class WeatherDetailViewController: UIViewController {

    static let identifier: String = String(describing: WeatherDetailViewController.self)
    
    public var countryInfo: CountryInfoDTO?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(#function)
        
        navigationItem.title = countryInfo?.city_name
    }
}
