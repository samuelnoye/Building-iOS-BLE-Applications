//
//  BLECentral.swift
//  Building iOS BLE Applications
//
//  Created by Samuel Noye on 23/06/2022.
//

import Foundation
import CoreBluetooth

class BLECcentral: NSObject, CBCentralManagerDelegate {
   
    var  manager: CBCentralManager!
    
    override init() {
        super.init()
        manager = CBCentralManager(delegate: self, queue: nil)
    }
    
// MARK:- CBCentralManagerDelegate
    func centralManagerDidUpdateState(_ central: CBCentralManager) {
        if central.state == .poweredOn {
            print("Central powered on")
        }else{
            print("Central in unavailable:\(central.state.rawValue)")
        }
    }

}
