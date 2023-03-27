//
//  CityTableViewCell.swift
//  Weather
//
//  Created by hyosung on 2023/03/27.
//

import UIKit

final class CityTableViewCell: UITableViewCell {
  static let ID = "CityTableViewCell"
  
  private let weatherImageView: UIImageView = {
    let imageView = UIImageView()
    imageView.translatesAutoresizingMaskIntoConstraints = false
    return imageView
  }()
  private let contentsStackView: UIStackView = {
    let stackView = UIStackView()
    stackView.axis = .vertical
    stackView.distribution = .equalSpacing
    stackView.alignment = .leading
    stackView.spacing = 10
    stackView.translatesAutoresizingMaskIntoConstraints = false
    return stackView
  }()
  private let cityNameLabel: UILabel = {
    let label = UILabel()
    label.font = .boldSystemFont(ofSize: 20)
    label.textColor = .black
    return label
  }()
  private let temperatureLabel: UILabel = {
    let label = UILabel()
    label.font = .systemFont(ofSize: 16)
    label.textColor = .blue
    return label
  }()
  private let rainfallProbabilityLabel: UILabel = {
    let label = UILabel()
    label.font = .systemFont(ofSize: 14)
    label.textColor = .black
    return label
  }()
  
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    configureUI()
    setupConstraints()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}

// MARK: - Configure UI
extension CityTableViewCell {
  private func configureUI() {
    contentView.addSubviews(
      weatherImageView,
      contentsStackView
    )
    
    contentsStackView.addArrangedSubviews(
      cityNameLabel,
      temperatureLabel,
      rainfallProbabilityLabel
    )
  }
}

// MARK: - Setup Constraints
extension CityTableViewCell {
  private func setupConstraints() {
    [
      weatherImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
      weatherImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20),
      weatherImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
      weatherImageView.widthAnchor.constraint(equalTo: weatherImageView.heightAnchor, multiplier: 1)
    ]
      .forEach { $0.isActive = true }
    
    [
      contentsStackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
      contentsStackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20),
      contentsStackView.leadingAnchor.constraint(equalTo: weatherImageView.trailingAnchor, constant: 10),
      contentsStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10)
    ]
      .forEach { $0.isActive = true }
  }
}

// MARK: - Configure
extension CityTableViewCell {
  func configure(_ city: City) {
    setupWeatherImageView(city)
    setupTemperatureLabel(city)
    cityNameLabel.text = city.cityName
    rainfallProbabilityLabel.text = "강수확률 \(city.rainfallProbability)%"
  }
}

extension CityTableViewCell {
  private func setupWeatherImageView(_ city: City) {
    let weather = WeatherSeparator.weather(
      celsius: city.celsius,
      rainfallProbability: city.rainfallProbability
    )
    weatherImageView.image = UIImage(named: weather.rawValue)
  }
  
  private func setupTemperatureLabel(_ city: City) {
    let celsius = city.celsius.toString()
    let fahrenheit = FahrenheitConverter.fahrenheit(to: city.celsius).toString()
    temperatureLabel.text = "섭씨 \(celsius)도 / 화씨 \(fahrenheit)"
  }
}
