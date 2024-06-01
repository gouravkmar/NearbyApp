//
//  ViewController.swift
//  NearbyApp
//
//  Created by Gourav Kumar on 01/06/24.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableview: UITableView!
    var tableViewData : TableViewData? {didSet {
        tableview.reloadData()
    }}
    override func viewDidLoad() {
        super.viewDidLoad()
        tableview.frame = view.frame
        tableview.delegate = self
        tableview.dataSource = self
        tableview.register(tableCell.self, forCellReuseIdentifier: "\(tableCell.self)")
    }
}
extension ViewController : UITableViewDelegate , UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        tableViewData?.venueData.venues.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "\(tableCell.self)") as! tableCell
        if let data = tableViewData?.venueData.venues[indexPath.row] {
            cell.setData(venue: data)
        }
        return cell
    }
    
    
}

