//
//  MovieCell.swift
//  Test
//
//  Created by Patrick Ngo on 29/3/17.
//  Copyright © 2017 ngo. All rights reserved.
//

import UIKit
import SwiftyJSON

class MovieCell: UITableViewCell
{
    @IBOutlet weak var thumbnailImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var ratingLabel: UILabel!
    @IBOutlet weak var votesLabel: UILabel!
    
    @IBOutlet weak var ratingContainerView: UIView!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        ratingContainerView.roundCorners()
        thumbnailImageView.roundCorners()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func populateData(data: [String:JSON])
    {
        //configure cell here
        nameLabel.text = data["original_title"]?.string
     
        if let date = data["release_date"]?.string
        {
            dateLabel.text = date
        }
        
        
        if let rating = data["vote_average"]?.double
        {
            ratingLabel.text = "\(rating)"
        }
        
        
        if let voteCount = data["vote_count"]?.int
        {
            votesLabel.text = "\(voteCount) votes"
        }
        
        //poster image
        if let backdropImagePath = data["backdrop_path"]?.string {
            
            let imageUrl = URL(string: "\(API.BASE_URL_IMAGES_HIGH)\(backdropImagePath)")
            self.thumbnailImageView.sd_setImage(with: imageUrl, placeholderImage: nil)
        }
    }

}
