//
//  SearchPantryViewController.swift
//  SeniorProject
//
//  Created by Janelle Nacpil on 2/28/17.
//  Copyright © 2017 Janelle Nacpil. All rights reserved.
//

import UIKit

class SearchPantryViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, IngredientHomeModelProtocal  {
    
    
    var feedItems: NSArray = NSArray()
    var selectedIngredient: IngredientModel = IngredientModel()
    var allSelected = [IngredientModel]()
    var compareArray = [IngredientModel]()
    
    @IBOutlet weak var listTableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        listTableView.rowHeight = 55
        
        self.listTableView.delegate = self
        self.listTableView.dataSource = self
        
        let ingredientModel = IngredientHomeModel()
        ingredientModel.delegate = self
        ingredientModel.downloadItems()
        
        listTableView.tableFooterView = UIView()
    }
    
    
    
    func ingredientsDownloaded(items: NSArray) {
        feedItems = items
        let compare: NSMutableArray = NSMutableArray()
        
        for i in 0..<(feedItems.count)
        {
            var filter: Bool = true
            let itemtofilter = feedItems[i] as! IngredientModel
            print("feedItem")
            print(feedItems[i])
            
            
            while(filter == true)
            {
                
                //var passedfilter: Bool = false
                
                let intAvail: Int = Int(itemtofilter.availAmount!)!
                
                
                if(intAvail != 0)
                {
                    
                    if (compare.contains(itemtofilter.iID!))
                    {
                        filter = false
                    }
                    else
                    {
                        compare.add(itemtofilter.iID!)
                        compareArray.append(itemtofilter)
                        filter = false
                    }
                    
                }else
                {
                    filter = false
                }
                
            }
            
            
        }
        print(compare)
        print(compareArray)
        self.listTableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return compareArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        
        let cellIdentifier: String = "BasicCell"
        let myCell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! CustomTableViewCell
        
        
        let item: IngredientModel = compareArray[indexPath.row] 
        
        
        myCell.nameLabel.text = item.iName
        myCell.avaiLabel.text = item.availAmount
        myCell.unitLabel.text = item.uName
        
        myCell.show(availAmount: item.availAmount!, uName: item.uName!)
        
        return myCell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        let selectedCell: UITableViewCell = tableView.cellForRow(at: indexPath)!
        selectedCell.contentView.backgroundColor = UIColor(red: 0.5, green: 0.5, blue: 0.5, alpha: 1.0)
        
        selectedIngredient = feedItems[indexPath.row]as! IngredientModel
        allSelected.append(selectedIngredient)
        
        
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "segueSearch") {
        let resultVC = segue.destination as! PantryResultViewController
        
        resultVC.allSelected = allSelected
        
        print(allSelected)
        print("HEEEEEY")
        
        }
        
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

