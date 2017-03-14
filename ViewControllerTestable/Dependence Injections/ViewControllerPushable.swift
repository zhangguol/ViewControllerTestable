//
//  ViewControllerPushable.swift
//  ViewControllerTestable
//
//  Created by Boxuan Zhang on 3/14/17.
//  Copyright © 2017 Boxuan Zhang. All rights reserved.
//

import Foundation

protocol ViewControllerPushable {
    func push(_ viewController: UIViewController,
              in navigationControler: UINavigationController,
              animated: Bool)
}

class ViewControllerPusher: ViewControllerPushable {
    
    static let shared = ViewControllerPusher()
    
    func push(_ viewController: UIViewController,
              in navigationControler: UINavigationController,
              animated: Bool) {
        
        navigationControler.pushViewController(viewController, animated: animated)
    }
}
