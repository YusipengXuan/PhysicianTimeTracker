//
//  LoginVC.swift
//  PhysicianTimeTracker
//
//  Created by Ray Xuan on 4/10/18.
//  Copyright © 2018 ShippertLLC. All rights reserved.
//

import UIKit

class LoginVC: UIViewController, UITextFieldDelegate {
    @IBOutlet weak var Username: UITextField!
    @IBOutlet weak var Password: UITextField!
    @IBOutlet weak var SignInButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let ScreenWidth = view.frame.width
        
        Username.delegate = self;
        Password.delegate = self;
        
        // Size & Position
        Username.textAlignment = .left
        Username.frame = CGRect(x: 0, y: 0, width: ScreenWidth - ScreenWidth*0.2, height: 50)
        Username.center = CGPoint(x:view.center.x, y:view.center.y - 30)
        // Border Setting
        Username.borderStyle = UITextBorderStyle.line
        Username.layer.borderColor = UIColor.gray.cgColor
        Username.layer.borderWidth = 1
        Username.layer.shadowOpacity = 0.0
        Username.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 15, height: self.Username.frame.height))
        Username.leftViewMode = .always
        
        // Size & Position
        Password.textAlignment = .left
        Password.frame = CGRect(x: 0, y: 0, width: ScreenWidth - ScreenWidth*0.2, height: 50)
        Password.center = CGPoint(x:view.center.x, y:view.center.y + 40)
        // Border Setting
        Password.borderStyle = UITextBorderStyle.line
        Password.layer.borderColor = UIColor.gray.cgColor
        Password.layer.borderWidth = 1
        Password.layer.shadowColor = UIColor.white.cgColor
        Password.layer.shadowOpacity = 0.0
        // Text Setting
        Password.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 15, height: self.Password.frame.height))
        Password.leftViewMode = .always

        
        SignInButton.tintColor = UIColor.white
        SignInButton.backgroundColor = UIColor.gray
        SignInButton.frame = CGRect(x: 0, y: 0, width: ScreenWidth - ScreenWidth*0.2, height: 50)
        SignInButton.center = CGPoint(x:view.center.x, y:view.center.y + 110)
        SignInButton.layer.cornerRadius = 5
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }
    
    
}
