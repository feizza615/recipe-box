//
//  IngredientsTableViewController.swift
//  RecipeBox
//
//  Created by Feizza Fazilatun on 4/20/22.
//

import UIKit

//https://stackoverflow.com/questions/62989843/can-we-return-two-arrays-in-one-tableview-numberofrowsinsection-without-using-se

class IngredientsTableViewController: UITableViewController {
    
    var info: CategoryModel?
    var ingredients:[String] = []
    var yourIngredients:[String] = []
    

   
    override func viewDidLoad() {
        super.viewDidLoad()
        ingredients = info?.ingredients ?? []
        self.title = info?.categoryName
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 2
    }
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0{
            return "Ingredients"
        }
        return "Your Ingredients"
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0{
            return ingredients.count
        }
        return yourIngredients.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0{
            let cell = tableView.dequeueReusableCell(withIdentifier: "ingredientCell", for: indexPath)
            let label = cell.viewWithTag(200) as! UILabel
            label.text = ingredients[indexPath.row]
            
            return cell
        }
        let cell = tableView.dequeueReusableCell(withIdentifier: "yourIngredientCell", for: indexPath)
        let label = cell.viewWithTag(201) as! UILabel
        label.text = yourIngredients[indexPath.row]
        return cell
        
    }
    //https://letcreateanapp.com/2021/05/18/add-and-delete-cells-from-tableview-in-swift-5/
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("section: \(indexPath.section)")
              print("row: \(indexPath.row)")
        if indexPath.section == 0{
            let ingredient = ingredients[indexPath.row]
            ingredients.remove(at: indexPath.row)
            yourIngredients.insert(ingredient, at: 0)
            tableView.beginUpdates()
            tableView.deleteRows(at: [IndexPath(row: indexPath.row, section: 0)], with: .left)
            tableView.insertRows(at: [IndexPath(row: 0, section: 1)], with: .right)
            tableView.endUpdates()
            print(yourIngredients[0])
          
        }
        if indexPath.section == 1{
            let ingredient = yourIngredients[indexPath.row]
            yourIngredients.remove(at: indexPath.row)
            ingredients.insert(ingredient, at: 0)
            tableView.beginUpdates()
            tableView.deleteRows(at: [IndexPath(row: indexPath.row, section: 1)], with: .left)
            tableView.insertRows(at: [IndexPath(row: 0, section: 0)], with: .right)
            tableView.endUpdates()
          
        }
    }
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
