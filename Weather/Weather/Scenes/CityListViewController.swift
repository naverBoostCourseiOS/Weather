//
//  CityListViewController.swift
//  Weather
//
//  Created by hyosung on 2023/03/21.
//

import UIKit

final class CityListViewController: UIViewController {
  struct Dependency {
    let citiesRepository: CitiesRepositorable
  }
  
  // MARK: - Properties
  private let dependency: Dependency
  private let country: Country
  private var cities: [City] = []
  
  // MARK: - UI Properties
  private lazy var headerView: HeaderView = {
    let headerView = HeaderView(
      text: country.koreanName,
      textColor: .white,
      backgroundColor: .blue
    )
    headerView.translatesAutoresizingMaskIntoConstraints = false
    return headerView
  }()
  private lazy var citiesTableView: UITableView = {
    let tableView = UITableView()
    tableView.register(
      CityTableViewCell.self,
      forCellReuseIdentifier: CityTableViewCell.ID
    )
    tableView.dataSource = self
    tableView.delegate = self
    tableView.translatesAutoresizingMaskIntoConstraints = false
    return tableView
  }()
  
  init(
    dependency: Dependency,
    country: Country
  ) {
    self.dependency = dependency
    self.country = country
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
    fetchData()
  }
}

// MARK: - Configure UI
extension CityListViewController {
  private func configureUI() {
    view.addSubviews(
      headerView,
      citiesTableView
    )
  }
}

// MARK: - Setup Constraints
extension CityListViewController {
  private func setupConstraints() {
    [
      headerView.topAnchor.constraint(equalTo: view.topAnchor),
      headerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
      headerView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
    ]
      .forEach { $0.isActive = true }
    
    [
      citiesTableView.topAnchor.constraint(equalTo: headerView.bottomAnchor),
      citiesTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
      citiesTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
      citiesTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
    ]
      .forEach { $0.isActive = true }
  }
}

// MARK: - Private Function
extension CityListViewController {
  private func fetchData() {
    Task {
      let cities = await dependency.citiesRepository.fetch()
      self.cities = cities
      self.citiesTableView.reloadData()
    }
  }
}

extension CityListViewController: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return cities.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    guard let cell = tableView.dequeueReusableCell(withIdentifier: CityTableViewCell.ID, for: indexPath) as? CityTableViewCell else { return UITableViewCell() }
    cell.configure(cities[indexPath.item])
    return cell
  }
}

extension CityListViewController: UITableViewDelegate {
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    let koreanTranslator = WeatherTranslator(KoreanTranslatorFactory())
    let city = cities[indexPath.item]
    let cityViewController = CityViewController(
      dependency: .init(koreanTranslator: koreanTranslator),
      city: city
    )
    navigationController?.pushViewController(cityViewController, animated: true)
  }
}
