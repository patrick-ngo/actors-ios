//
//  TableViewCell.swift
//  Test
//
//  Created by Patrick Ngo on 28/3/17.
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
        
        //possibly no rating container, depending on which screen we're on
        if let ratingContainerView = ratingContainerView
        {
            ratingContainerView.roundCorners()
        }
        
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
        //round down rating, if we have a rating label
        if let rating = data["popularity"]?.double, let ratingLabel = ratingLabel
        {
            let roundedRating = Double( round(rating * 100) / 100)
            ratingLabel.text = "\(roundedRating)"
        }
        
        //configure cell here
        nameLabel.text = data["name"]?.string
        detailLabel.text = data["description"]?.string
        locationLabel.text = data["location"]?.string
        
        
        //poster image
        if let profileImagePath = data["profile_path"]?.string {
            
            let imageUrl = URL(string: "\(API.BASE_URL_IMAGES_LOW)\(profileImagePath)")
            self.thumbnailImageView.sd_setImage(with: imageUrl, placeholderImage: nil)
        }
    }
}
