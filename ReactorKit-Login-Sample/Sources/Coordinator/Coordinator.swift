//
//  Coordinator.swift
//  ReactorKit-Login-Sample
//
//  Created by Jeongbae Kong on 2021/06/02.
//

import UIKit

protocol Coordinator: AnyObject {
  var presenter: UINavigationController { get set }
  var childCoordinators: [Coordinator] { get set }
}
