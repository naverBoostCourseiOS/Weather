//
//  CityListViewController.swift
//  WeatherToday
//
//  Created by 강동영 on 2023/02/28.
//

import UIKit

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
        let cell = tableView.dequeueReusableCell(withIdentifier: CountryListCell.identifier, for: indexPath)
        let info = countryInfos[indexPath.row]
        cell.imageView?.image = UIImage(named: "flag_kr")
        
        cell.textLabel?.text = info.city_name
        cell.accessibilityLabel = "accessibility"
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
            print("error", error.localizedDescription)
        }
    }
}
