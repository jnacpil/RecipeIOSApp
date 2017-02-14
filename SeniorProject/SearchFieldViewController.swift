//
//  SearchFieldViewController.swift
//  SeniorProject
//
//  Created by Janelle Nacpil on 2/12/17.
//  Copyright © 2017 Janelle Nacpil. All rights reserved.
//

import UIKit

class SearchFieldViewController: UIViewController {
    @IBOutlet weak var PrepTimeTF: UITextField!
    @IBOutlet weak var CookTimeTF: UITextField!
    @IBOutlet weak var IngredientTF: UITextField!
    @IBOutlet weak var EntreeTF: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "segueSearch") {
            let svc = segue.destination as! FieldsResultViewController;
            
            svc.passedPrepTime = PrepTimeTF.text
            svc.passedCookTime = CookTimeTF.text
            svc.passedIngredient = IngredientTF.text
            svc.passedEntree = EntreeTF.text
           
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
