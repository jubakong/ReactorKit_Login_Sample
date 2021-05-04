//
//  HomeCoordinator.swift
//  ReactorKit-Login-Sample
//
//  Created by Jeongbae Kong on 2021/06/02.
//

import UIKit

class HomeCoordinator: NSObject, Coordinator {
  var delegate: CoordinatorFinishDelegate?
  
  var presenter: UINavigationController
  var childCoordinators: [Coordinator]
  var reactor: MainViewReactor?
  
  init(presenter: UINavigationController,
       reactor: MainViewReactor? = MainViewReactor()
  ) {
    self.presenter = presenter
    self.childCoordinators = []
    self.reactor = reactor
  }
  
  func start() {
    let homeView = ViewController.instantiate()
    homeView.reactor = reactor
    homeView.coordinator = self
    presenter.pushViewController(homeView, animated: false)
  }
  
  func pushToLoggedInPage() {
    let coordinator = LoggedInCoordinator(presenter: presenter)
    coordinator.delegate = self
    childCoordinators.append(coordinator)
    coordinator.start()
  }
}
