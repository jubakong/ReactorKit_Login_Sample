//
//  AppCoordinator.swift
//  ReactorKit-Login-Sample
//
//  Created by Jeongbae Kong on 2021/06/02.
//

import UIKit

class AppCoordinator: NSObject, Coordinator {
  var delegate: CoordinatorFinishDelegate?
  var presenter: UINavigationController
  var childCoordinators: [Coordinator]
  let window: UIWindow
  
  init(window: UIWindow) {
    self.window = window
    self.presenter = UINavigationController()
    self.childCoordinators = [] }
  
  func start() {
    window.rootViewController = presenter
    let coordinator = HomeCoordinator(presenter: presenter)
    childCoordinators.append(coordinator)
    coordinator.start()
    window.makeKeyAndVisible()
  }
}
