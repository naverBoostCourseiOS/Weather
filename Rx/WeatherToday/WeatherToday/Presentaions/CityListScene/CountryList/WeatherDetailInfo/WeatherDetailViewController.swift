//
//  WeatherDetailViewController.swift
//  WeatherToday
//
//  Created by 강동영 on 2023/03/07.
//

import UIKit

class WeatherDetailViewController: UIViewController {

    static let identifier: String = String(describing: WeatherDetailViewController.self)
    
    public var weatherInfo: WeatherInfo?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureView(info: weatherInfo)
    }
    
    private func configureView(info: WeatherInfo?) {
        navigationItem.title = info?.cityName
        
        let imageView: UIImageView = .init(frame: .zero)
        imageView.image = info?.image
        imageView.contentMode = .scaleAspectFit
        
        let weatherInfoLabel: UILabel = .init(frame: .zero)
        let temperatureLabel: UILabel = .init(frame: .zero)
        let rainfallProbabilityLabel: UILabel = .init(frame: .zero)
        
        weatherInfoLabel.text = info?.localized
        temperatureLabel.text = info?.temperature
        rainfallProbabilityLabel.text = info?.rainfallProbability
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        weatherInfoLabel.translatesAutoresizingMaskIntoConstraints = false
        temperatureLabel.translatesAutoresizingMaskIntoConstraints = false
        rainfallProbabilityLabel.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(imageView)
        view.addSubview(weatherInfoLabel)
        view.addSubview(temperatureLabel)
        view.addSubview(rainfallProbabilityLabel)
        
        NSLayoutConstraint.activate([
            imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            imageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50),
            
            weatherInfoLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 20),
            weatherInfoLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            temperatureLabel.topAnchor.constraint(equalTo: weatherInfoLabel.bottomAnchor, constant: 10),
            temperatureLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            rainfallProbabilityLabel.topAnchor.constraint(equalTo: temperatureLabel.bottomAnchor, constant: 10),
            rainfallProbabilityLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
        ])
    }
    private func configureView(info: CountryInfoDTO?) {
        
        
    }
}
