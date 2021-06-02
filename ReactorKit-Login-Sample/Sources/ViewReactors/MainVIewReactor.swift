//
//  MainVIewReactor.swift
//  ReactorKit-Login-Sample
//
//  Created by Jeongbae Kong on 2021/06/02.
//

import Foundation
import ReactorKit

final class MainViewReactor: Reactor {
  
  enum Action {
    case emailInput(String)
    case passwordInput(String)
  }
  
  enum Mutation {
    case emailValidation(Bool)
    case passwordValidation(Bool)
  }
  
  struct State {
    var isEmailValid: Bool = false
    var isPasswordValid: Bool = false
    var enableLoginButton: Bool = false
  }
  
  var initialState: State = State()
  
  func mutate(action: Action) -> Observable<Mutation> {
    switch action {
    case let .emailInput(email):
      return .just(.emailValidation(isValidEmail(email: email)))
      
    case let .passwordInput(password):
      return .just(.passwordValidation(isValidPassword(password: password)))
    }
  }
  
  func reduce(state: State, mutation: Mutation) -> State {
    var newState = state
    
    switch mutation {
    case let .emailValidation(isValid):
      newState.isEmailValid = isValid
      newState.enableLoginButton = (isValid == true && currentState.isPasswordValid == true)
      
    case let .passwordValidation(isValid):
      newState.isPasswordValid = isValid
      newState.enableLoginButton = (isValid == true && currentState.isEmailValid == true)
    }
    return newState
  }
}

extension MainViewReactor {
  private func isValidEmail(email: String) -> Bool {
    let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
    let emailTest = NSPredicate(format: "SELF MATCHES %@", emailRegEx)
    let result = emailTest.evaluate(with: email)
    return result
  }
  
  private func isValidPassword(password: String) -> Bool {
    if password.count > 5 {
      return true
    } else {
      return false
    }
  }
}
