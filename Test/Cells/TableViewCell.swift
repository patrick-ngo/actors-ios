//
//  TableViewCell.swift
//  Test
//
//  Created by Netccentric on 28/3/17.
//  Copyright © 2017 ngo. All rights reserved.
//

import UIKit
import SwiftyJSON
import SDWebImage

class TableViewCell: UITableViewCell {
    
    @IBOutlet weak var thumbnailImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var detailLabel: UILabel!
    @IBOutlet weak var ratingLabel: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func populateData(data: [String:JSON])
    {
        //configure cell here
        nameLabel.text = data["name"]?.stringValue
        detailLabel.text = data["description"]?.stringValue
        locationLabel.text = data["location"]?.stringValue
        ratingLabel.text = data["popularity"]?.stringValue
        
        if let profileImagePath = data["profile_path"]?.stringValue
        {
            thumbnailImageView.sd_setImage(with: URL(string: profileImagePath))
        }

//        thumbnailImageView.sd_setImage(with: URL(string: (data["profile_path"]?.stringValue)!))
    }
}
