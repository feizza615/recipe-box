//
//  DetailsTableViewController.swift
//  RecipeBox
//
//  Created by Feizza Fazilatun on 5/13/22.
//

import UIKit

class DetailsTableViewController: UITableViewController {
    var downloadTask: URLSessionDownloadTask?
    var recipeInfo: SearchResult!
    var summaryInfo: SummaryResult!
    let quoteCellReuseIdentifier = "DetailCell"
    let quotes = [
        "But I can feel every other monster's as well. They all care about each other so much. And... they care about you too, Frisk. I wish I could tell you how everyone feels about you.",
        
        "As a flower, I was soulless. I lacked the power to love other people. However, with everyone's souls inside me... I not only have my own compassion back... But I can feel every other monster's as well.As a flower, I was soulless. I lacked the power to love other people. However, with everyone's souls inside me... I not only have my own compassion back... But I can feel every other monster's as well.As a flower, I was soulless. I lacked the power to love other people. However, with everyone's souls inside me... I not only have my own compassion back... But I can feel every other monster's as well."
    ]
    override func viewDidLoad() {
        super.viewDidLoad()
        let imageCellNib = UINib(nibName: "DetailImageCell", bundle: nil)
        tableView.register(imageCellNib, forCellReuseIdentifier: "DetailImageCell")
        
        let cellNib = UINib(nibName: "DetailCell", bundle: nil)
        tableView.register(cellNib, forCellReuseIdentifier: "DetailCell")

        getSummary(recipeID: String(recipeInfo.id))
        self.tableView.rowHeight  = UITableView.automaticDimension
        self.tableView.estimatedRowHeight = 100
        self.tableView.dataSource = self
        self.tableView.delegate = self
    }

    func spoonacularURL(recipeID: String) -> URL {
      let urlString = String(
        format:"https://api.spoonacular.com/recipes/\(recipeID)/summary?apiKey=08927d2539f34cd380ec63a2d230e57e")
      let url = URL(string: urlString)
      return url!
    }
    func getSummary(recipeID:String){
        let url = spoonacularURL(recipeID: recipeID)
        print("URL: '\(url)'")
        if let data = performStoreRequest(with: url) {  // Modified
            summaryInfo = parse(data: data)               // New line
            print("Got summary: \(summaryInfo)")              // New line
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
    func parse(data: Data)->SummaryResult?{
        do {
            let searchResult: SummaryResult = try! JSONDecoder().decode(SummaryResult.self, from: data)
            return searchResult
          } catch {
            print("JSON Error: \(error)")
            return nil
          }
        
    }
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 2
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        if section == 0{
            return 1
        }
        return 1
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0{
            let cell = tableView.dequeueReusableCell(withIdentifier: "DetailImageCell", for: indexPath) as! DetailImageCell
            cell.DetailImage.image = UIImage(systemName: "square")
            if let imageURL = URL(string: recipeInfo.image) {
                downloadTask = cell.DetailImage.loadImage(url: imageURL)
            }
            cell.DetailTitle.text = recipeInfo.title
            
            return cell
        }
        let cell = tableView.dequeueReusableCell(withIdentifier: "DetailCell", for: indexPath) as! DetailCell
        cell.configureSummary(for: summaryInfo)
        
        return cell    }
    

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
