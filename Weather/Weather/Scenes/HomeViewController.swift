//
//  HomeViewController.swift
//  Weather
//
//  Created by hyosung on 2023/03/03.
//

import UIKit

final class HomeViewController: UIViewController {
  struct Dependency {
    let countriesRepository: CountriesRepositorable
  }
  
  // MARK: - Properties
  private let dependency: Dependency
  private var countries: [Country] = []
  
  // MARK: - UI Properties
  private let headerView: HeaderView = {
    let headerView = HeaderView(
      text: "세계 날씨",
      textColor: .white,
      backgroundColor: .blue
    )
    headerView.translatesAutoresizingMaskIntoConstraints = false
    return headerView
  }()
  private lazy var contriesTableView: UITableView = {
    let tableView = UITableView()
    tableView.register(
      CountryTableViewCell.self,
      forCellReuseIdentifier: CountryTableViewCell.ID
    )
    tableView.dataSource = self
    tableView.translatesAutoresizingMaskIntoConstraints = false
    return tableView
  }()
  
  init(_ dependency: Dependency) {
    self.dependency = dependency
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
extension HomeViewController {
  private func configureUI() {
    view.addSubviews(
      headerView,
      contriesTableView
    )
  }
}

// MARK: - Setup Constraints
extension HomeViewController {
  private func setupConstraints() {
    [
      headerView.topAnchor.constraint(equalTo: view.topAnchor),
      headerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
      headerView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
    ]
      .forEach { $0.isActive = true }
    
    [
      contriesTableView.topAnchor.constraint(equalTo: headerView.bottomAnchor),
      contriesTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
      contriesTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
      contriesTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
    ]
      .forEach { $0.isActive = true }
  }
}

// MARK: - Private Function
extension HomeViewController {
  private func fetchData() {
    Task {
      let countries = await dependency.countriesRepository.fetch()
      self.countries = countries
      self.contriesTableView.reloadData()
    }
  }
}

extension HomeViewController: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return countries.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    guard let cell = tableView.dequeueReusableCell(
      withIdentifier: CountryTableViewCell.ID,
      for: indexPath
    ) as? CountryTableViewCell
    else { return UITableViewCell() }
    cell.configure(
      image: UIImage(),
      title: countries[indexPath.item].koreanName
    )
    return cell
  }
}

