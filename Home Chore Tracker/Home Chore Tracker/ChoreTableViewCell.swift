//
//  ChoreTableViewCell.swift
//  Home Chore Tracker
//
//  Created by admin on 10/21/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class ChoreTableViewCell: UITableViewCell {
    
    @IBOutlet weak var choreImageView: UIImageView!
    @IBOutlet weak var choreNameLabel: UILabel!
    @IBOutlet weak var pointsLabel: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        
        updateViews()
    }
    
    func updateViews() {
        
//        choreImageView.image = chore.image

//        choreNameLabel.text = chore.name
        choreNameLabel.textColor = UIColor(displayP3Red: 5.0, green: 85.0, blue: 150.0, alpha: 1.0)
        
//        pointsLabel.text = "\(chore.points) points"
        pointsLabel.textColor = UIColor(displayP3Red: 5.0, green: 85.0, blue: 150.0, alpha: 1.0)
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
