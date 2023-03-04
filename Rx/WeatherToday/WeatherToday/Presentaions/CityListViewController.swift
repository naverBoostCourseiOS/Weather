//
//  CityListViewController.swift
//  WeatherToday
//
//  Created by 강동영 on 2023/02/28.
//

import UIKit

enum WeatherState: Int {
    case sunny = 10
    case cloudy
    case rainy
    case snowy
    
    var imageName: String {
        switch self {
        case .sunny:
            return "sunny"
            
        case .cloudy:
            return "cloudy"

        case .rainy:
            return "rainy"
        
        case .snowy:
            return "snowy"
        }
    }
}

class CityListViewController: UIViewController {
    
    static let identifier: String = String(describing: CityListViewController.self)
    
    lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero)
        
        
        tableView.register(UINib(nibName: CountryListCell.identifier, bundle: nil),
                           forCellReuseIdentifier: CountryListCell.identifier)
        tableView.delegate = self
        tableView.dataSource = self
        return tableView
    }()
    
    var countryInfos: [CountryInfoDTO] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBlue
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
        return countryInfos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //let cell = tableView.dequeueReusableCell(withIdentifier: CountryListCell.identifier, for: indexPath)
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: CountryListCell.identifier)
        let info = countryInfos[indexPath.row]
        let state = WeatherState(rawValue: info.state)
        cell.imageView?.image = UIImage(named: state!.imageName)
        
        cell.textLabel?.text = info.city_name
        let celsius = info.celsius
        let fahrenheit = String(format: "%.1f", (celsius * 1.8) + 32)
        cell.detailTextLabel?.text = "섭씨 \(info.celsius)도 / 화씨 \(fahrenheit)도\n강수확률 \(info.rainfall_probability)%"
        cell.detailTextLabel?.numberOfLines = 2
        
        cell.accessoryType = .disclosureIndicator
        return cell
    }

    func tableView( _ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let info = countryInfos[indexPath.row]
        
        let jsonDecoder: JSONDecoder = JSONDecoder()
        guard let dataAsset: NSDataAsset = NSDataAsset(name: "kr") else { return }
        
        do {
            let countryInfo: [CountryInfoDTO] = try jsonDecoder.decode([CountryInfoDTO].self, from: dataAsset.data)
            
        } catch {
            print(error.localizedDescription)
        }
    }
}
