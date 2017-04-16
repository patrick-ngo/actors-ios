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
     
        if let date = data["release_date"]?.double
        {
            //convert to epoch date
            let epochTime:TimeInterval = date
            let dateObject = Date(timeIntervalSince1970: epochTime)
            
            //date formatter
            let dateFormatter = DateFormatter()
            dateFormatter.dateStyle = .short
            
            dateLabel.text = dateFormatter.string(from: dateObject)
        }
        
        
        if let rating = data["vote_average"]?.double
        {
            ratingLabel.text = "\(rating)"
        }
        
        
        if let voteCount = data["vote_count"]?.string
        {
            votesLabel.text = voteCount + " votes"
        }
        
        
        if let backdropImagePath = data["backdrop_path"]?.string
        {
            thumbnailImageView.sd_setImage(with: URL(string: backdropImagePath))
        }
    }

}
