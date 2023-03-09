//
//  MainViewController.swift
//  Weather
//
//  Created by Doyeon on 2023/03/02.
//

import UIKit

class MainViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    let cellIdentifier: String = "cell"
    let countriesInOrder: [Country] = [.kr, .de, .it, .us, .fr, .jp]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
        let titleLabel = UILabel()
        titleLabel.text = "세계 날씨"
        titleLabel.font = UIFont.systemFont(ofSize: 22, weight: .semibold)
        titleLabel.textAlignment = .center
        navigationItem.titleView = titleLabel
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return countriesInOrder.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)
        let country = countriesInOrder[indexPath.row]
        
        cell.textLabel?.text = country.rawValue
        cell.textLabel?.font = UIFont.systemFont(ofSize: 20)
        cell.imageView?.image = UIImage(named: country.flagImageName)
        cell.accessoryType = .disclosureIndicator
        
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showCountry", let indexPath = tableView.indexPathForSelectedRow {
            let country = countriesInOrder[indexPath.row]
            if let destinationVC = segue.destination as? CountryViewController {
                destinationVC.selectedCountryName = country.rawValue
                destinationVC.countryJSONFileName = country.code
            }
        }
    }
}

