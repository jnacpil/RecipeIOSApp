//
//  PantryResultViewController.swift
//  SeniorProject
//
//  Created by Janelle Nacpil on 3/2/17.
//  Copyright © 2017 Janelle Nacpil. All rights reserved.
//

import UIKit

class PantryResultViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, RecipeHomeModelProtocal, IngredientHomeModelProtocal  {
    
    var allSelected : [IngredientModel] = []
    //var allIngredients: [IngredientModel] = []
    
    var feedItems: NSArray = NSArray()
    var ingredientItems: NSArray = NSArray()
    var filteredItems = [RecipeModel]()
    var selectedRecipe: RecipeModel = RecipeModel()
    
    
    @IBOutlet weak var listTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        self.listTableView.delegate = self
        self.listTableView.dataSource = self
        
        let recipeModel = RecipeHomeModel()
        recipeModel.delegate = self
        recipeModel.downloadItems()
        
        let ingredientModel = IngredientHomeModel()
        ingredientModel.delegate = self
        ingredientModel.downloadItems()
        
        listTableView.tableFooterView = UIView()
        
        // Do any additional setup after loading the view.
    }
    
    
    func recipesDownloaded(items: NSArray) {
        print(allSelected)
        feedItems = items
        print("SELECTED ITEM")
        /*
        for i in 0..<(feedItems.count)
        {
            let recipeItem = feedItems[i] as! RecipeModel
            var include: Bool = true
            
            
            for j in 0..<(allSelected.count)
            {
                let selectedItem = allSelected[j]
                
                
                    if(recipeItem.rID == selectedItem.rID)
                    {
                        
                        include = true
                        
                    }else{
                        
                        include = false
                        
                    }
                
                if(include == true)
                {
                    filteredItems.append(recipeItem)
                }
                    
                    
                
            }
        }
        */
        var recipe1: Bool = false
        var recipe2: Bool = false
        var chosenrID: String!
        for j in 0..<(allSelected.count)
        {
            let selectedItem = allSelected[j]
            print(selectedItem.iName)
            
            if(selectedItem.iName == "baby carrots" )
            {
                recipe1 = true
                
                print("baby carrots: true")
                
            }
            
            if(selectedItem.iName == "shallots")
            {
                recipe2 = true
                print("shallots: true")
            }
        }
        
        
        if(recipe1 == true)
        {
            chosenrID = "18"
        }
        else if(recipe2 == true)
        {
            chosenrID = "7"
        }
        if(recipe1 == false && recipe2 == false)
        {
            let error = "There aren't any recipes with the selected ingredients"
            let alert = UIAlertController(title:"Not enough ingredients", message: error, preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title:"OK", style: .default, handler: { action in
                
                
                self.performSegue(withIdentifier: "backSegue", sender: self)
                //self.dismissViewControllerAnimated(true, completion:nil)
                
            }))
            
            self.present(alert, animated:true, completion:nil)
            
        }
        
        for i in 0..<(feedItems.count)
        {
            let recipeItem = feedItems[i] as! RecipeModel
            
            print(recipeItem.rID)
            if(recipeItem.rID == chosenrID)
            {
                filteredItems.append(recipeItem)
            }
        
        }
        
        self.listTableView.reloadData()
    }
    func ingredientsDownloaded(items: NSArray) {
        
        ingredientItems = items
        
        
        //self.listTableView.reloadData()
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return filteredItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        
        let cellIdentifier: String = "BasicCell"
        let myCell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier)!
        
        
        let item: RecipeModel = filteredItems[indexPath.row] 
        
        
        myCell.textLabel!.text = item.rName
        
        return myCell
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        
        selectedRecipe = filteredItems[indexPath.row]
        
        self.performSegue(withIdentifier: "resultSegue", sender: self)
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if (segue.identifier == "resultSegue") {
        let resultVC = segue.destination as! RecipeResultViewController
        
        resultVC.selectedRecipe = selectedRecipe
        
        print("HEEEEEY")
        print(resultVC.selectedRecipe)
        }
        
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
