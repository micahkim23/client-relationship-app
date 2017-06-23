//
//  OrderTableViewController.swift
//  clientLook
//
//  Created by Cyrus Zhang on 6/22/17.
//  Copyright © 2017 HauteLook. All rights reserved.
//

import UIKit

extension UIImageView{
    
    func setImageFromURl(stringImageUrl url: String){
        
        if let url = NSURL(string: url) {
            if let data = NSData(contentsOf: url as URL) {
                self.image = UIImage(data: data as Data)
            }
        }
    }
}

class OrderTableViewController: UITableViewController {

    var orders = [Order]()
    
    func getOrderHistory(items: NSMutableArray){
        
    }
    
    func getClient(items: NSMutableArray) {}
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadOrders()
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }
    
    //MARK: Private Methods
    
    private func loadOrders() {
        let order1 = Order(orderID: 1, brand: "Hugo Boss", itemName: "T-shirt", orderTime: NSDate.init() , price: 120.99, assocName: "Alex")
        order1.image = UIImage(named:"t-shirt.jpg")
        let order2 = Order(orderID: 2, brand: "Chanel", itemName: "Handbag", orderTime: NSDate.init() , price: 2339.99, assocName: "Cindy")
        order2.image = UIImage(named:"handbag.jpg")
        let order3 = Order(orderID: 3, brand: "Vince", itemName: "dress", orderTime: NSDate.init() , price: 228.99, assocName: "Bob")
        order3.image = UIImage(named:"dress.jpg")
        let order4 = Order(orderID: 4, brand: "Nike", itemName: "Shoes", orderTime: NSDate.init() , price: 89.99, assocName: "Cindy")
        order4.image = UIImage(named:"shoes.png")
        
        orders += [order1, order2, order3, order4]
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
        
        
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return orders.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "OrderTableViewCell"

        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? OrderTableViewCell  else {
            fatalError("The dequeued cell is not an instance of OrderTableViewCell.")
        }
        
        let order = orders[indexPath.row]
        
        let imgURL = order.imageURL
        
        //cell.itemImage.setImageFromURl(stringImageUrl: imgURL!)
        cell.itemImage.image = order.image
        // Configure the cell...
        cell.itemName.text = order.itemName ?? ""
        cell.itemPrice.text = "$" + String(order.price ?? 0)
        cell.itemBrand.text = order.brand ?? ""
        cell.asscoName.text = order.assocName ?? ""
        cell.orderTime.text = order.orderTime!.toString(dateFormat: "yyyy-MM-dd, HH:mm:ss")
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
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
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
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
