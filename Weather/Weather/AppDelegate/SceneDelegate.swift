//
//  SceneDelegate.swift
//  Weather
//
//  Created by hyosung on 2023/03/03.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

  var window: UIWindow?
  
  func scene(
    _ scene: UIScene,
    willConnectTo session: UISceneSession,
    options connectionOptions: UIScene.ConnectionOptions
  ) {
    
    let decoder: Decodable = Decoder()
    let nsDataaAssetConvertor: NSDataAssetConvertable = NSDataAssetConvertor()
    let countiresRepository: CountriesRepositorable = CountriesRepository(
      decoder: decoder,
      nsDataAssetConvertor: nsDataaAssetConvertor
    )
    let viewController = HomeViewController(
      .init(
        countriesRepository: countiresRepository
      )
    )
    let navigationController = UINavigationController(rootViewController: viewController)
    navigationController.navigationBar.isHidden = true
    navigationController.modalPresentationStyle = .overFullScreen
    
    self.window = makeWindow(scene: scene)
    
    configure(
      window: window,
      rootViewController: navigationController
    )
  }
}

// MARK: - Private Function
extension SceneDelegate {
  private func makeWindow(scene: UIScene) -> UIWindow? {
    guard let windowScene = (scene as? UIWindowScene) else { return nil }
    return UIWindow(windowScene: windowScene)
  }
  
  private func configure(
    window: UIWindow?,
    rootViewController: UIViewController
  ) {
    guard let window = window else { return }
    window.backgroundColor = .white
    window.overrideUserInterfaceStyle = .light
    window.rootViewController = rootViewController
    window.makeKeyAndVisible()
  }
}


