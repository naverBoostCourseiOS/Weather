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
    
    private var countries: [ContriesDTO] = []
    
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
        let jsonDecoder: JSONDecoder = JSONDecoder()
        
        guard let dataAsset: NSDataAsset = NSDataAsset(name: "countries") else { return }
        
        do {
            countries = try jsonDecoder.decode([ContriesDTO].self, from: dataAsset.data)
            print("countries = \(countries)")
        } catch {
            print("error", error.localizedDescription)
        }
    }
}

// MARK: UITableViewDelegate, UITableViewDataSource Method
extension CountryListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return countries.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CountryListCell.identifier, for: indexPath)
        let info = countries[indexPath.row]
        cell.imageView?.image = UIImage(named: "flag_\(info.asset_name)")
        
        cell.textLabel?.text = info.korean_name
        cell.accessoryType = .disclosureIndicator
        return cell
    }
    
    func tableView( _ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let info = countries[indexPath.row]
        
        let jsonDecoder: JSONDecoder = JSONDecoder()
        guard let dataAsset: NSDataAsset = NSDataAsset(name: info.asset_name) else { return }
        
        do {
            let countryInfos: [CountryInfoDTO] = try jsonDecoder.decode([CountryInfoDTO].self, from: dataAsset.data)
            print("countryInfo = \(countryInfos)")
            let vc = self.storyboard!.instantiateViewController(withIdentifier: CityListViewController.identifier) as! CityListViewController
            vc.countryInfos = countryInfos
            vc.navigationItem.title = info.korean_name
            self.navigationController?.pushViewController(vc, animated: true)
        } catch {
            print("error", error.localizedDescription)
        }
    }
}

