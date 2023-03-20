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
  private func configureUI() { }
}

// MARK: - Setup Constraints
extension CityListViewController {
  private func setupConstraints() { }
}

// MARK: - Private Function
extension CityListViewController {
  private func fetchData() {
    Task {
      let country = try? await dependency.citiesRepository.fetch()
    }
  }
}
