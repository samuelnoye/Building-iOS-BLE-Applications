//
//  DiscoveryViewController.swift
//  Building iOS BLE Applications
//
//  Created by Samuel Noye on 23/06/2022.
//

import UIKit

class DiscoveryViewController: UITableViewController {
    var central: BLECcentral!
    override func viewDidLoad() {
        super.viewDidLoad()

        central.onDiscovered = { [weak self] in
            self?.tableView.reloadData()
        }
        tableView.register(UINib(nibName: "DiscoveredPeripheralCell", bundle: nil), forCellReuseIdentifier: "DiscoveredPeripheralCell")
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 10
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return central.discoveredPeripherals.count
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: "Cell")
//        let peripheral = central.discoveredPeripherals[indexPath.row]
//        print(peripheral)
//        cell.textLabel?.text = peripheral.name ?? "Name"
//        cell.detailTextLabel?.text = peripheral.identifier.uuidString
        let cell = tableView.dequeueReusableCell(withIdentifier: "DiscoveredPeripheralCell", for: indexPath) as! DiscoveredPeripheralCell
        let discoveredPeripheral = central.discoveredPeripherals[indexPath.row]
        cell.identifierLbl.text = discoveredPeripheral.peripheral.identifier.uuidString
        cell.rssiLbl.text = discoveredPeripheral.rssi.stringValue
        cell.advertisementlbl.text = discoveredPeripheral.advertisementData.debugDescription
        cell.rssiLbl.textColor = .red
        return cell
    }
    
}
