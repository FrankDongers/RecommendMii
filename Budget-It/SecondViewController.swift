//
//  SecondViewController.swift
//  RecommendMii
import UIKit

class SecondViewController: UIViewController {
    
    public static var globalSelectedValue = "";
    
    @IBAction func buttonA(_ sender: Any) {
        SecondViewController.globalSelectedValue = "Option1"
    }
    @IBAction func buttonB(_ sender: Any) {
        SecondViewController.globalSelectedValue = "Option2"
    }
    @IBAction func buttonC(_ sender: Any) {
        SecondViewController.globalSelectedValue = "Option3"
    }
    @IBAction func buttonD(_ sender: Any) {
        SecondViewController.globalSelectedValue = "Option4"
    }
    
    
    
    
    @IBOutlet weak var mixNameA: UILabel!
    @IBOutlet weak var mixNameB: UILabel!
    @IBOutlet weak var mixNameC: UILabel!
    @IBOutlet weak var mixNameD: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var Text1: UILabel!
    @IBOutlet weak var Text6: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Lets populate the labels
        nameLabel.text = "Frank"
        mixNameA.text = FirstViewController.mixList[0];
        mixNameB.text = FirstViewController.mixList[1];
        mixNameC.text = FirstViewController.mixList[2];
        mixNameD.text = "Sat Chill";
        
        
        if let a = UserDefaults.standard.object(forKey: "TotalExpense1") as? String{
            Text1.text = a
        }
        if let b = UserDefaults.standard.object(forKey: "CurrentExpense1") as? String{
            Text6.text = b
        }
        // Do any additional setup after loading the view, typically from a nib.
    }
    override func viewWillAppear(_ animated: Bool) {
        if let a = UserDefaults.standard.object(forKey: "TotalExpense1") as? String{
            Text1.text = a
        }
        if let b = UserDefaults.standard.object(forKey: "CurrentExpense1") as? String{
            Text6.text = b
        }
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
//    override func viewDidDisappear(_ animated: Bool) {
//        
//    }
//    
//    
    
}
