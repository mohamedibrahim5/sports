//
//  favouriteTableViewCell.swift
//  final_project
//
//  Created by mohamed ibrahim on 21/06/2022.
//

import UIKit

class favouriteTableViewCell: UITableViewCell {
    
    @IBOutlet weak var textlabell: UILabel!
    @IBOutlet weak var imageview: UIImageView!
    @IBOutlet weak var textlabel: UIView!
    @IBAction func youtubebutton(_ sender: UIButton) {
        
    }
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
