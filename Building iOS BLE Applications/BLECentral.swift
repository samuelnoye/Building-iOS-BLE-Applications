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
    var discoveredPeripherals = [DiscoveredPeripheral]()
    var onDiscovered: (()->Void)?
    let service = CBUUID(string: "6E400001-B5A3-F393-E0A9-E50E24DCCA9E")
    override init() {
        super.init()
        manager = CBCentralManager(delegate: self, queue: nil)
    }
    // MARK:- Scan for devices
    func scanForPeripherals(){
        let options: [String: Any] = [CBCentralManagerScanOptionAllowDuplicatesKey: false]
        manager.scanForPeripherals(withServices: nil, options: options )
    }
    
// MARK:- CBCentralManagerDelegate
    func centralManagerDidUpdateState(_ central: CBCentralManager) {
        if central.state == .poweredOn {
            print("Central powered on")
          //  scanForPeripherals()
        }else{
            print("Central in unavailable:\(central.state.rawValue)")
        }
    }
    func centralManager(_ central: CBCentralManager, didDiscover peripheral: CBPeripheral, advertisementData: [String : Any], rssi RSSI: NSNumber) {
        discoveredPeripherals.append(DiscoveredPeripheral(peripheral: peripheral, rssi: RSSI, advertisementData: advertisementData))
        onDiscovered?()
    }

}
