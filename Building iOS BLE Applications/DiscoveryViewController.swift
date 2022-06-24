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
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return central.discoveredPeripherals.count
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: "Cell")
        let peripheral = central.discoveredPeripherals[indexPath.row]
        print(peripheral)
        cell.textLabel?.text = peripheral.name ?? "Name"
        cell.detailTextLabel?.text = peripheral.identifier.uuidString

        return cell
    }
    
}
