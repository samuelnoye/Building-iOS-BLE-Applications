//
//  BLECentral.swift
//  Building iOS BLE Applications
//
//  Created by Samuel Noye on 23/06/2022.
//

import Foundation
import CoreBluetooth

class BLECcentral: NSObject, CBCentralManagerDelegate {
   
    var manager: CBCentralManager!
    var discoveredPeripherals = [CBPeripheral]()
    var onDiscovered: (()->Void)?
    override init() {
        super.init()
        manager = CBCentralManager(delegate: self, queue: nil)
    }
    // MARK:- Scan for devices
    func scanForPeripherals(){
        manager.scanForPeripherals(withServices: nil, options: nil)
    }
    
// MARK:- CBCentralManagerDelegate
    func centralManagerDidUpdateState(_ central: CBCentralManager) {
        if central.state == .poweredOn {
            print("Central powered on")
            scanForPeripherals()
        }else{
            print("Central in unavailable:\(central.state.rawValue)")
        }
    }
    func centralManager(_ central: CBCentralManager, didDiscover peripheral: CBPeripheral, advertisementData: [String : Any], rssi RSSI: NSNumber) {
        discoveredPeripherals.append(peripheral)
        onDiscovered?()
    }

}
