//
//  AppFlowController.swift
//  Building iOS BLE Applications
//
//  Created by Samuel Noye on 23/06/2022.
//

import UIKit

class AppFLowController {
    let window: UIWindow
    var central: BLECcentral?
    
    init(window: UIWindow) {
        self.window = window
    }
    
    func start() {
        central = BLECcentral() 
        let viewController = DiscoveryViewController()
             //   viewController.central = central
                window.rootViewController = viewController
                window.makeKeyAndVisible()
                
    }
}
