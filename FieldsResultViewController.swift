//
//  FieldsResultViewController.swift
//  SeniorProject
//
//  Created by Janelle Nacpil on 2/12/17.
//  Copyright © 2017 Janelle Nacpil. All rights reserved.
//

import UIKit

class FieldsResultViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, RecipeHomeModelProtocal {
    
    var passedPrepTime: String!
    var passedCookTime: String!
    var passedEntree: String!
    
    var feedItems: NSArray = NSArray()
    //var filteredItems: NSMutableArray = NSMutableArray()
    var filteredItems = [RecipeModel]()
    var selectedRecipe: RecipeModel = RecipeModel()
    
    @IBOutlet weak var listTableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        /*let prepTime: Int! = passedPrepTime
         let cookTime: Int! = passedCookTime
         let ingredient: String! = passedIngredient
         let entree: String! = passedEntree
         */
        
        
        self.listTableView.delegate = self
        self.listTableView.dataSource = self
        
        let recipeModel = RecipeHomeModel()
        recipeModel.delegate = self
        recipeModel.downloadItems()
        
        //listTableView.tableFooterView = UIView()
        // Do any additional setup after loading the view.
    }
    
    func recipesDownloaded(items: NSArray) {
        feedItems = items
        print("PASSSED ENTREE")
        print(passedEntree)
        
        
        for i in 0..<(feedItems.count)
        {
            var filter: Bool = true
            //let itemtofilter: RecipeModel = feedItems[i] as! RecipeModel
            let itemtofilter = feedItems[i] as! RecipeModel
            print("feedItem")
            print(feedItems[i])
            //let rName = itemtofilter.rName!
            //print(rName)
            
            
            while(filter == true)
            {
                
                var passedfilter: Bool = false
                
                if(passedPrepTime != "")
                {
                    //print(itemtofilter)
                    
                    
                    if(passedPrepTime == itemtofilter.rPreptime)
                    {
                        print("passedPrepTime: true")
                        passedfilter = true
                    }else{
                        
                        print("passedPrepTime: false")
                        passedfilter = false
                        filter = false
                    }
                    //print(passedfilter, filter)
                }
                if(passedCookTime != "")
                {
                    
                    if(passedCookTime == itemtofilter.rCooktime)
                    {
                        print("passedCookTime: true")
                        passedfilter = true
                    }else
                    {
                        print("passedCookTime: false")
                        passedfilter = false
                        filter = false
                    }
                    //print("Cooktime", passedfilter, filter)
                }
                if(passedEntree != "")
                {
                    let filterName: String = (itemtofilter.rName)!.lowercased()
                
                    
                    if((filterName.range(of: passedEntree!)) != nil)
                    {
                        print("passedEntree: true")
                        passedfilter = true
                    }else
                    {
                        print("passedEntree: false")
                        passedfilter = false
                        filter = false
                    }
                    
                    //print("Entree", passedfilter, filter)
                }
                print(passedfilter, filter)
                if(passedfilter == true && filter == true)
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
        print("count", filteredItems.count)
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
    
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        
        selectedRecipe = filteredItems[indexPath.row]
        
        self.performSegue(withIdentifier: "resultSegue", sender: self)
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let resultVC = segue.destination as! RecipeResultViewController
        
        resultVC.selectedRecipe = selectedRecipe
        
        print("HEEEEEY")
        print(resultVC.selectedRecipe)
        
        
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
