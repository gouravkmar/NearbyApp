//
//  ViewController.swift
//  NearbyApp
//
//  Created by Gourav Kumar on 01/06/24.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var sliderBar: UISlider!
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableview: UITableView!
    var tableViewData : TableViewData? {didSet {
        tableview.reloadData()
    }}
    let appDataManager = AppDataManager.shared
    override func viewDidLoad() {
        super.viewDidLoad()
        tableview.frame = view.frame
        tableview.delegate = self
        tableview.dataSource = self
        tableview.register(tableCell.self, forCellReuseIdentifier: "\(tableCell.self)")
        searchBar.delegate = self
        sliderBar.addTarget(self, action: #selector(sliderValueDidChange(_:)), for: .valueChanged)
        sliderBar.maximumValue = 50
        sliderBar.minimumValue = 10
    }
    
    @objc func sliderValueDidChange(_ sender: UISlider) {
        let sliderValue = sender.value
        AppDataManager.shared.range = String(sliderValue)
        
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
extension ViewController : UISearchBarDelegate {
    
}
extension ViewController : DataProtocol {
    func didUpdateDataStatus(status: DatafetchStatus) {
        tableview.reloadData()
    }
    
    
}
