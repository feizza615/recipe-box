//
//  CategoryViewController.swift
//  RecipeBox
//
//  Created by Feizza Fazilatun on 4/10/22.
//

import FirebaseDatabase
import UIKit
class CategoryViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, IngredientsTableViewControllerDelegate {
    var catDict:[String: Int]=[:]
    func ingredientsTableViewController(_ controller: IngredientsTableViewController, didFinishSelecting ingredientCount: [String: Int]) {
        navigationController?.popViewController(animated: true)
    //https://stackoverflow.com/questions/24051904/how-do-you-add-a-dictionary-of-items-into-another-dictionary
        ingredientCount.forEach { (k,v) in catDict[k] = v }
        print(catDict)
        collectionView.reloadData()
    }
    
    //MARK: Swift 5: Firebase Database in App - Setup/Read/Write Data Video
    private let database = Database.database().reference()
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var findButton: UIButton!
    @IBOutlet weak var ingredientCount: UILabel!
    var catArray=[CategoryModel]()


    override func viewDidLoad() {
        super.viewDidLoad()
       
        // Do any additional setup after loading the view.
        findButton.addTarget(self, action: #selector(findRecipes), for: .touchUpInside)
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
        let queue = DispatchQueue.global()
        queue.async {
            catRef.observe(.value, with: {snapshot in
                for child in snapshot.children{
                    if let childSnapshot = child as? DataSnapshot,
                        let dict = childSnapshot.value as? [String:Any] {
                        let name = dict["catName"] as? String
                        let image = dict["catImage"] as? String
                        let ingredientList = dict["ingredients"] as? [String]
                        let category = CategoryModel(categoryName: name, categoryImage: image, ingredients: ingredientList)
                        categories.append(category)
                    }
                }
                self.catArray = categories
                self.collectionView.reloadData()
                print(self.catArray.count)
            } )
            DispatchQueue.main.async {
                print("DONE")
              }
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        collectionView.reloadData()
         return catArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CategoryGridCell", for: indexPath) as! CategoryGridCell
        
        
        cell.CategoryView.image = UIImage(named: catArray[indexPath.row].categoryImage!)
        cell.CategoryName.text = catArray[indexPath.row].categoryName
        cell.IngredientCount.text = " \(catDict[catArray[indexPath.row].categoryName!] ?? 0) Ingredients"

        return cell
    }

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    //navigation controller
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        if(segue.identifier == "showIngredients"){
            let IngredientsView = segue.destination as! IngredientsTableViewController
            IngredientsView.info = sender as? CategoryModel
            IngredientsView.delegate = self
        }else if(segue.identifier == "showRecipes"){
            
            let RecipeResultsView = segue.destination as! RecipesTableViewController
            RecipeResultsView.info = (sender as? [CategoryModel])!
        }
    }
   
    
    //MARK: Sources for passing category info via segue
    //https://developer.apple.com/documentation/uikit/uiviewcontroller/1621413-performsegue
    //https://odenza.medium.com/how-to-pass-parameters-to-another-view-when-using-performsegue-in-swift-5-dd96832b412d
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let categoryInfo = catArray[indexPath.row]
        self.performSegue(withIdentifier: "showIngredients", sender: categoryInfo)
    }
    //https://www.zerotoappstore.com/set-action-listener-swift.html
   @objc func findRecipes() {
       self.performSegue(withIdentifier: "showRecipes", sender: catArray)
    }
    

}
