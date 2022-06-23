//
//  BLECentral.swift
//  Building iOS BLE Applications
//
//  Created by Samuel Noye on 23/06/2022.
//

import Foundation
import CoreBluetooth

class BLECcentral: NSObject, CBCentralManagerDelegate {
    func centralManagerDidUpdateState(_ central: CBCentralManager) {
        <#code#>
    }
    
    var manager: CBCentralManager!
}
