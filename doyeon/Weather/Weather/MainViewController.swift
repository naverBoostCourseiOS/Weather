//
//  MainViewController.swift
//  Weather
//
//  Created by Doyeon on 2023/03/02.
//

import UIKit

enum Country: String {
    case kr = "한국"
    case de = "독일"
    case it = "이탈리아"
    case us = "미국"
    case fr = "프랑스"
    case jp = "일본"
    
    var flagImageName: String {
        switch self {
        case .kr:
            return "flag_kr"
        case .de:
            return "flag_de"
        case .it:
            return "flag_it"
        case .us:
            return "flag_us"
        case .fr:
            return "flag_fr"
        case .jp:
            return "flag_jp"
        }
    }
}


class MainViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    let cellIdentifier: String = "cell"
    let countriesInOrder: [Country] = [.us, .jp, .us, .fr, .de, .it, .kr]
    
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
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        <#code#>
    }

}

