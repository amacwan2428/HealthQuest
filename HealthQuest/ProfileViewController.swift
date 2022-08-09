//
//  ProfileViewController.swift
//  HealthQuest
//
//  Created by user206102 on 8/6/22.
//

import UIKit

class ProfileViewController: UIViewController{
    let userDefaults = UserDefaults.standard
    
    @IBOutlet weak var labelUserName: UILabel!
    @IBOutlet weak var labelUserBio: UILabel!
    @IBOutlet weak var labelUserRanking: UILabel!
    
    @IBOutlet weak var imageAvatar: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        initDate4Profile()
        updateUserProfile()
        
        imageAvatar.setRounded()
    }
    
    @IBAction func btnEdit(){
        goToVC(vc_id: "vc_profile_edit")
    }
    
    @IBAction func btnAchieve(){
        guard let vc = storyboard?.instantiateViewController(identifier: "vc_profile_achieve") as? ProfileAchieveViewController else{
            return
        }
        present(vc, animated: true)
        
    }
    
    private func initDate4Profile(){
        userDefaults.set("Demo User",forKey: "UserName")
        userDefaults.set("1990-01-02", forKey: "UserDOB")
        userDefaults.set("Come to mingo", forKey:"UserBio")
        userDefaults.set("Real Name",forKey: "UserRealName")
        userDefaults.set(3, forKey: "UserRanking")
        
        userDefaults.set("Demo User 1",forKey: "UserName1")
        userDefaults.set("1990-11-02", forKey: "UserDOB1")
        userDefaults.set("Come to mingo 1", forKey:"UserBio1")
        userDefaults.set("Real Name 1",forKey: "UserRealName1")
        userDefaults.set(1, forKey: "UserRanking1")
    }
    
    public func updateUserProfile(){
        var userName = userDefaults.string(forKey: "UserName")
        var userBio = userDefaults.string(forKey: "UserBio")
        var userRanking = userDefaults.integer(forKey: "UserRanking")
        
        labelUserName.text = userName
        labelUserBio.text = userBio
        labelUserRanking.text = String(userRanking)
    }
}

class ProfileEditViewController: UIViewController{
    let userDefaults = UserDefaults.standard
    
    @IBOutlet weak var textUserName: UITextField!
    @IBOutlet weak var textUserDOB: UITextField!
    @IBOutlet weak var textUserBio: UITextField!
    @IBOutlet weak var textUserRealName: UITextField!
    @IBOutlet weak var viewSaveBtn: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        readProfile()
    }
    
    @IBAction func btnSave(){
        self.dismiss(animated: true, completion: nil)
        let userName = textUserName.text
        let userDOB = textUserDOB.text
        let userBio = textUserBio.text
        
        userDefaults.set(userName,forKey: "UserName")
        userDefaults.set(userDOB, forKey: "UserDOB")
        userDefaults.set(userBio, forKey:"UserBio")
        
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func btnBack(){
        self.dismiss(animated: true, completion: nil)

    }
    
    private func readProfile(){
        let userName = userDefaults.string(forKey: "UserName")
        let userBio = userDefaults.string(forKey: "UserBio")
        let userRealName = userDefaults.string(forKey: "UserRealName")
        let userDob = userDefaults.string(forKey: "UserDOB")
        
        textUserName.text = userName
        textUserBio.text = userBio
        textUserDOB.text = userDob
        textUserRealName.text = userRealName
        
        textUserRealName.isUserInteractionEnabled = false
    }
    
}

class ProfileAchieveViewController: UIViewController{

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    

}

class ProfileSubscriptionViewController: UIViewController{

    override func viewDidLoad() {
        super.viewDidLoad()

    }

}

class ProfileFriendsViewController: UIViewController{

    override func viewDidLoad() {
        super.viewDidLoad()

    }

}

extension UIImageView {
   func setRounded() {
     layer.borderWidth = 1
     layer.masksToBounds = false
     layer.borderColor = UIColor.black.cgColor
     layer.cornerRadius = self.frame.height / 2
     clipsToBounds = true
   }
}

extension UIViewController{
    func goToVC(vc_id:String){
        guard let vc = storyboard?.instantiateViewController(identifier: vc_id) as? ProfileEditViewController else{
            return
        }
        present(vc, animated: true)
        
    }
}
