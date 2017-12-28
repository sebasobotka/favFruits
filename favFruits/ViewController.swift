//
//  ViewController.swift
//  favFruits
//
//  Created by Sebastian Sobotka on 28/12/2017.
//  Copyright © 2017 Sebastian Sobotka. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var fruits = ["apple", "banana", "orange", "plum", "kiwi", "peach"]
    
    
    @IBOutlet weak var addButLbl: UIBarButtonItem!
    @IBOutlet weak var editButLbl: UIBarButtonItem!
    @IBOutlet weak var fruitsTable: UITableView!
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return fruits.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = fruitsTable.dequeueReusableCell(withIdentifier: "cell")
        cell?.textLabel?.text = fruits[indexPath.row]
        return cell!
    }
    
    
    func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        return true
        //only for some rows
        //let rowData = fruits[indexPath.row]
        //return rowData.hasPrefix("A")
    }

    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let movedObject = fruits[sourceIndexPath.row]
        fruits.remove(at: sourceIndexPath.row)
        fruits.insert(movedObject, at: destinationIndexPath.row)
    }
    
    /*
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCellEditingStyle {
        return .none
    }
    
    func tableView(_ tableView: UITableView, shouldIndentWhileEditingRowAt indexPath: IndexPath) -> Bool {
        return false
    }
    */

    @IBAction func addFruit(_ sender: Any) {
        //print("add fruit")
        fruits.append("apple" + String(arc4random_uniform(100)))
        fruitsTable.reloadData()
    }
    
    @IBAction func editFruit(_ sender: Any) {
        //print("edit fruits")
        fruitsTable.isEditing = !fruitsTable.isEditing
        editButLbl.title = fruitsTable.isEditing ? "Done" : "Edit"
    }

    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            
            fruits.remove(at: indexPath.row)
            fruitsTable.deleteRows(at: [indexPath], with: .fade)
            
            
            
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        print("start app")
       
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

