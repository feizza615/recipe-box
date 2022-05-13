//
//  DetailsTableViewController.swift
//  RecipeBox
//
//  Created by Feizza Fazilatun on 5/13/22.
//

import UIKit

class DetailsTableViewController: UITableViewController {
    let quoteCellReuseIdentifier = "DetailCell"
    let quotes = [
        "I always was a crybaby, wasn’t I",
        "Do not worry about me. Someone has to take care of these flowers.",
        "They were the one that wanted to... ...to use our full power. I was the one that resisted. And then, because of me, we... Well, that's why I ended up a flower",
        "But I can feel every other monster's as well. They all care about each other so much. And... they care about you too, Frisk. I wish I could tell you how everyone feels about you.",
        
        "As a flower, I was soulless. I lacked the power to love other people. However, with everyone's souls inside me... I not only have my own compassion back... But I can feel every other monster's as well.As a flower, I was soulless. I lacked the power to love other people. However, with everyone's souls inside me... I not only have my own compassion back... But I can feel every other monster's as well.As a flower, I was soulless. I lacked the power to love other people. However, with everyone's souls inside me... I not only have my own compassion back... But I can feel every other monster's as well."
    ]
    override func viewDidLoad() {
        super.viewDidLoad()
        let cellNib = UINib(nibName: "DetailCell", bundle: nil)
        tableView.register(cellNib, forCellReuseIdentifier: "DetailCell")
        self.tableView.rowHeight  = UITableView.automaticDimension
        self.tableView.estimatedRowHeight = 80
        self.tableView.dataSource = self
        self.tableView.delegate = self
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return quotes.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DetailCell", for: indexPath) as! DetailCell
        cell.DetailLabel.text = "Asriel"
        cell.DetailContent.text = quotes[indexPath.row]
        
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
