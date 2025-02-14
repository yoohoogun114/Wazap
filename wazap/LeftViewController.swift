//
//  LeftViewController.swift
//  wazap
//
//  Created by 유호균 on 2016. 2. 21..
//  Copyright © 2016년 nexters. All rights reserved.
//

import UIKit
import FBSDKLoginKit
import Alamofire
import SwiftyJSON
import Kingfisher
import AlamofireImage

class LeftViewController: UIViewController{
    
    /**
     @ Outlet
    */
    
    @IBOutlet weak var profilePhoto: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    
    
    /**
     @ Variables
    */
    let leftMenu : [String] = ["스크랩", "신청목록", "내가 쓴 글 목록"]
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(leftMenu.count)
        
        
        //페이스북 정보 가져와서 사진을 넣는 로직
        let facebookId = FBSDKAccessToken.currentAccessToken().userID as String
        let photoUrl = "https://graph.facebook.com/\(facebookId)/picture?type=large"
        
        
        self.profilePhoto.kf_setImageWithURL(NSURL(string: photoUrl)!, completionHandler:{ (image, error, cacheType, imageURL) -> () in
            if let profileImage = image{
                self.profilePhoto.image = profileImage.af_imageRoundedIntoCircle()
            }
        })
        
        //사용자 정보중 이름을 가져옴
        Alamofire.request(.GET, "http://come.n.get.us.to/users/\(facebookId)", parameters: nil).responseJSON{
            response in
            if let JSON = response.result.value{
                let username = JSON["data"]!![0]["username"]! as! String
                self.nameLabel.text = username
            }
        }
        
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if (segue.identifier == "myProfileSegue"){
            let destinationController = segue.destinationViewController as! MyProfileViewController

            destinationController.facebookId = FBSDKAccessToken.currentAccessToken().userID!
            
            print(destinationController.facebookId)
        }
        
    }
    
    
    @IBAction func scrapAction(sender: AnyObject) {
        self.so_containerViewController!.topViewController = self.storyboard!.instantiateViewControllerWithIdentifier("scrapScreen")
        self.so_containerViewController!.isSideViewControllerPresented = false
    }
    
    @IBAction func applyAction(sender: AnyObject) {
        self.so_containerViewController!.topViewController = self.storyboard!.instantiateViewControllerWithIdentifier("applyScreen")
        self.so_containerViewController!.isSideViewControllerPresented = false
    }
    
    @IBAction func articleAction(sender: AnyObject) {
        self.so_containerViewController!.topViewController = self.storyboard!.instantiateViewControllerWithIdentifier("recruitScreen")
        self.so_containerViewController!.isSideViewControllerPresented = false
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
