//
//  DetailCell.swift
//  RecipeBox
//
//  Created by Feizza Fazilatun on 5/13/22.
//

import UIKit

class DetailCell: UITableViewCell {

    @IBOutlet weak var DetailContent: UILabel!
    @IBOutlet weak var DetailLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
