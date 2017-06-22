//
//  ClientTableViewController.swift
//  clientLook
//
//  Created by Cyrus Zhang on 6/20/17.
//  Copyright © 2017 HauteLook. All rights reserved.
//

import UIKit
import os.log

class ClientTableViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, ClientModelProtocol {

    @IBOutlet var clientTableView: UITableView!
    var clients: NSMutableArray = NSMutableArray()
    
    //MARK: Actions
    
    @IBAction func unwindToClientList(sender: UIStoryboardSegue) {
        if let sourceViewController = sender.source as? AddClientViewController, let client = sourceViewController.client {
            
            // Add a new client
            let newIndexPath = IndexPath(row: clients.count, section: 0)
            
            clients.add(client)
            clientTableView.insertRows(at: [newIndexPath], with: .automatic)
        }
        
        if let sourceViewController = sender.source as? ClientDetailViewController, let client = sourceViewController.client {
            
            if let selectedIndexPath = clientTableView.indexPathForSelectedRow {
                // Update an existing meal.
                clients.replaceObject(at: selectedIndexPath.row, with: client)
                clientTableView.reloadRows(at: [selectedIndexPath], with: .none)
            }
        }
    }
    
    
    //MARK: Private Methods
    
    private func loadClients() {
        
        //should load from DB
        let client1 = Client(name: "Alex", phone: "123", email: "1@d.com", birthday: NSDate.init(), clientID: 1)
        let client2 = Client(name: "Bob", phone: "1234", email: "2@d.com", birthday: NSDate.init(), clientID: 2)
        let client3 = Client(name: "Cindy", phone: "12345", email: "3@d.com", birthday: NSDate.init(), clientID: 3)
        
        clients.addObjects(from: [client1, client2, client3])
        
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.leftBarButtonItem = editButtonItem
        
        clientTableView.delegate = self
        clientTableView.dataSource = self
        
        let clientModel = ClientModel()
        clientModel.delegate = self
        
        loadClients()
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    func itemsDownloaded(items : NSMutableArray) {
        
        self.clients = items
        self.clientTableView.reloadData()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return clients.count
    }

    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "ClientTableViewCell"
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? ClientTableViewCell  else {
            fatalError("The dequeued cell is not an instance of MealTableViewCell.")
        }
        
        let client = clients[indexPath.row]
        
        

        // Configure the cell...
        cell.clientName.text = (client as! Client).name
        
        return cell
    }
    

    
    // Override to support conditional editing of the table view.
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    

    
    // Override to support editing the table view.
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            clients.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    

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

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        switch(segue.identifier ?? "") {
            case "addClient":
                os_log("Adding a new client.", log: OSLog.default, type: .debug)
            
            case "showClientDetail":
                guard let clientDetailViewController = segue.destination as? ClientDetailViewController else {
                    fatalError("Unexpected destination: \(segue.destination)")
                }
                
                guard let selectedClientCell = sender as? ClientTableViewCell else {
                    fatalError("Unexpected sender: \(sender)")
                }
                
                guard let indexPath = clientTableView.indexPath(for: selectedClientCell) else {
                    fatalError("The selected cell is not being displayed by the table")
                }
                
                let selectedClient = clients[indexPath.row]
                clientDetailViewController.client = selectedClient as! Client
            default:
                fatalError("Unexpected Segue Identifier; \(segue.identifier)")
        }
        
    }
    

}
