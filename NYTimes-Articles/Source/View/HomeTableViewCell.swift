//
//  HomeTableViewCell.swift
//  NYTimes-Articles
//
//  Created by Pranil V P on 12/12/19.
//  Copyright © 2019 Pranil V P. All rights reserved.
//

import UIKit

class HomeTableViewCell: UITableViewCell {
    // MARK: - Outlets
    @IBOutlet weak var thumbnailImageView: UIImageView!
    @IBOutlet weak var headingLabel: UILabel!
    @IBOutlet weak var authorLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    var data: Result? {
        didSet {
            configureCell(data)
            
        }
        
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        
        // Make rounded thumbnail
        thumbnailImageView.makeRounded()
        
    }
    func configureCell(_ data: Result?) {
        headingLabel.text = data?.title
        authorLabel.text = data?.byline
        dateLabel.text = data?.publishedDate
        
        // Set thumbnail image
        let thumbnailImgUrl = URL(string: (data?.media[0].mediaMetadata[7].url)!)
        thumbnailImageView.loadImageFrom(thumbnailImgUrl!)
    }

}
