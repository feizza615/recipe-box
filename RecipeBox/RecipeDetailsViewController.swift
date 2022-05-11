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
