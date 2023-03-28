//
//  DetailViewController.swift
//  Weather
//
//  Created by Doyeon on 2023/03/07.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var weatherImageView: UIImageView!
    @IBOutlet weak var weatherStateLabel: UILabel!
    @IBOutlet weak var tempertureLabel: UILabel!
    @IBOutlet weak var precipitationProbabilityLabel: UILabel!

    var weatherImageName: String?
    var weatherStateString: String?
    var tempertureString: String?
    var precipitationProbability: String?
    var cityName: String?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = cityName ?? ""
        weatherImageView.image = UIImage(named: weatherImageName ?? "")
        weatherStateLabel.text = weatherStateString
        tempertureLabel.text = tempertureString
        precipitationProbabilityLabel.text = precipitationProbability
    }
}
