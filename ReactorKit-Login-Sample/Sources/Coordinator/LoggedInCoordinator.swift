//
//  LoggedInCoordinator.swift
//  ReactorKit-Login-Sample
//
//  Created by Jeongbae Kong on 2021/06/02.
//

import UIKit

class LoggedInCoordinator: NSObject, Coordinator {
    
    // MARK: Properties
    
    var delegate: CoordinatorFinishDelegate?
    
    var presenter: UINavigationController
    
    var childCoordinators: [Coordinator]
    
    
    // MARK: Initializing
    
    init(presenter: UINavigationController) {
        self.presenter = presenter
        self.childCoordinators = []
    }
    
    func start() {
        let detailView = LoggedInViewController.instantiate()
        detailView.coordinator = self
        presenter.pushViewController(detailView, animated: true)
    }
    
}

