//
//  MovieCell.swift
//  Test
//
//  Created by Netccentric on 29/3/17.
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
        /*
        //convert epoch time readable date
        let dateValue = Double(data["release_date"]!.stringValue)
        let epochTime: TimeInterval = dateValue!
        let date = Date(timeIntervalSince1970: epochTime)
        */
        //TODO: fix this
        

        //configure cell here
        nameLabel.text = data["original_title"]?.stringValue
        dateLabel.text = data["release_date"]?.stringValue
        ratingLabel.text = data["vote_average"]?.stringValue
        votesLabel.text = (data["vote_count"]?.stringValue)! + " votes"
        
        if let backdropImagePath = data["backdrop_path"]?.stringValue
        {
            thumbnailImageView.sd_setImage(with: URL(string: backdropImagePath))
        }
    }

}
