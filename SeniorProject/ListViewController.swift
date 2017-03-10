//
//  PantryViewController.swift
//  SeniorProject
//
//  Created by Janelle Nacpil on 2/9/17.
//  Copyright © 2017 Janelle Nacpil. All rights reserved.
//

import UIKit

class ListViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, IngredientHomeModelProtocal {
    
    var feedItems: NSArray = NSArray()
    //var selectedIngredient: IngredientModel = IngredientModel()
    var selectedRecipeID: String?
    var filteredItems = [IngredientModel]()
    //var allrecipes = [IngredientModel]()
    
    
    
    
    
    @IBOutlet weak var listTableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        print(selectedRecipeID)
        
        self.listTableView.delegate = self
        self.listTableView.dataSource = self
        
        let ingredientModel = IngredientHomeModel()
        ingredientModel.delegate = self
        ingredientModel.downloadItems()
        
        listTableView.tableFooterView = UIView()

        // Do any additional setup after loading the view.
    }
    
    
    func ingredientsDownloaded(items: NSArray) {
        feedItems = items
        
        
        
        for i in 0..<(feedItems.count)
        {
            var filter: Bool = true
            let itemtofilter = feedItems[i] as! IngredientModel
            print("feedItem")
            print(feedItems[i])

            
            while(filter == true){
                
                var passedfilter: Bool = false
                
                if(selectedRecipeID == itemtofilter.rID)
                {
                    //print(itemtofilter)
                    passedfilter = true
                    
                }
               
                print(passedfilter, filter)
                if(passedfilter == true)
                {
                    
                    filteredItems.append(itemtofilter)
                    
                    filter = false
                }else
                {
                    filter = false
                }
            }
            
        }
        print(filteredItems)
        self.listTableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return filteredItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        
        let cellIdentifier: String = "BasicCell"
        let myCell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier)!
        
        let item: IngredientModel = filteredItems[indexPath.row] 
        
        
        myCell.textLabel!.text = item.iName
        
        return myCell
    }
    
    /*func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        
        selectedIngredient = feedItems[indexPath.row]as! IngredientModel
        
        self.performSegue(withIdentifier: "detailSegue", sender: self)
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let detailVC = segue.destination as! DetailViewController
        
        detailVC.selectedIngredient = selectedIngredient
        
        print("HEEEEEY")
        print(detailVC.selectedIngredient)
        
        
    }*/
    

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
