//
//  RecipeDetailsViewController.swift
//  RecipeBox
//
//  Created by Feizza Fazilatun on 5/8/22.
//

import UIKit

class RecipeDetailsViewController: UIViewController {
    var downloadTask: URLSessionDownloadTask?
    var recipeInfo: SearchResult!
    @IBOutlet weak var recipeTitle: UILabel!
    @IBOutlet weak var recipeImage: UIImageView!
    @IBOutlet weak var recipeIngredients: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        // Do any additional setup after loading the view.
    }
    func configure() {
      recipeTitle.text = recipeInfo.title
      recipeImage.image = UIImage(systemName: "square")
        if let imageURL = URL(string: recipeInfo.image) {
          downloadTask = recipeImage.loadImage(url: imageURL)
        }
      //Appending strings to form bullet list: https://bendodson.com/weblog/2018/08/09/bulleted-lists-with-uilabel/#fnref:localise
       let bullet = "•  "
       
       var strings = [String]()
       strings.append("Payment will be charged to your iTunes account at confirmation of purchase.")
       strings.append("Your subscription will automatically renew unless auto-renew is turned off at least 24-hours before the end of the current subscription period.")
       strings.append("Your account will be charged for renewal within 24-hours prior to the end of the current subscription period.")
       strings.append("Automatic renewals will cost the same price you were originally charged for the subscription.")
       strings.append("You can manage your subscriptions and turn off auto-renewal by going to your Account Settings on the App Store after purchase.")
       strings.append("Read our terms of service and privacy policy for more information.")
       strings = strings.map { return bullet + $0 }
       
        var attributes = [NSAttributedString.Key: Any]()
       attributes[.foregroundColor] = UIColor.darkGray
       
       let paragraphStyle = NSMutableParagraphStyle()
       paragraphStyle.headIndent = (bullet as NSString).size(withAttributes: attributes).width
       attributes[.paragraphStyle] = paragraphStyle

       let string = strings.joined(separator: "\n\n")
       recipeIngredients.attributedText = NSAttributedString(string: string, attributes: attributes)
    }
      

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
