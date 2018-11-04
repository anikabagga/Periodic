//
//  NewRequestVC.swift
//  periodic.
//
//  Created by Anika Bagga on 11/4/18.
//  Copyright © 2018 Anika Bagga. All rights reserved.
//

import UIKit
import SkyFloatingLabelTextField

class NewRequestVC: UITabBarController {
    
    var firstBlock: UIView!
    var name: SkyFloatingLabelTextField!
    var aboutYou: SkyFloatingLabelTextField!
    
    var secondBlock: UIView!
    var instructions: UILabel!
    var choice1: UILabel!
    var choice2: UILabel!
    var choice3: UILabel!
    
    let airPinkColor = UIColor(red: 255/255.0, green: 148/255.0, blue: 153/255.0, alpha: 1.0)
    let lightGreyColor = UIColor(red: 217/255, green: 220/255, blue: 216/255, alpha: 1.0)

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = airPinkColor
        
        setUpFirstBlock()
        setUpSecondBlock()
    }
    
    func setUpFirstBlock(){
        
        firstBlock = UIView(frame: CGRect(x: 15, y: 85, width: view.frame.width - 30, height: 130))
        firstBlock.backgroundColor = .white
        firstBlock.layer.cornerRadius = 10
        view.addSubview(firstBlock)
        
        name = SkyFloatingLabelTextField(frame: CGRect(x: 0, y: 0, width: view.frame.width * 0.8, height: 40.00));
        name.center = CGPoint(x: view.frame.width / 2, y:  view.frame.height/2 )
        name.placeholder = "Name"
        name.keyboardType = UIKeyboardType.default
        name.textColor = UIColor.black
        name.tintColor = airPinkColor  // the color of the blinking cursor
        name.textColor = airPinkColor
        name.lineColor = airPinkColor
        name.selectedTitleColor = airPinkColor
        name.selectedLineColor = airPinkColor
        name.lineHeight = 2.0
        name.selectedLineHeight = 3.0
        self.view.addSubview(name)
        
        aboutYou = SkyFloatingLabelTextField(frame: CGRect(x: 0, y: 0, width: view.frame.width * 0.8, height: 40.00));
        aboutYou.center = CGPoint(x: view.frame.width / 2, y:  view.frame.height/2 )
        aboutYou.placeholder = "About You"
        aboutYou.keyboardType = UIKeyboardType.default
        aboutYou.textColor = UIColor.black
        aboutYou.tintColor = airPinkColor  // the color of the blinking cursor
        aboutYou.textColor = airPinkColor
        aboutYou.lineColor = airPinkColor
        aboutYou.selectedTitleColor = airPinkColor
        aboutYou.selectedLineColor = airPinkColor
        aboutYou.lineHeight = 2.0
        aboutYou.selectedLineHeight = 3.0
        self.view.addSubview(aboutYou)
    }
    
    func setUpSecondBlock(){
        secondBlock = UIView(frame: CGRect(x: 15, y: 240, width: view.frame.width - 30, height: 200))
        secondBlock.backgroundColor = .white
        secondBlock.layer.cornerRadius = 10
        view.addSubview(secondBlock)
        
        
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
