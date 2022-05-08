//
//  RecipeResultCell.swift
//  RecipeBox
//
//  Created by Feizza Fazilatun on 5/4/22.
//

import UIKit

class RecipeResultCell: UITableViewCell {
  @IBOutlet weak var recipeNameLabel: UILabel!
  @IBOutlet weak var recipeImageView: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
