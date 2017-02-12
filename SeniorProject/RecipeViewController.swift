//
//  RecipeViewController.swift
//  SeniorProject
//
//  Created by Janelle Nacpil on 2/9/17.
//  Copyright © 2017 Janelle Nacpil. All rights reserved.
//

import UIKit

class RecipeViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, RecipeHomeModelProtocal {
    
    
    var feedItems: NSArray = NSArray()
    var selectedIngredient: RecipeModel = RecipeModel()
    @IBOutlet weak var listTableView: UITableView!
    
  
    

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.listTableView.delegate = self
        self.listTableView.dataSource = self
        
        let recipeModel = RecipeHomeModel()
        recipeModel.delegate = self
        recipeModel.downloadItems()
        
        listTableView.tableFooterView = UIView()
        
        // Do any additional setup after loading the view.
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
        
        
        let item: RecipeModel = feedItems[indexPath.row] as! RecipeModel
        
        
        myCell.textLabel!.text = item.rName
        
        return myCell
    }
    

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */

}
