//
//  SignUpVC.swift
//  periodic.
//
//  Created by Anika Bagga on 11/3/18.
//  Copyright © 2018 Anika Bagga. All rights reserved.
//

import UIKit

class SignUpVC: UITabBarController {
    
    var signUpLabel: UILabel!
    var become: UIButton!
    var request: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let airPinkColor = UIColor(red: 255/255.0, green: 148/255.0, blue: 153/255.0, alpha: 1.0)
        let lightGreyColor = UIColor(red: 217/255, green: 220/255, blue: 216/255, alpha: 1.0)
        let darkGreyColor = UIColor(red: 99/255, green: 102/255, blue: 104/255, alpha: 1.0)
        let overcastBlueColor = UIColor(red: 15/255, green: 145/255, blue: 159/255, alpha: 1.0)
        view.backgroundColor = airPinkColor
        
        signUpLabel = UILabel(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: 200))
        signUpLabel.center = CGPoint(x: view.frame.width/2, y: view.frame.height/2 - 250)
        signUpLabel.textAlignment = .center
        signUpLabel.textColor = .white
        signUpLabel.adjustsFontSizeToFitWidth = true
        signUpLabel.font = UIFont(name:"Arial", size: 70.0)

        //signUpLabel.font = UIFont(name:"Raleway-SemiBold", size: 20.0)
        signUpLabel.text = "sign up"
        self.view.addSubview(signUpLabel)
        
        //BECOME UIBUTTON
        become = UIButton(frame: CGRect(x: 100, y: 100, width: view.frame.width - 100, height: 45))
        become.center = CGPoint(x: view.frame.width/4 * 3, y:  view.frame.height/2 + 150)
        become.setTitle("become \n a donar", for: UIControlState())
        
        become.titleLabel?.font =  .systemFont(ofSize: 30)
        
        become.backgroundColor = airPinkColor
        become.addTarget(self, action: #selector(becomeClicked), for: .touchUpInside)
        view.addSubview(become)
        
        //REQUEST UIBUTTON
        request = UIButton(frame: CGRect(x: 100, y: 100, width: view.frame.width - 100, height: 45))
        request.center = CGPoint(x: view.frame.width/4, y:  view.frame.height/2 + 150)
        request.setTitle("request \n a donar", for: .normal)
        request.layer.cornerRadius = 20
        
        request.titleLabel?.font =  .systemFont(ofSize: 30)
        
        request.backgroundColor = airPinkColor
        request.addTarget(self, action: #selector(requestClicked), for: .touchUpInside)
        view.addSubview(request)
    }
    
    @objc func becomeClicked() {
        performSegue(withIdentifier: "signUpDonator", sender: self)
       
    }
    @objc func requestClicked() {
        performSegue(withIdentifier: "signUpReciever", sender: self)
        
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
