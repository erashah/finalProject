//
//  GreyTableViewCell.swift
//  connectGitHub
//
//  Created by Scholar on 8/3/22.
//

import UIKit

class GreyTableViewCell: UITableViewCell {
    
    @IBOutlet var messageText: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
