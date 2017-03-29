//
//  DetailViewController.swift
//  Test
//
//  Created by Patrick Ngo on 29/3/17.
//  Copyright © 2017 ngo. All rights reserved.
//

import UIKit
import SwiftyJSON

class DetailViewController: UITableViewController
{
    var actorData: [String:JSON]? = nil
    var actorMovies: [JSON] = []
    
    override func viewDidLoad()
    {
        super.viewDidLoad()

        //load initial data
        loadData()
    }
    
    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    func loadData()
    {
        //get list of movies
        actorMovies = (self.actorData?["known_for"]!.arrayValue)!
    }

    
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int
    {
        return 2
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        //actor info
        if section == 0
        {
            return 1
        }
        //known for movies
        else
        {
            return actorMovies.count
        }
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        if section == 1
        {
            return "Filmography"
        }
        else
        {
            return nil
        }
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        //regular cells
        if indexPath.section == 0
        {
            //get the cell
            let cell = tableView.dequeueReusableCell(withIdentifier: "TestCell", for: indexPath) as! TableViewCell
            
            //get the entry info
            let jsonData = actorData
            
            // Configure the cell...
            cell.populateData(data: jsonData!)
            
            return cell
        }
            
        //movie cells
        else
        {
            let cell = tableView.dequeueReusableCell(withIdentifier: "MovieCell", for: indexPath) as! MovieCell
            cell.populateData(data: actorMovies[indexPath.row].dictionaryValue)
            return cell
        }
    }
}
