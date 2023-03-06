//
//  CustomTableViewCell.swift
//  Weather
//
//  Created by Doyeon on 2023/03/05.
//

import UIKit

class CustomTableViewCell: UITableViewCell {
    
    @IBOutlet var weatherImageView: UIImageView!
    @IBOutlet weak var cityNameLabel: UILabel!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var rainfallProbabilityLabel: UILabel!
    
}
