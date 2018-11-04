//
//  SignUpDonatorVC.swift
//  periodic.
//
//  Created by Anika Bagga on 11/3/18.
//  Copyright © 2018 Anika Bagga. All rights reserved.
//

import UIKit
import SkyFloatingLabelTextField
import FirebaseDatabase
import FirebaseCore
import FirebaseAuth

class SignUpDonatorVC: UITabBarController {

    var become: UILabel!
    var firstName: SkyFloatingLabelTextField!
    var lastName: SkyFloatingLabelTextField!
    var email: SkyFloatingLabelTextField!
    var phoneNumber: SkyFloatingLabelTextField!
    var password: SkyFloatingLabelTextField!
    
    var back: UIButton!
    var enter: UIButton!
    
    let dbHelper = FirebaseDatabaseHelper()


    
    override func viewDidLoad() {
        super.viewDidLoad()
        become = UILabel(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: 200))
        become.center = CGPoint(x: view.frame.width/2, y: view.frame.height/2 - 250)
        become.textAlignment = .center
        become.textColor = .white
        become.adjustsFontSizeToFitWidth = true
        become.font = UIFont(name:"Arial", size: 70.0)
        
        let imageN = "WaveImage"
        let imageWave = UIImage(named: imageN)
        let imageWaveView = UIImageView(image: imageWave!)
        imageWaveView.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: 600)
        imageWaveView.center = CGPoint(x: view.frame.width/2, y:  view.frame.height/2 + 200)
        imageWaveView.contentMode = .scaleAspectFit
        view.addSubview(imageWaveView)
        
        //signUpLabel.font = UIFont(name:"Raleway-SemiBold", size: 20.0)
        become.text = "become"
        self.view.addSubview(become)
        
        
        setUpLabels()
        setUpButtons()
    }
    func setUpLabels(){
        let airPinkColor = UIColor(red: 255/255.0, green: 148/255.0, blue: 153/255.0, alpha: 1.0)
        let lightGreyColor = UIColor(red: 217/255, green: 220/255, blue: 216/255, alpha: 1.0)
        let darkGreyColor = UIColor(red: 99/255, green: 102/255, blue: 104/255, alpha: 1.0)
        let overcastBlueColor = UIColor(red: 15/255, green: 145/255, blue: 159/255, alpha: 1.0)
        view.backgroundColor = airPinkColor
        
        //FIRSTNAME UI TEXTFIELD
        firstName = SkyFloatingLabelTextField(frame: CGRect(x: 0, y: 0, width: view.frame.width * 0.8, height: 40.00));
        firstName.center = CGPoint(x: view.frame.width / 2, y:  view.frame.height/2 - 150)
        firstName.placeholder = "First Name"
        firstName.keyboardType = UIKeyboardType.default
        firstName.textColor = UIColor.black
        firstName.tintColor = overcastBlueColor  // the color of the blinking cursor
        firstName.textColor = overcastBlueColor
        firstName.lineColor = overcastBlueColor
        firstName.selectedTitleColor = overcastBlueColor
        firstName.selectedLineColor = overcastBlueColor
        firstName.lineHeight = 2.0
        firstName.selectedLineHeight = 3.0
        self.view.addSubview(firstName)
        
        //LASTNAME UI TEXTFIELD
        lastName = SkyFloatingLabelTextField(frame: CGRect(x: 0, y: 0, width: view.frame.width * 0.8, height: 40.00));
        lastName.center = CGPoint(x: view.frame.width / 2, y:  view.frame.height/2  - 90)
        lastName.placeholder = "Last Name"
        lastName.keyboardType = UIKeyboardType.default
        lastName.textColor = UIColor.black
        lastName.tintColor = overcastBlueColor  // the color of the blinking cursor
        lastName.textColor = overcastBlueColor
        lastName.lineColor = overcastBlueColor
        lastName.selectedTitleColor = overcastBlueColor
        lastName.selectedLineColor = overcastBlueColor
        lastName.lineHeight = 2.0
        lastName.selectedLineHeight = 3.0
        self.view.addSubview(lastName)
        
        
            //PHONENUMBER UI TEXTFIELD
            phoneNumber = SkyFloatingLabelTextField(frame: CGRect(x: 0, y: 0, width: view.frame.width * 0.8, height: 40.00));
            phoneNumber.center = CGPoint(x: view.frame.width / 2, y:  view.frame.height/2 - 30)
            phoneNumber.placeholder = "Phone Number"
            phoneNumber.keyboardType = UIKeyboardType.default
            phoneNumber.textColor = UIColor.black
            phoneNumber.tintColor = overcastBlueColor  // the color of the blinking cursor
            phoneNumber.textColor = overcastBlueColor
            phoneNumber.lineColor = overcastBlueColor
            phoneNumber.selectedTitleColor = overcastBlueColor
            phoneNumber.selectedLineColor = overcastBlueColor
        phoneNumber.lineHeight = 2.0
        phoneNumber.selectedLineHeight = 3.0
             self.view.addSubview(phoneNumber)
        
        //EMAIL UI TEXTFIELD
        email = SkyFloatingLabelTextField(frame: CGRect(x: 0, y: 0, width: view.frame.width * 0.8, height: 40.00));
        email.center = CGPoint(x: view.frame.width / 2, y:  view.frame.height/2 + 30)
        email.placeholder = "Email"
        email.keyboardType = UIKeyboardType.default
        email.textColor = UIColor.black
        email.tintColor = overcastBlueColor  // the color of the blinking cursor
        email.textColor = overcastBlueColor
        email.lineColor = overcastBlueColor
        email.selectedTitleColor = overcastBlueColor
        email.selectedLineColor = overcastBlueColor
        email.lineHeight = 2.0
        email.selectedLineHeight = 3.0
        self.view.addSubview(email)
        
        //PASSWORD UI TEXTFIELD
        password = SkyFloatingLabelTextField(frame: CGRect(x: 0, y: 0, width: view.frame.width * 0.8, height: 40.00));
        password.center = CGPoint(x: view.frame.width / 2, y:  view.frame.height/2 + 90)
        password.placeholder = "Password"
        password.keyboardType = UIKeyboardType.default
        password.textColor = UIColor.black
        password.tintColor = overcastBlueColor  // the color of the blinking cursor
        password.textColor = overcastBlueColor
        password.lineColor = overcastBlueColor
        password.selectedTitleColor = overcastBlueColor
        password.selectedLineColor = overcastBlueColor
        password.lineHeight = 2.0
        password.selectedLineHeight = 3.0
        self.view.addSubview(password)
    }
    
    func setUpButtons(){
        
        //SINGUP UIBUTTON
        let airPinkColor = UIColor(red: 255/255.0, green: 148/255.0, blue: 153/255.0, alpha: 1.0)
        enter = UIButton(frame: CGRect(x: 100, y: 100, width: view.frame.width/4, height: 35))
        enter.center = CGPoint(x: view.frame.width/4 * 3 - 35, y:  view.frame.height/2 + 200)
        enter.setTitle("enter", for: UIControlState())
        enter.titleLabel?.font = UIFont(name:"Arial", size: 100.0)
        enter.titleLabel?.font =  .systemFont(ofSize: 30)
        enter.backgroundColor = airPinkColor
        enter.addTarget(self, action: #selector(loginButtonPressed(_:)), for: .touchUpInside)
        view.addSubview(enter)
        
        //LOGIN UIBUTTON
        back = UIButton(frame: CGRect(x: 100, y: 100, width: view.frame.width/4 - 20,  height: 35))
        back.center = CGPoint(x: view.frame.width/4 + 30, y:  view.frame.height/2 + 200)
        back.setTitle("back", for: .normal)
        back.layer.cornerRadius = 20
        back.titleLabel?.font = UIFont(name:"Raleway-SemiBold", size: 100.0)
        back.titleLabel?.font =  .systemFont(ofSize: 30)
        back.backgroundColor = airPinkColor
        back.addTarget(self, action: #selector(backClicked), for: .touchUpInside)
        view.addSubview(back)
        
    }
    @objc func backClicked() {
        performSegue(withIdentifier: "backDonator", sender: self)
        
        //   if let mvc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "FeedViewController") as? ModalViewController {
        //        self.present(mvc, animated: true, completion: nil)
        //   }
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @objc func loginButtonPressed(_ sender: Any){
        //Auth.auth().currentUser?.uid
        Auth.auth().createUser(withEmail: email.text!, password: password.text!){ (user, error) in
            if error != nil{
                print(error!)
            } else if let user = user {
                //user.user.uid
                print("Registration Successful")
                
                let userSetUp = User(user.user.uid, self.firstName.text!, self.email.text!, self.phoneNumber.text!, true)
                self.dbHelper.makeUser(user: userSetUp)
            
                let storyboard = UIStoryboard(name: "Main", bundle: .main)
                let vc = storyboard.instantiateViewController(withIdentifier: "TabBarVCDonor")
                self.view.window?.rootViewController = vc
                self.view.window?.makeKeyAndVisible()
                
                
            }
        }
    }
    

}
