//
//  CityViewController.swift
//  Weather
//
//  Created by hyosung on 2023/03/27.
//

import UIKit

final class CityViewController: UIViewController {
  // MARK: - Properties
  struct Dependency {
    let koreanTranslator: WeatherTranslatable
  }
  
  private let city: City
  private let dependency: Dependency
  
  // MARK: - UI Properties
  private lazy var headerView: HeaderView = {
    let headerView = HeaderView(
      text: city.cityName,
      textColor: .white,
      backgroundColor: .blue
    )
    headerView.translatesAutoresizingMaskIntoConstraints = false
    return headerView
  }()
  private let weatherImageView: UIImageView = {
    let imageView = UIImageView()
    imageView.translatesAutoresizingMaskIntoConstraints = false
    return imageView
  }()
  private let contentsStackView: UIStackView = {
    let stackView = UIStackView()
    stackView.axis = .vertical
    stackView.distribution = .equalSpacing
    stackView.alignment = .center
    stackView.spacing = 10
    stackView.translatesAutoresizingMaskIntoConstraints = false
    return stackView
  }()
  private let weatherLabel: UILabel = {
    let label = UILabel()
    label.font = .boldSystemFont(ofSize: 20)
    label.textColor = .black
    return label
  }()
  private let temperatureLabel: UILabel = {
    let label = UILabel()
    label.font = .systemFont(ofSize: 16)
    label.textColor = .black
    return label
  }()
  private let rainfallProbabilityLabel: UILabel = {
    let label = UILabel()
    label.font = .systemFont(ofSize: 14)
    label.textColor = .orange
    return label
  }()
  
  init(
    dependency: Dependency,
    city: City
  ) {
    self.dependency = dependency
    self.city = city
    super.init(
      nibName: nil,
      bundle: nil
    )
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    configureUI()
    setupConstraints()
    configure(city)
  }
}

// MARK: - Configure UI
extension CityViewController {
  private func configureUI() {
    view.addSubviews(
      headerView,
      weatherImageView,
      contentsStackView
    )
    
    contentsStackView.addArrangedSubviews(
      weatherLabel,
      temperatureLabel,
      rainfallProbabilityLabel
    )
  }
}

// MARK: - Setup Constraints
extension CityViewController {
  private func setupConstraints() {
    [
      headerView.topAnchor.constraint(equalTo: view.topAnchor),
      headerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
      headerView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
    ]
      .forEach { $0.isActive = true }
    
    [
      weatherImageView.topAnchor.constraint(equalTo: headerView.bottomAnchor, constant: 20),
      weatherImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor)
    ]
      .forEach { $0.isActive = true }
    
    [
      contentsStackView.topAnchor.constraint(equalTo: weatherImageView.bottomAnchor, constant: 20),
      contentsStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
      contentsStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
    ]
      .forEach { $0.isActive = true }
  }
}

// MARK: - Configure
extension CityViewController {
  private func configure(_ city: City) {
    setupWeatherImageView(city)
    setupWeatherLabel(city)
    setupTemperatureLabel(city)
    rainfallProbabilityLabel.text = "강수확률 \(city.rainfallProbability)%"
  }
}

// MARK: - Private Function
extension CityViewController {
  private func setupWeatherImageView(_ city: City) {
    let weather = WeatherSeparator.weather(
      celsius: city.celsius,
      rainfallProbability: city.rainfallProbability
    )
    weatherImageView.image = UIImage(named: weather.rawValue)
  }
  
  private func setupWeatherLabel(_ city: City) {
    let weather = WeatherSeparator.weather(
      celsius: city.celsius,
      rainfallProbability: city.rainfallProbability
    )
    let koreanWeather = dependency.koreanTranslator.translate(weather)
    weatherLabel.text = koreanWeather
  }
  
  private func setupTemperatureLabel(_ city: City) {
    let celsius = city.celsius.toString()
    let fahrenheit = FahrenheitConverter.fahrenheit(to: city.celsius).toString()
    temperatureLabel.text = "섭씨 \(celsius)도 / 화씨 \(fahrenheit)"
  }
}
