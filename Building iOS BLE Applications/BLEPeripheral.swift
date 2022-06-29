//
//  BLEPeripheral.swift
//  Building iOS BLE Applications
//
//  Created by Samuel Noye on 29/06/2022.
//

import Foundation
import CoreBluetooth

class BLEPeripheral: NSObject, CBPeripheralManagerDelegate {
    
    var manager: CBPeripheralManager!
    
    override init() {
        super.init()
        manager = CBPeripheralManager(delegate: self, queue: nil)
    }
    func peripheralManagerDidUpdateState(_ peripheral: CBPeripheralManager) {
        <#code#>
    }
}
