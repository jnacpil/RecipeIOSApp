//
//  ViewController.swift
//  SeniorProject
//
//  Created by Janelle Nacpil on 1/26/17.
//  Copyright © 2017 Janelle Nacpil. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, HomeModelProtocal {

    
    var feedItems: NSArray = NSArray()
    var selectedLocation: LocationModel = LocationModel()
    
    @IBOutlet weak var listTableView: UITableView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.listTableView.delegate = self
        self.listTableView.dataSource = self
        
        let homeModel = HomeModel()
        homeModel.delegate = self
        homeModel.downloadItems()
        
        listTableView.tableFooterView = UIView()
    
    }
    
    func itemsDownloaded(items: NSArray) {
        feedItems = items
        self.listTableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return feedItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        
        let cellIdentifier: String = "BasicCell"
        let myCell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier)!
        
        
        let item: LocationModel = feedItems[indexPath.row] as! LocationModel
        
        
        myCell.textLabel!.text = item.mName
        
        return myCell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        
        selectedLocation = feedItems[indexPath.row]as! LocationModel
        
        self.performSegue(withIdentifier: "detailSegue", sender: self)
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let detailVC = segue.destination as! DetailViewController
        
        detailVC.selectedLocation = selectedLocation
        
        print("HEEEEEY")
        print(detailVC.selectedLocation)
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

