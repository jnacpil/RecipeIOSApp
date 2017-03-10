//
//  CustomTableViewCell.swift
//  SeniorProject
//
//  Created by Janelle Nacpil on 3/1/17.
//  Copyright © 2017 Janelle Nacpil. All rights reserved.
//

import UIKit

class CustomTableViewCell: UITableViewCell {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var avaiLabel: UILabel!
    @IBOutlet weak var unitLabel: UILabel!
    
    @IBOutlet weak var nameRLabel: UILabel!
    @IBOutlet weak var amountRLabel: UILabel!
    @IBOutlet weak var unitRLabel: UILabel!
    
    let tbspEqui = 3
    let cupEqui = 48
    let quEqui = 4 * 48
    let galEqui = 4 * 4 * 48
    let flOzEqui = 8
    let lbEqui = 16
    
    func show(availAmount: String, uName: String)
    {
        
     print(availAmount, uName)
        let avail: Int = Int(availAmount)!
        if (avail >= 3) && (uName == "tsp")
        {
            
            if(avail%galEqui == 0)
            {
                avaiLabel.text = String(avail / galEqui)
                unitLabel.text = "gallon(s)"
            }
            else if(avail%quEqui == 0)
            {
                avaiLabel.text = String(avail/quEqui)
                unitLabel.text = "quart(s)"
            }else if(avail%cupEqui == 0)
            {
                avaiLabel.text = String(avail/cupEqui)
                unitLabel.text = "cup(s)"
            }else if(avail%tbspEqui == 0)
            {
                avaiLabel.text = String(avail/tbspEqui)
                unitLabel.text = "tbsp(s)"
            }else{
                avaiLabel.text = availAmount
            }
            
        }
        
    }

    func showResult(recipeAmount: String, uName: String)
    {
        
        print(recipeAmount, uName)
        let avail: Double = Double(recipeAmount)!
        if (avail >= 3) && (uName == "tsp")
        {
            let avail: Int = Int(recipeAmount)!
            
            if(avail%galEqui == 0)
            {
                amountRLabel.text = String(avail / galEqui)
                unitRLabel.text = "gallon(s)"
            }
            else if(avail%quEqui == 0)
            {
                amountRLabel.text = String(avail/quEqui)
                unitRLabel.text = "quart(s)"
            }else if(avail%cupEqui == 0)
            {
                amountRLabel.text = String(avail/cupEqui)
                unitRLabel.text = "cup(s)"
            }else if(avail%tbspEqui == 0)
            {
                amountRLabel.text = String(avail/tbspEqui)
                unitRLabel.text = "tbsp(s)"
            }else{
                amountRLabel.text = recipeAmount
            }
            
        }
        
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
