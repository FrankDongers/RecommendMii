//
//  FirstViewController.swift
//  Budget-It
//
//  Created by Weija Zhou on 2017-11-18.
//  Copyright © 2017 Weija Zhou. All rights reserved.
//
import UIKit

class connectBank: UIViewController {
    @IBAction func ConnectButton(_ sender: Any) {
        print("hi")
        //let alert = UIAlertController(title: "Allow \"Budge-It\" to Access \"Scotiabank\" While You Use the App?", message: "Your transaction history may be used by this application", preferredStyle: UIAlertControllerStyle.alert)
        //alert.addAction(UIAlertAction(title: "Don't Allow", style: UIAlertActionStyle.default, handler: nil))
        //alert.addAction(UIAlertAction(title: "Allow", style: UIAlertActionStyle.default, handler: nil))
        //self.present(alert, animated: true, completion: nil)
        let alert = UIAlertController(title: "Allow \"Budge-It\" to Access \"Bank Of Western\" While You Use the App?", message: "Your transaction history may be used by this application", preferredStyle: UIAlertControllerStyle.alert)
        
        let action = UIAlertAction(title: "Allow", style: .default) { (action) -> Void in
            let viewControllerYouWantToPresent = self.storyboard?.instantiateViewController(withIdentifier: "ViewControllerMain")
            self.present(viewControllerYouWantToPresent!, animated: true, completion: nil)
        }
        alert.addAction(UIAlertAction(title: "Don't Allow", style: UIAlertActionStyle.default, handler: nil))
        alert.addAction(action)
        self.present(alert, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //Uncomment the line below if you want the tap not not interfere and cancel other interactions.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

