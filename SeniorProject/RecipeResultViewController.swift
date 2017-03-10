//
//  RecipeResultViewController.swift
//  SeniorProject
//
//  Created by Janelle Nacpil on 2/14/17.
//  Copyright © 2017 Janelle Nacpil. All rights reserved.
//

import UIKit

class RecipeResultViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, IngredientHomeModelProtocal {
    
    
    @IBOutlet weak var recipeTitle: UILabel!
    @IBOutlet weak var servingsLabel: UILabel!
    @IBOutlet weak var prepLabel: UILabel!
    @IBOutlet weak var cookLabel: UILabel!
    @IBOutlet weak var linkLabel: UILabel!
    @IBOutlet weak var detailTable: UITableView!
    
    
    var feedItems: NSArray = NSArray()
    var filteredItems = [IngredientModel]()
    
    var selectedRecipe : RecipeModel?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        recipeTitle.text = selectedRecipe?.rName
        servingsLabel.text = selectedRecipe?.rServings
        prepLabel.text = selectedRecipe?.rPreptime
        cookLabel.text = selectedRecipe?.rCooktime
        linkLabel.text = selectedRecipe?.rLink

        
        self.detailTable.delegate = self
        self.detailTable.dataSource = self
        
        let ingredientModel = IngredientHomeModel()
        ingredientModel.delegate = self
        ingredientModel.downloadItems()
        
        detailTable.tableFooterView = UIView()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
                
                if(selectedRecipe?.rID == itemtofilter.rID)
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
        self.detailTable.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return filteredItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        
        let cellIdentifier: String = "BasicCell"
        //let myCell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier)!
        let myCell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! CustomTableViewCell
        
        let item: IngredientModel = filteredItems[indexPath.row]
        
        
        //myCell.textLabel!.text = item.iName
        
        myCell.nameRLabel.text = item.iName
        myCell.amountRLabel.text = item.amount
        myCell.unitRLabel.text = item.uName
        
        myCell.showResult(recipeAmount: item.amount!, uName: item.uName!)
        
        return myCell
    }

    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let resultVC = segue.destination as! ListViewController
        
        resultVC.selectedRecipeID = selectedRecipe?.rID
        
        print("HEEEEEY")
        print(resultVC.selectedRecipeID)
        
        
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
