//
//  MainViewController.swift
//  Test
//
//  Created by Netccentric on 28/3/17.
//  Copyright © 2017 ngo. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class MainViewController: UITableViewController
{
    var fullRefreshing = false
    var page = 3                    //current page number
    var movieData: [JSON]? = nil    //data list received from network
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        
        
        //attach refresh control
        enableRefreshControl()
        
        //load initial data
        loadData()
        
       
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func enableRefreshControl()
    {
        if(self.refreshControl != nil)
        {
            return
        }
        
        self.refreshControl = UIRefreshControl()
        self.refreshControl!.tintColor = UIColor.blue
        self.refreshControl!.addTarget(self, action: #selector(MainViewController.refresh(sender:)), for: UIControlEvents.valueChanged)
        self.tableView.addSubview(self.refreshControl!)
    }
    
    
    func refresh(sender:AnyObject)
    {
        self.fullRefreshing = true
        self.page = 1   //reset page to 1
        self.loadData()
    }
    
    
    func loadData()
    {
//        let parameters: Parameters = ["primary_release_date.lte":"2016-12-25", "sort_by":"release_date.desc", "page":String(self.page)]
//        
//        API.callMethod(method: "discover/movie", parameters: parameters, completionHandler:
//            {   (result) -> () in
//                
//                if(result != nil)
//                {
//                    
//                    let movies = JSON(result as Any)
//                    
//                    self.movieData = movies["results"].arrayValue
//                    
////                    for item in movies["results"].arrayValue
////                    {
////                        print(item["original_title"].stringValue)
////                        //                    print(item["overview"].stringValue)
////                        //                    print(item["poster_path"].stringValue)
////                    }
//                    
//                    
//                    //refresh data
//                    self.tableView.reloadData()
//                    
//                    //stop refresh animation
//                    self.refreshControl?.endRefreshing()
//                }
//        })
        
        
        
//        let parameters: Parameters = ["primary_release_date.lte":"2016-12-25", "sort_by":"release_date.desc", "page":String(self.page)]
        
        API.callMethod(method: "actors", parameters: ["page":String(self.page)], completionHandler:
            {   (result) -> () in
                
                if(result != nil)
                {
                    
                    let movies = JSON(result as Any)
                    
                    self.movieData = movies["data"].arrayValue
                    
                    //                    for item in movies["results"].arrayValue
                    //                    {
                    //                        print(item["original_title"].stringValue)
                    //                        //                    print(item["overview"].stringValue)
                    //                        //                    print(item["poster_path"].stringValue)
                    //                    }
                    
                    
                    //refresh data
                    self.tableView.reloadData()
                    
                    //stop refresh animation
                    self.refreshControl?.endRefreshing()
                }
        })
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        if let movieData = self.movieData
        {
            return movieData.count
        }
        else
        {
            return 0
        }
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        //get the cell
        let cell = tableView.dequeueReusableCell(withIdentifier: "TestCell", for: indexPath) as! TableViewCell

        //get the entry info
        let jsonData = movieData![indexPath.row].dictionaryValue
        
        // Configure the cell...
        cell.populateData(data: jsonData)

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
