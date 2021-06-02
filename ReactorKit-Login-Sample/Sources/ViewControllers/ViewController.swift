//
//  ViewController.swift
//  ReactorKit-Login-Sample
//
//  Created by Jeongbae Kong on 2021/06/02.
//

import UIKit
import ReactorKit
import RxCocoa

class ViewController: UIViewController, StoryboardView {
  var disposeBag = DisposeBag()
  
  @IBOutlet weak var emailTextField: UITextField!
  @IBOutlet weak var passwordTextField: UITextField!
  @IBOutlet weak var loginButton: UIButton!
  
  func bind(reactor: MainViewReactor) {
    emailTextField.rx.text.orEmpty
      .map(Reactor.Action.emailInput)
      .bind(to: reactor.action)
      .disposed(by: disposeBag)
    
    passwordTextField.rx.text.orEmpty
      .map(Reactor.Action.passwordInput)
      .bind(to: reactor.action)
      .disposed(by: disposeBag)
    
    reactor.state.map(\.enableLoginButton)
      .bind(to: loginButton.rx.isEnabled)
      .disposed(by: disposeBag)
  }
}

