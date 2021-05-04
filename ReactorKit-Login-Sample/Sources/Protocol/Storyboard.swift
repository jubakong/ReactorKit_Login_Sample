//
//  Storyboard.swift
//  ReactorKit-Login-Sample
//
//  Created by Jeongbae Kong on 2021/06/02.
//

import UIKit

@objc
protocol Storyboard {
    @objc optional static func instantiate() -> Self
}


extension Storyboard where Self: UIViewController {
    
    static func instantiate(from name: String = "Main") -> Self {
        let fullName = NSStringFromClass(self)
        let className = fullName.components(separatedBy: ".").last ?? ""
        let storyboard = UIStoryboard(name: name, bundle: nil)
        return storyboard.instantiateViewController(withIdentifier: className) as! Self
    }
    
}
