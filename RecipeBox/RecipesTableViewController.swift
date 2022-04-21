//
//  RecipesTableViewController.swift
//  RecipeBox
//
//  Created by Feizza Fazilatun on 4/20/22.
//

import UIKit

class RecipesTableViewController: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        sendIngredients()
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    // MARK: - Creates URL
    func spoonacularURL(ingredientText: String) -> URL {
        let encodedText = ingredientText.addingPercentEncoding(
            withAllowedCharacters: CharacterSet.urlQueryAllowed)!
      let urlString = String(
        format: "https://api.spoonacular.com/recipes/findByIngredients?apiKey=08927d2539f34cd380ec63a2d230e57e&ignorePantry=true&number=1&ingredients=%@",encodedText)
      let url = URL(string: urlString)
      return url!
    }
    
    func sendIngredients(){
        let url = spoonacularURL(ingredientText: "apple,+sugar,+flour,+sour cream")
        print("URL: '\(url)'")
        if let jsonString = performStoreRequest(with: url) {
          print("Received JSON string '\(jsonString)'")
        }
    }
    
    func performStoreRequest(with url: URL) -> String? {
      do {
       return try String(contentsOf: url, encoding: .utf8)
      } catch {
       print("Download Error: \(error.localizedDescription)")
       return nil
      }
    }


    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 3
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "recipeCell", for: indexPath)
        print("Hello")
        return cell
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
