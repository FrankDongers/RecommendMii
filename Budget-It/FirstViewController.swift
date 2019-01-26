//
//  FirstViewController.swift
//  Budget-It
//
//  Created by Weija Zhou on 2017-11-18.
//  Copyright © 2017 Weija Zhou. All rights reserved.
//
import UIKit

class FirstViewController: UIViewController {
    public static var globalJSON: [String: Any] = [
        "id": 0,
        "value": 0
    ];

    @IBOutlet weak var Text1: UITextField!
    @IBOutlet weak var Text2: UITextField!
    @IBOutlet weak var Text3: UITextField!
    @IBOutlet weak var Text4: UITextField!
    @IBOutlet weak var Text5: UITextField!
    
    func runTimedCode() {
        //create the url with NSURL
        let url = URL(string: "https://recommendmii-343b5.firebaseio.com/transactions.json")! //change the url
        
        //create the session object
        let session = URLSession.shared
        
        //now create the URLRequest object using the url object
        let request = URLRequest(url: url)
        
        //create dataTask using the session object to send data to the server
        let task = session.dataTask(with: request as URLRequest, completionHandler: { data, response, error in
            
            guard error == nil else {
                return
            }
            
            guard let data = data else {
                return
            }
            
            do {
                //create json object from data
                if let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as? [String: Any] {
                    //print(json)
                    FirstViewController.globalJSON = json
                }
            } catch let error {
                print(error.localizedDescription)
            }
        })
        task.resume()
    }
    
       @IBAction func NextButton(_ sender: Any) {
        self.view.endEditing(true)
        
        if(isKeyPresentInUserDefaults(key: "TotalExpense1")){
            UserDefaults.standard.removeObject(forKey: "TotalExpense1")
            UserDefaults.standard.set(Text1.text,forKey: "TotalExpense1")
            UserDefaults.standard.removeObject(forKey: "CurrentExpense1")
            UserDefaults.standard.set(Text1.text,forKey: "CurrentExpense1")
        }
        else{
            UserDefaults.standard.set(Text1.text,forKey: "TotalExpense1")
            UserDefaults.standard.set(Text1.text,forKey: "CurrentExpense1")
            
        }
        if(isKeyPresentInUserDefaults(key: "TotalExpense2")){
            UserDefaults.standard.removeObject(forKey: "TotalExpense2")
            UserDefaults.standard.set(Text2.text,forKey: "TotalExpense2")
            UserDefaults.standard.removeObject(forKey: "CurrentExpense2")
            UserDefaults.standard.set(Text2.text,forKey: "CurrentExpense2")
        }
        else{
            UserDefaults.standard.set(Text2.text,forKey: "TotalExpense2")
            UserDefaults.standard.set(Text2.text,forKey: "CurrentExpense2")
            
        }
        
        if(isKeyPresentInUserDefaults(key: "TotalExpense3")){
            UserDefaults.standard.removeObject(forKey: "TotalExpense3")
            UserDefaults.standard.set(Text3.text,forKey: "TotalExpense3")
            UserDefaults.standard.removeObject(forKey: "CurrentExpense3")
            UserDefaults.standard.set(Text3.text,forKey:"CurrentExpense3") }
        else{
            UserDefaults.standard.set(Text3.text,forKey: "TotalExpense3")
            UserDefaults.standard.set(Text3.text,forKey: "CurrentExpense3")
            
        }
        if(isKeyPresentInUserDefaults(key: "TotalExpense4")){
            UserDefaults.standard.removeObject(forKey: "TotalExpense4")
            UserDefaults.standard.set(Text4.text,forKey: "TotalExpense4")
            UserDefaults.standard.removeObject(forKey: "CurrentExpense4")
            UserDefaults.standard.set(Text4.text,forKey:"CurrentExpense4")
        }
        else{
            UserDefaults.standard.set(Text4.text,forKey: "TotalExpense4")
            UserDefaults.standard.set(Text4.text,forKey: "CurrentExpense4")
        }
        if(isKeyPresentInUserDefaults(key: "TotalExpense5")){
            UserDefaults.standard.removeObject(forKey: "TotalExpense5")
            UserDefaults.standard.set(Text5.text,forKey: "TotalExpense5")
            UserDefaults.standard.removeObject(forKey: "CurrentExpense5")
            UserDefaults.standard.set(Text5.text,forKey:"CurrentExpense5")}
        else{
            UserDefaults.standard.set(Text5.text,forKey: "TotalExpense5")
            UserDefaults.standard.set(Text5.text,forKey: "CurrentExpense5")
        }
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var gameTimer: Timer!
        
        gameTimer = Timer.scheduledTimer(timeInterval: 5, target: self, selector: #selector(runTimedCode), userInfo: nil, repeats: true)
        
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: "dismissKeyboard")
        
        //Uncomment the line below if you want the tap not not interfere and cancel other interactions.
        //tap.cancelsTouchesInView = false
        
        view.addGestureRecognizer(tap)
        //addToolBar(textField: FixedExpenseInput)
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func dismissKeyboard() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
    }
    func isKeyPresentInUserDefaults(key: String) -> Bool {
        return UserDefaults.standard.object(forKey: key) != nil
    }
    
}
