//
//  CategoryViewController.swift
//  RecipeBox
//
//  Created by Feizza Fazilatun on 4/10/22.
//

import UIKit

class CategoryViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {

    @IBOutlet weak var collectionView: UICollectionView!
    let catNames: [String] = ["Meat", "Fish", "Vegg", "Fruit", "Dairy", "Wheat"]
    let catImage: [String] = ["meat", "fish", "vege", "fruits", "dairy", "wheat"]
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        collectionView.delegate = self
        collectionView.dataSource = self
        self.collectionView.reloadData()
        
//        Lines 22-26 -> change navigation title font from: https://www.hackingwithswift.com/example-code/uikit/how-to-style-the-font-in-a-uinavigationbars-title
        let attrs = [
            NSAttributedString.Key.font: UIFont(name: "Avenir", size: 24)!
        ]
        UINavigationBar.appearance().titleTextAttributes = attrs
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 6
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CategoryGridCell", for: indexPath) as! CategoryGridCell
        
        
        cell.CategoryView.image = UIImage(named: catImage[indexPath.row])
        cell.CategoryName.text = catNames[indexPath.row]
        print("hello")
        return cell
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
