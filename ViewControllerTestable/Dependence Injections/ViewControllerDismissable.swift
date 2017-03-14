//
//  ViewControllerDismissable.swift
//  ViewControllerTestable
//
//  Created by Boxuan Zhang on 3/14/17.
//  Copyright © 2017 Boxuan Zhang. All rights reserved.
//

import Foundation

protocol ViewControllerDismissable {
    func dismiss(_ viewController: UIViewController,
                 animated: Bool,
                 completion: (() -> Void)?)
}

class ViewControllerDismisser: ViewControllerDismissable {
    
    static let shared = ViewControllerDismisser()
    
    func dismiss(_ viewController: UIViewController,
                 animated: Bool,
                 completion: (() -> Void)?) {
        
        viewController.dismiss(animated: animated, completion: completion)
    }
}
