//
//  CountryViewController.swift
//  Weather
//
//  Created by Doyeon on 2023/03/05.
//

import UIKit

class CountryViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    let customCellIdentifier: String = "customCell"
    var countryJSONFileName: String?
    var selectedCountryName: String?
    var weatherImageName: String?
    var cityName: String?
    var temperature: String?
    var precipitationProbability: String?
    var weathers: [Weather] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = selectedCountryName
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
        let jsonDecoder = JSONDecoder()
        guard let dataAsset = NSDataAsset(name: countryJSONFileName!) else { return }
        
        do {
            self.weathers = try jsonDecoder.decode([Weather].self, from: dataAsset.data)
        } catch {
            print(error.localizedDescription)
        }
        
        self.tableView.reloadData()
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.weathers.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: CustomTableViewCell = tableView.dequeueReusableCell(withIdentifier: self.customCellIdentifier, for: indexPath) as! CustomTableViewCell
        let weather = self.weathers[indexPath.row]
        
        cell.weatherImageView.image = UIImage(named: weather.getWeatherImage)
        cell.cityNameLabel.text = weather.cityName
        cell.temperatureLabel.text = weather.getTemp
        cell.rainfallProbabilityLabel.text = weather.getRainfallProb
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetail", let indexPath = tableView.indexPathForSelectedRow {
            let city = weathers[indexPath.row]
            if let destinationVC = segue.destination as? DetailViewController {
                destinationVC.weatherImageName = city.getWeatherImage
                destinationVC.weatherStateString = city.getWeatherState
                destinationVC.tempertureString = city.getTemp
                destinationVC.precipitationProbability = city.getRainfallProb
                destinationVC.cityName = city.cityName
            }
        }
    }

}
