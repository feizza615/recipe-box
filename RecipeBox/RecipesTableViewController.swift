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
        
        let cellNib = UINib(nibName: "RecipeResultCell", bundle: nil)
        tableView.register(cellNib, forCellReuseIdentifier: "RecipeResultCell")
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
        format: "https://api.spoonacular.com/recipes/findByIngredients?apiKey=08927d2539f34cd380ec63a2d230e57e&ignorePantry=true&ranking=2&number=5&ingredients=%@",encodedText)
      let url = URL(string: urlString)
      return url!
    }
    
    func sendIngredients(){
        let url = spoonacularURL(ingredientText: "apple,+sugar,+flour,+sour cream")
        print("URL: '\(url)'")
        if let data = performStoreRequest(with: url) {  // Modified
             let results = parse(data: data)               // New line
            print("Got results: \(results)")              // New line
           }
           tableView.reloadData()
    }
    
    func performStoreRequest(with url: URL) -> Data? {
      do {
       return try Data(contentsOf: url)
      } catch {
       print("Download Error: \(error.localizedDescription)")
       return nil
      }
    }
    func parse(data: Data)->[SearchResult]{
        do {
            let searchResult: [SearchResult] = try! JSONDecoder().decode([SearchResult].self, from: data)
            return searchResult
          } catch {
            print("JSON Error: \(error)")
            return []
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
        let cellIdentifier = "RecipeResultCell"

        let cell = tableView.dequeueReusableCell(
            withIdentifier: cellIdentifier,
            for: indexPath) as! RecipeResultCell
//        if cell == nil {
//          cell = UITableViewCell(
//            style: .subtitle, reuseIdentifier: cellIdentifier)
//        }

        print("Hello")
        return cell
    }
    
    //MARK: Next two functions (to add space between rows) came from here:
    //https://andrew-lundy.medium.com/adding-space-between-the-cells-of-a-uitableview-590a0cfd2e22
    
//    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
//        let headerView = UIView()
//        headerView.backgroundColor = view.backgroundColor
//        return headerView
//    }
//    
//    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
//        return 5
//    }
//   
//    

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

