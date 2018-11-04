//
//  ViewController.swift
//  periodic.
//
//  Created by Anika Bagga on 11/3/18.
//  Copyright © 2018 Anika Bagga. All rights reserved.
//

import UIKit
import SkyFloatingLabelTextField
import FirebaseStorage
import FirebaseAuth
import FirebaseStorage


class ViewController: UIViewController {
    
    var email: SkyFloatingLabelTextField!
    var password: SkyFloatingLabelTextField!
    var login: UIButton!
    var signup: UIButton!
    
    var periodic: UILabel!
    
    var logoImg: UIImage!
    var periodicLabel: UILabel!
    var wave: UIImage!
    let dbHelper = FirebaseDatabaseHelper()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.navigationController?.isNavigationBarHidden = true
        
        periodic = UILabel(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: 200))
        periodic.center = CGPoint(x: view.frame.width/2, y: view.frame.height/2 - 250)
        periodic.textAlignment = .center
        periodic.textColor = .white
        periodic.adjustsFontSizeToFitWidth = true
        periodic.font = UIFont(name:"Arial", size: 70.0)
        periodic.text = "periodic"
        self.view.addSubview(periodic)
        
//        let imageName = "LogoImage"
//        let image = UIImage(named: imageName)
//        let imageView = UIImageView(image: image!)
//        imageView.frame = CGRect(x: 0, y: 0, width: view.frame.width - 50, height: 170)
//        imageView.center = CGPoint(x: view.frame.width / 2 , y:  view.frame.height/2 - 100)
//        view.addSubview(imageView)
        
        let imageN = "WaveImage"
        let imageWave = UIImage(named: imageN)
        let imageWaveView = UIImageView(image: imageWave!)
        imageWaveView.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: 600)
        imageWaveView.center = CGPoint(x: view.frame.width/2, y:  view.frame.height/2 + 250)
        imageWaveView.contentMode = .scaleAspectFit
        view.addSubview(imageWaveView)
    
        labelSetUp()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func labelSetUp(){
       
        let airPinkColor = UIColor(red: 255/255.0, green: 148/255.0, blue: 153/255.0, alpha: 1.0)
        let lightGreyColor = UIColor(red: 217/255, green: 220/255, blue: 216/255, alpha: 1.0)
        let darkGreyColor = UIColor(red: 99/255, green: 102/255, blue: 104/255, alpha: 1.0)
        let overcastBlueColor = UIColor(red: 15/255, green: 145/255, blue: 159/255, alpha: 1.0)
        view.backgroundColor = airPinkColor
        
        //USERNAME UI TEXTFIELD
        email = SkyFloatingLabelTextField(frame: CGRect(x: 0, y: 0, width: view.frame.width * 0.8, height: 40.00));
        email.center = CGPoint(x: view.frame.width / 2, y:  view.frame.height/2 )
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
    
        //PASSWORD UITEXTFIELD
        password = SkyFloatingLabelTextField(frame: CGRect(x: 0, y: 0, width: view.frame.width * 0.8, height: 40.00));
        password.center = CGPoint(x: view.frame.width / 2, y:  view.frame.height/2 + 70)
        password.placeholder = "Password"
        password.keyboardType = UIKeyboardType.default
        password.isSecureTextEntry = true
        password.textColor = UIColor.black
        password.tintColor = overcastBlueColor // the color of the blinking cursor
        password.textColor = overcastBlueColor
        password.lineColor = overcastBlueColor
        password.selectedTitleColor = overcastBlueColor
        password.selectedLineColor = overcastBlueColor
        password.lineHeight = 2.0 // bottom line height in points

        password.selectedLineHeight = 3.0
        self.view.addSubview(password)
        
        //SINGUP UIBUTTON
        signup = UIButton(frame: CGRect(x: 100, y: 100, width: view.frame.width/4 - 10 , height: 45))
        signup.center = CGPoint(x: view.frame.width/4 * 3 - 35, y:  view.frame.height/2 + 250)
        signup.setTitle("sign up", for: UIControlState())
        signup.titleLabel?.font = UIFont(name:"Arial", size: 100.0)
        signup.titleLabel?.font =  .systemFont(ofSize: 30)
        signup.backgroundColor = airPinkColor
        signup.addTarget(self, action: #selector(signUpClicked), for: .touchUpInside)
        view.addSubview(signup)
        
        //LOGIN UIBUTTON
        login = UIButton(frame: CGRect(x: 100, y: 100, width: view.frame.width/4 - 20, height: 45))
        login.center = CGPoint(x: view.frame.width/4 + 30, y:  view.frame.height/2 + 250)
        login.setTitle("login", for: .normal)
        login.layer.cornerRadius = 20
        login.titleLabel?.font = UIFont(name:"Raleway-SemiBold", size: 100.0)
        login.titleLabel?.font =  .systemFont(ofSize: 30)
        login.backgroundColor = airPinkColor
        login.addTarget(self, action: #selector(loginClicked(_:)), for: .touchUpInside)
        view.addSubview(login)
        
    }
    @objc func signUpClicked() {
        performSegue(withIdentifier: "toSignUp", sender: self)
        
    }
    @objc func loginClicked(_ sender: Any){
        Auth.auth().signIn(withEmail: email.text!, password: password.text!) { (user, error) in
            if error != nil{
                print(error!)
            }else{
                print("Login Succesful")
                let idUser = user!.user.uid
                let userRecieved = self.dbHelper.getUserWithId(id: idUser)
                if userRecieved.isDonor == true{
                    let storyboard = UIStoryboard(name: "Main", bundle: .main)
                    let vc = storyboard.instantiateViewController(withIdentifier: "TabBarVCDonor")
                    self.view.window?.rootViewController = vc
                    self.view.window?.makeKeyAndVisible()
                }else{
                    let storyboard = UIStoryboard(name: "Main", bundle: .main)
                    let vc = storyboard.instantiateViewController(withIdentifier: "TabBarVCReciever")
                    self.view.window?.rootViewController = vc
                    self.view.window?.makeKeyAndVisible()
                }
                
            }
        }
    }
    
}

