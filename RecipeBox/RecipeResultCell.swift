//
//  RecipeResultCell.swift
//  RecipeBox
//
//  Created by Feizza Fazilatun on 5/4/22.
//

import UIKit
var downloadTask: URLSessionDownloadTask?
class RecipeResultCell: UITableViewCell {
  @IBOutlet weak var recipeNameLabel: UILabel!
    @IBOutlet weak var recipeCountLabel: UILabel!
    @IBOutlet weak var recipeImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func configure(for result: SearchResult) {
      recipeNameLabel.text = result.title
        recipeCountLabel.text = "\(result.usedIngredientCount ?? -1) ingredients used"
      recipeImageView.image = UIImage(systemName: "square")
        if let imageURL = URL(string: result.image) {
          downloadTask = recipeImageView.loadImage(url: imageURL)
        }

      }
}
