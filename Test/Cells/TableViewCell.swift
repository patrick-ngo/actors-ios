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
    
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var thumbnailImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var detailLabel: UILabel!
    @IBOutlet weak var ratingLabel: UILabel!
    
    @IBOutlet weak var thumbnailContainerView: UIView!
    @IBOutlet weak var ratingContainerView: UIView!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        //rounded corners
        containerView.roundCorners()
        ratingContainerView.roundCorners()
        
        //make photo round
        thumbnailContainerView.makeCircular()
        thumbnailImageView.makeCircular()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func populateData(data: [String:JSON])
    {
        //round down rating
        let rating = round((Double(data["popularity"]!.stringValue))! * 100) / 100
        
        //configure cell here
        nameLabel.text = data["name"]?.stringValue
        detailLabel.text = data["description"]?.stringValue
        locationLabel.text = data["location"]?.stringValue
        ratingLabel.text = String(rating)
        
        if let profileImagePath = data["profile_path"]?.stringValue
        {
            thumbnailImageView.sd_setImage(with: URL(string: profileImagePath))
        }
    }
}
