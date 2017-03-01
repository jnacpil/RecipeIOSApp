//
//  RecipeResultViewController.swift
//  SeniorProject
//
//  Created by Janelle Nacpil on 2/14/17.
//  Copyright © 2017 Janelle Nacpil. All rights reserved.
//

import UIKit

class RecipeResultViewController: UIViewController {
    
    
    @IBOutlet weak var recipeTitle: UILabel!
    @IBOutlet weak var servingsLabel: UILabel!
    @IBOutlet weak var prepLabel: UILabel!
    @IBOutlet weak var cookLabel: UILabel!
    
    @IBOutlet weak var linkLabel: UILabel!
    
    var selectedRecipe : RecipeModel?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        recipeTitle.text = selectedRecipe?.rName
        servingsLabel.text = selectedRecipe?.rServings
        prepLabel.text = selectedRecipe?.rPreptime
        cookLabel.text = selectedRecipe?.rCooktime
        linkLabel.text = selectedRecipe?.rLink

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let resultVC = segue.destination as! PantryViewController
        
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
