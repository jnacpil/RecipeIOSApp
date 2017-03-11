//
//  CreateRecipeViewController.swift
//  SeniorProject
//
//  Created by Janelle Nacpil on 3/6/17.
//  Copyright © 2017 Janelle Nacpil. All rights reserved.
//

import UIKit

class CreateRecipeViewController: UIViewController{
    
    @IBOutlet weak var fieldName: UITextField!
    @IBOutlet weak var fieldPrep: UITextField!
    @IBOutlet weak var fieldCook: UITextField!
    @IBOutlet weak var fieldServings: UITextField!
    @IBOutlet weak var fieldDirections: UITextView!
    
    var createdRecipe = RecipeModel()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func submitButton(_ sender: AnyObject) {
        
        if (fieldName.text == "" || fieldPrep.text == "" || fieldCook.text == "" || fieldServings.text == "")
        {
            let error = "Please complete all fields"
            let alert = UIAlertController(title:"Error In Form", message: error, preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title:"OK", style: .default, handler: { action in
                
                //self.dismissViewControllerAnimated(true, completion:nil)
                
            }))
            
            self.present(alert, animated:true, completion:nil)
            
        }else{
            
            print("creating")
            createdRecipe.rName = fieldName.text
            createdRecipe.rPreptime = fieldPrep.text
            createdRecipe.rCooktime = fieldCook.text
            createdRecipe.rServings = fieldServings.text
            createdRecipe.rDirections = fieldDirections.text
            createdRecipe.rCategory = "4"
            
            //let recipeModel = CreateModel()
            //recipeModel.delegate = self
            
            //recipeModel.createRecipe(createdRecipe, "http://jnacpil.create.stedwards.edu/recipes.php")
            
            
            
            let requestURL = NSURL(string: "http://jnacpil.create.stedwards.edu/createRecipes.php")
            //creating NSMutableURLRequest
            let request = NSMutableURLRequest(url: requestURL! as URL)
            //setting the method to post
            request.httpMethod = "POST"
            
            //getting values from text fields
            
            let name = createdRecipe.rName!
            let preptime = Int(createdRecipe.rPreptime!)!
            let cooktime = Int(createdRecipe.rCooktime!)!
            let servings = Int(createdRecipe.rServings!)!
            let directions = createdRecipe.rDirections!
            let category = Int(createdRecipe.rCategory!)!
            
            
            print(name, preptime, cooktime, servings, directions, category)
            
            //creating the post parameter by concatenating the keys and values from text field
            
            let postParameters = "rName='\(name)'&rPreptime=\(preptime)&rCooktime=\(cooktime)&rServings=\(servings)&rDirections='\(directions)'&rCategory=\(category)"
            print(postParameters)
            
            
            //adding the parameters to request body
            request.httpBody = postParameters.data(using: String.Encoding.utf8)
            //creating a task to send the post request
            let task = URLSession.shared.dataTask(with: request as URLRequest) {
                data, response, error in
                if error != nil{
                    print("error is \(error)")
                    return;
                }
                else
                {
                    print("NO ERROR")
                }
                //parsing the response
                do {
                    //converting resonse to NSDictionary
                    let myJSON =  try JSONSerialization.jsonObject(with: data!, options: .mutableContainers) as? NSDictionary
                    //parsing the json
                    if let parseJSON = myJSON {
                        //creating a string
                        var msg : String
                        
                    }
                } catch {
                    print("ERROOOOOR")
                    print(error)
                }
            }
            //executing the task
            task.resume()
         
            
            let error = "Your recipe has successfully downloaded"
            let alert = UIAlertController(title:"Recipe Created", message: error, preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title:"OK", style: .default, handler: { action in
                
                self.performSegue(withIdentifier: "endSegue", sender: self)
                
                
                //self.dismissViewControllerAnimated(true, completion:nil)
                
            }))
            
            self.present(alert, animated:true, completion:nil)
        }
        
        
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "addSegue") {
        let resultVC = segue.destination as! AddIngredientsViewController
        
        resultVC.sentRecipeName = createdRecipe.rName
        
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
