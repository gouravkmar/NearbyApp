//
//  tableCell.swift
//  NearbyApp
//
//  Created by Gourav Kumar on 01/06/24.
//

import UIKit

class tableCell: UITableViewCell {

    @IBOutlet weak var cellImage: UIImageView!
    @IBOutlet weak var detailLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func setData(venue : Venue) {
        titleLabel.text = venue.name
        detailLabel.text = venue.address
    }
    
}
