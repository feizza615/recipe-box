//
//  CategoryViewController.swift
//  RecipeBox
//
//  Created by Feizza Fazilatun on 4/10/22.
//

import FirebaseDatabase
import UIKit

class CategoryViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    //MARK: Swift 5: Firebase Database in App - Setup/Read/Write Data Video
    private let database = Database.database().reference()
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var catArray=[CategoryModel]()
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
        observeCategory()
    }
    
    
    func observeCategory(){
        let catRef = database.child("categories")
        var categories = [CategoryModel]()
        catRef.observe(.value, with: {snapshot in
            for child in snapshot.children{
                if let childSnapshot = child as? DataSnapshot,
                    let dict = childSnapshot.value as? [String:Any] {
                    let name = dict["catName"] as? String
                    let image = dict["catImage"] as? String
                    let category = CategoryModel(categoryName: name, categoryImage: image)
                    categories.append(category)
                   // self.catArray.append(category)
                }else{
                    print("hi")
                }
                                //print(self.catArray.count)
            }
        } )
        self.catArray = categories
        collectionView.reloadData()
     
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        collectionView.reloadData()
         return catArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CategoryGridCell", for: indexPath) as! CategoryGridCell
        
        
        cell.CategoryView.image = UIImage(named: catImage[indexPath.row])
        //cell.CategoryName.text = catArray[indexPath.row].categoryName
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
