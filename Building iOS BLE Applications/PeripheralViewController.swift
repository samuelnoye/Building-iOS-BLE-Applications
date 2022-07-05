//
//  PeripheralViewController.swift
//  Building iOS BLE Applications
//
//  Created by Samuel Noye on 05/07/2022.
//

import UIKit

class PeripheralViewController: UIViewController {

    var peripheral: BLEPeripheral!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        peripheral = BLEPeripheral()
    }
    

 

}
