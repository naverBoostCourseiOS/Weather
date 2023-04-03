//
//  CityListViewController.swift
//  WeatherToday
//
//  Created by 강동영 on 2023/02/28.
//

import UIKit

final class CityListViewController: UIViewController {
    
    static let identifier: String = String(describing: CityListViewController.self)
    
    lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero)
        
        tableView.register(UINib(nibName: CountryListCell.identifier, bundle: nil),
                           forCellReuseIdentifier: CountryListCell.identifier)
        tableView.delegate = self
        tableView.dataSource = self
        return tableView
    }()
    
    var countryInfos: [CountryInfoDTO]? = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureTableView()
    }
    
    private func configureTableView() {
        view.addSubview(tableView)
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
    }
}
    
// MARK: UITableViewDelegate, UITableViewDataSource Method
extension CityListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return countryInfos?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: CountryListCell.identifier)
        guard let info = countryInfos?[indexPath.row] else { return cell }
        switch info.state {
            
        case .sunny:
            <#code#>
        case .cloudy:
            <#code#>
        case .rainy:
            <#code#>
        case .snowy:
            <#code#>
        }
        let state = WeatherState(rawValue: info.state.rawValue)
        cell.imageView?.image = UIImage(named: state!.imageName)
        
        cell.textLabel?.text = info.cityName
        let celsius = info.celsius
        let fahrenheit = String(format: "%.1f", (celsius * 1.8) + 32)
        cell.detailTextLabel?.text = "섭씨 \(info.celsius)도 / 화씨 \(fahrenheit)도\n강수확률 \(info.rainfallProbability)%"
        cell.detailTextLabel?.numberOfLines = 2
        
        cell.accessoryType = .disclosureIndicator
        return cell
    }

    func tableView( _ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let countryInfos = countryInfos else { return }
        let infos = countryInfos.map { info -> WeatherInfo in
            let cityName = info.cityName
            let state = WeatherState(rawValue: info.state.rawValue)
            let image = UIImage(named: state!.imageName)
            let localized = state!.title.localized
            
            let celsius = info.celsius.description
            let fahrenheit = String(format: "%.1f", (info.celsius * 1.8) + 32)
            let temperature = "섭씨 \(celsius)도, 화씨 \(fahrenheit)도"
            let rainfallProbability = "강수확률 \(info.rainfallProbability)%"
            
            
            return WeatherInfo(cityName: cityName,
                               image: image,
                               localized: localized,
                               temperature: temperature,
                               rainfallProbability: rainfallProbability)
        }
        
        guard let vc = self.storyboard?.instantiateViewController(withIdentifier: WeatherDetailViewController.identifier) as? WeatherDetailViewController else { return }
        vc.weatherInfo = infos[indexPath.row]
        
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
