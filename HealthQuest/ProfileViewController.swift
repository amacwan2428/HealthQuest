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
