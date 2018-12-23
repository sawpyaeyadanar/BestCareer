//
//  LeftViewController.swift
//  LGSideMenuControllerDemo
//
import LGSideMenuController
import Firebase

class LeftViewController: UITableViewController {
    var ManuNameArray:Array = [String]()
    var iconArray:Array = [UIImage]()
    override func viewDidLoad() {
        super.viewDidLoad()
        ManuNameArray = ["Home","Favourite","Search","About","Logout"]
        iconArray = [UIImage(named:"home-filled")!,UIImage(named:"heart-outline")!,UIImage(named:"search")!,UIImage(named:"about")!,UIImage(named:"signout")!]
        tableView.tableFooterView = UIView()
        tableView.rowHeight = 80.0
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .default
    }
    
    override var preferredStatusBarUpdateAnimation: UIStatusBarAnimation {
        return .fade
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ManuNameArray.count
    }
    
    // MARK: - UITableViewDataSource
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! MenuCell
        print(indexPath.row,"Index Path",ManuNameArray[indexPath.row])
        cell.lblMenuname.text = ManuNameArray[indexPath.row]
        cell.imgIcon.image = iconArray[indexPath.row]
        return cell
    }
    
    
    
    // MARK: - UITableViewDelegate
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let mainViewController = sideMenuController
        
        let navCtrl = mainViewController?.rootViewController as? UINavigationController
        let exeStoryBoard = UIStoryboard.init(name: "Main", bundle: nil)
        switch indexPath.row {
        case 0:
        mainViewController?.hideLeftView( animated: true, completionHandler: nil)
        case 1:
        mainViewController?.hideLeftView( animated: true, completionHandler: nil)
        case 4:do {
            try Auth.auth().signOut()
             mainViewController?.dismiss(animated: true, completion: nil)
        } catch {
            print("Error in logout")
            }
        default:break;
        }
        
        
        
        
        
    }
    
}
