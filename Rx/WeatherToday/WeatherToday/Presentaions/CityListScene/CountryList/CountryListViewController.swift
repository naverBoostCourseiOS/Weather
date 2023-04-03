//
//  CountryListViewController.swift
//  WeatherToday
//
//  Created by 강동영 on 2023/02/27.
//

import UIKit

final class CountryListViewController: UIViewController {

    lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero)
        
        
        tableView.register(UINib(nibName: CountryListCell.identifier, bundle: nil),
                           forCellReuseIdentifier: CountryListCell.identifier)
        tableView.delegate = self
        tableView.dataSource = self
        return tableView
    }()
    
    private var countries: [CountriesDTO]? = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureNaviAppearance()
        configureTableView()
        decodeDataAsset()
    }

    private func configureNaviAppearance() {
        navigationItem.title = "세계 날씨"
        let appearance = UINavigationBarAppearance()
        appearance.backgroundColor = .systemBlue
        appearance.titleTextAttributes = [.foregroundColor: UIColor.white]
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
        navigationController?.navigationBar.tintColor = .white
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
    
    private func decodeDataAsset() {
        var countriesDataDecoder = CustomJSONDecoder<[CountriesDTO]>()
        countries = countriesDataDecoder.decode(jsonFileName: "countries")
    }
}

// MARK: UITableViewDelegate, UITableViewDataSource Method
extension CountryListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return countries?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CountryListCell.identifier, for: indexPath)
        guard let info = countries?[indexPath.row] else { return cell }
        cell.imageView?.image = UIImage(named: "flag_\(info.assetName)")
        
        cell.textLabel?.text = info.koreanName
        cell.accessoryType = .disclosureIndicator
        return cell
    }
    
    func tableView( _ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let info = countries?[indexPath.row],
              let vc = self.storyboard!.instantiateViewController(withIdentifier: CityListViewController.identifier) as? CityListViewController
        else { return }
        
        var countriesDataDecoder = CustomJSONDecoder<[CountryInfoDTO]>()
        
        vc.countryInfos = countriesDataDecoder.decode(jsonFileName: info.assetName)
        vc.navigationItem.title = info.koreanName
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

