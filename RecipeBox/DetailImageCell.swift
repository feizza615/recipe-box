//
//  DetailImageCell.swift
//  RecipeBox
//
//  Created by Feizza Fazilatun on 5/13/22.
//

import UIKit

class DetailImageCell: UITableViewCell {

    @IBOutlet weak var DetailTitle: UILabel!
    @IBOutlet weak var DetailImage: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }

}
