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
    
    func configureSummary(for result: SummaryResult) {
      DetailLabel.text = "Recipe Summary"
        let data = Data(result.summary.utf8)
        //https://www.hackingwithswift.com/example-code/system/how-to-convert-html-to-an-nsattributedstring

        if let attributedString = try? NSAttributedString(data: data, options: [.documentType: NSAttributedString.DocumentType.html], documentAttributes: nil) {
            DetailContent.attributedText = attributedString
        }
        DetailContent.font = UIFont(name:"Avenir", size: 16.0)

      }

}
