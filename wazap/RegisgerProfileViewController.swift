//
//  RegisgerProfileViewController.swift
//  wazap
//
//  Created by 유호균 on 2016. 2. 21..
//  Copyright © 2016년 nexters. All rights reserved.
//

import UIKit
import Alamofire
import FBSDKLoginKit
import SwiftyJSON

class RegisgerProfileViewController: UIViewController {
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var kakaoTextField: UITextField!
    @IBOutlet weak var skillTextField: UITextField!
    @IBOutlet weak var schoolTextField: UITextField!
    @IBOutlet weak var majorTextField: UITextField!
    @IBOutlet weak var locateTextField: UITextField!
    @IBOutlet weak var introduceTextField: UITextView!
    @IBOutlet weak var expTextField: UITextView!
    
    let header = ["access-token": FBSDKAccessToken.currentAccessToken().tokenString as String]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboardWhenTappedAround()
        let alertController = UIAlertController(title: "회원가입", message: "상세 정보를 입력해 주세요", preferredStyle: .Alert)
        alertController.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.Default,handler: nil))
        self.presentViewController(alertController, animated: true, completion: nil)


        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    /**
     @ 제출하기 버튼 Action
    */
    @IBAction func submitButtonTouch(sender: AnyObject) {
        let kakao_id = kakaoTextField.text! as String
        let username = nameTextField.text! as String
        let skill = skillTextField.text! as String
        let school = schoolTextField.text! as String
        let major = majorTextField.text! as String
        let locate = locateTextField.text! as String
        let introduce = introduceTextField.text! as String
        let exp = expTextField.text! as String
        
        
        Alamofire.request(.POST,"http://come.n.get.us.to/users/reg" ,headers: header ,parameters: ["kakao_id": kakao_id, "username": username, "skill": skill, "school":school, "major":major, "locate":locate, "introduce":introduce, "exp":exp]).responseJSON{
            response in
            if let responseVal = response.result.value{
                let json = JSON(responseVal)
                let results = json["result"]
                if(results == "true"){
                 self.so_containerViewController!.topViewController = self.storyboard?.instantiateViewControllerWithIdentifier("mainScreen")
                }
            }
        }
       
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
