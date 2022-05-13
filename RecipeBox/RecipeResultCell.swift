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
        //https://www.appsdeveloperblog.com/uiimageview-rounded-corners-in-swift/
        recipeImageView.layer.cornerRadius = 20
    //https://www.ralfebert.com/ios/swift-uikit-uicolor-picker/
        //https://stackoverflow.com/questions/27821785/converting-uicolor-to-cgcolor-in-swift
        recipeImageView.layer.borderColor = UIColor(red: 1, green: 0.3922, blue: 0.3294, alpha: 1.0).cgColor
        recipeImageView.layer.borderWidth = 2
        recipeImageView.layer.masksToBounds = true
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
