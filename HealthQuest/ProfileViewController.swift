//
//  ProfileViewController.swift
//  HealthQuest
//
//  Created by user206102 on 8/6/22.
//

import UIKit

class ProfileViewController: UIViewController{

    @IBOutlet weak var imageAvatar: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()

        imageAvatar.setRounded()
    }
    
    @IBAction func btnEdit(){
        goToVC(vc_id: "vc_profile_edit")
    }

}

class ProfileEditViewController: UIViewController{

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func btnSave(){
        goToVC(vc_id: "vc_profile_main")
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
