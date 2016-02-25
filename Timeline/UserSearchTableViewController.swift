//
//  UserSearchTableViewController.swift
//  Timeline
//
//  Created by Kaytee on 2/23/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import UIKit

class UserSearchTableViewController: UITableViewController, UISearchResultsUpdating {
    
    var searchController: UISearchController!
    
    @IBOutlet weak var modeSegmentedControl: UISegmentedControl!
    var usersDataSource: [User] = []
    
    enum ViewMode: Int {
        
        case Friends = 0
        case All = 1
        
        func users(completion: (users: [User]?) -> Void) {
            
            switch self {
            
            case .Friends: UserController.followedByUser(UserController.sharedController.currentUser, completion: { (users) -> Void in
                completion(users: users)
            })
                
            case .All: UserController.fetchAllUsers({ (users) -> Void in
                completion(users: users)
            })
                
            }
        }
    }
    
    var mode: ViewMode {
        
        get {
            return ViewMode(rawValue: modeSegmentedControl.selectedSegmentIndex)!
        }
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpSearchController()
        updateViewBasedOnMode()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return usersDataSource.count
    }
    
    func updateViewBasedOnMode() {
        
        mode.users { (users) -> Void in
            if let users = users {
                self.usersDataSource = users
            } else {
                self.usersDataSource = []
            }
            
            self.tableView.reloadData()
        }
    }

    @IBAction func selectedIndexChanged(sender: AnyObject) {
        
        updateViewBasedOnMode()
        
    }
    
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("userSearchTableCell", forIndexPath: indexPath)

        let user = usersDataSource[indexPath.row]
        cell.textLabel?.text = user.username

        return cell
    }
    
    func setUpSearchController() {
        
        let resultsViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("UserSearchResultsTableView")
        
        searchController = UISearchController(searchResultsController: resultsViewController)
        searchController.searchResultsUpdater = self
        searchController.searchBar.sizeToFit()
        searchController.hidesNavigationBarDuringPresentation = true
        
        tableView.tableHeaderView = searchController.searchBar
        
        definesPresentationContext = true

    }
    
    func updateSearchResultsForSearchController(searchController: UISearchController) {
        
        let searchTerm = searchController.searchBar.text ?? ""
        let lowercaseSearchTerm = searchTerm.lowercaseString
        
        if let resultsController = searchController.searchResultsController as? UserSearchResultsTableViewController {
            resultsController.usersResultsDataSource = usersDataSource.filter({$0.username.lowercaseString.containsString(lowercaseSearchTerm)})
            
            resultsController.tableView.reloadData()
        }
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
