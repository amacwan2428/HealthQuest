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

        
        userDefaults.set("Demo User 1",forKey: "UserName1")
        userDefaults.set("1990-11-01", forKey: "UserDOB1")
        userDefaults.set("Come to mingo 1", forKey:"UserBio1")
        userDefaults.set("Real Name 1",forKey: "UserRealName1")
        userDefaults.set(37.8, forKey: "UserMile1")
        userDefaults.set(1, forKey: "UserRanking1")
        
        userDefaults.set("Demo User 2",forKey: "UserName2")
        userDefaults.set("1990-11-02", forKey: "UserDOB2")
        userDefaults.set("Come to mingo 2", forKey:"UserBio2")
        userDefaults.set("Real Name 2",forKey: "UserRealName2")
        userDefaults.set(33, forKey: "UserMile2")
        userDefaults.set(2, forKey: "UserRanking2")
        
        userDefaults.set("Demo User",forKey: "UserName3")
        userDefaults.set("1990-01-03", forKey: "UserDOB3")
        userDefaults.set("Come to mingo", forKey:"UserBio3")
        userDefaults.set("Real Name",forKey: "UserRealName3")
        userDefaults.set(23.9 ,forKey: "UserMile3")
        userDefaults.set(3, forKey: "UserRanking3")
        
        userDefaults.set("Demo User 4",forKey: "UserName4")
        userDefaults.set("1990-11-04", forKey: "UserDOB4")
        userDefaults.set("Come to mingo 4", forKey:"UserBio4")
        userDefaults.set("Real Name 4",forKey: "UserRealName4")
        userDefaults.set(15.6, forKey: "UserMile4")
        userDefaults.set(4, forKey: "UserRanking4")
        
        userDefaults.set("Demo User 5",forKey: "UserName5")
        userDefaults.set("1990-11-05", forKey: "UserDOB5")
        userDefaults.set("Come to mingo 5", forKey:"UserBio5")
        userDefaults.set("Real Name 5",forKey: "UserRealName5")
        userDefaults.set(12.3, forKey: "UserMile5")
        userDefaults.set(5, forKey: "UserRanking5")
        
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
    let userDefaults = UserDefaults.standard
    
    
    var userName2Pass = ""
    var userBio2Pass = ""
    var userRealName2Pass = ""
    var userDob2Pass = ""
    var userMile2Pass: Double = 0.0
    var userRanking2Pass : Int = 0
    var userMeMile2Pass: Double = 0.0
    
    
    @IBOutlet weak var btnRank1: UIButton!
    @IBOutlet weak var btnRank2: UIButton!
    @IBOutlet weak var btnRank3: UIButton!
    @IBOutlet weak var btnRank4: UIButton!
    @IBOutlet weak var btnRank5: UIButton!

    @IBOutlet weak var labelRank1: UILabel!
    @IBOutlet weak var labelRank2: UILabel!
    @IBOutlet weak var labelRank3: UILabel!
    @IBOutlet weak var labelRank4: UILabel!
    @IBOutlet weak var labelRank5: UILabel!
    
    
    @IBAction func btnRank1(_ sender: Any) {
        readProfile(index: 1)
    }
    
    @IBAction func btnRank2(_ sender: Any) {
        readProfile(index: 2)
    }
    
    @IBAction func btnRank3(_ sender: Any) {
        readProfile(index: 3)
    }
    
    @IBAction func btnRank4(_ sender: Any) {
        readProfile(index: 4)
    }
    
    @IBAction func btnRank5(_ sender: Any) {
        readProfile(index: 5)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            
        let destinationVC = segue.destination as! ProfileFriendsViewController
        destinationVC.userName = userName2Pass;
        destinationVC.userBio = userBio2Pass;
        destinationVC.userRealName = userRealName2Pass;
        destinationVC.userDob = userDob2Pass;
        destinationVC.userMile = userMile2Pass;
        destinationVC.userRanking = userRanking2Pass;
        destinationVC.userMile = userMeMile2Pass
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        readProfile()

    }
    
    private func readProfile(){

        let iterationArray = [1,2,3,4,5]
        for (index, element) in iterationArray.enumerated() {
            var userName = userDefaults.string(forKey: "UserName" + String(element))
            let userBio = userDefaults.string(forKey: "UserBio" + String(element))
            let userRealName = userDefaults.string(forKey: "UserRealName" + String(element));
            let userDob = userDefaults.string(forKey: "UserDOB" + String(element))
            let userMile = userDefaults.double(forKey: "UserMile" + String(element))
            let userRanking = userDefaults.integer(forKey: "UserRanking" + String(element))
            
            if let button = value(forKey: "btnRank" + String(element)) as? UIButton {
                if(element == 3){
                    userName = "Me";
                    userMeMile2Pass = userMile
                    
                }
                button.setTitle(userName, for: .normal)
            }
            
            if let label = value(forKey: "labelRank" + String(element)) as? UILabel {
                label.text = String(userMile) +  "KM"
            }
        }
        
    }
    
    private func readProfile(index: Int){
       userName2Pass = userDefaults.string(forKey: "UserName" + String(index))!
       userBio2Pass = userDefaults.string(forKey: "UserBio" + String(index))!
       userRealName2Pass = userDefaults.string(forKey: "UserRealName" + String(index))!
       userDob2Pass = userDefaults.string(forKey: "UserDOB" + String(index))!
       userMile2Pass = userDefaults.double(forKey: "UserMile" + String(index) + "KM")
       userRanking2Pass = userDefaults.integer(forKey: "UserRanking" + String(index))

    }
}

class ProfileFriendsViewController: UIViewController{
    
    var userName: String = ""
    var userBio: String = ""
    var userRealName: String = ""
    var userDob: String = ""
    var userMile: Double = 0.0
    var userRanking: Int = 0
    var userMeMile :Double = 0.0
    
    
    @IBOutlet weak var textUserName: UITextField!
    @IBOutlet weak var textUserDOB: UITextField!
    @IBOutlet weak var textUserBio: UITextField!
    @IBOutlet weak var textUserMile: UITextField!
    @IBOutlet weak var textUserRealName: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textUserName.text = userName
        textUserDOB.text = userDob
        textUserMile.text = String(userMile)
        textUserRealName.text = userRealName
    }
    
    @IBAction func btnBackClicked(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
        
    }
    
    @IBAction func btnCompareClicked(_ sender: Any) {
        var msg = ""
        if(userMile > userMeMile){
            msg = "This user's mile is greater than you by " + String(userMile - userMeMile) + " KM"
        }else{
            msg = "Your mile is greater than this user by " + String(userMile - userMeMile) + " KM"
            
        }
        let alert = UIAlertController(title: "Result", message: msg, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
        
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

