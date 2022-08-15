//
//  DiscoveredPeripheral.swift
//  Building iOS BLE Applications
//
//  Created by Samuel Noye on 24/06/2022.
//

import Foundation
import CoreBluetooth

class DiscoveredPeripheral {
    var peripheral: CBPeripheral
    var rssi: NSNumber
    var advertisementData: [String: Any]
    
    init(peripheral: CBPeripheral, rssi: NSNumber, advertisementData: [String: Any]){
        self.peripheral = peripheral
       // self.rssi = rssi
        self.advertisementData = advertisementData
    }
}
