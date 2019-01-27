//
//  SecondViewController.swift
//  Budget-It
//
//  Created by Weija Zhou on 2017-11-18.
//  Copyright © 2017 Weija Zhou. All rights reserved.
//
import UIKit

class SecondViewController: UIViewController {
    
    @IBOutlet weak var Text1: UILabel!
    
    @IBOutlet weak var Text2: UILabel!

    @IBOutlet weak var Text3: UILabel!
    
    @IBOutlet weak var Text4: UILabel!

    @IBOutlet weak var Text5: UILabel!
    
    @IBOutlet weak var Text6: UILabel!
    @IBOutlet weak var Text7: UILabel!
    @IBOutlet weak var Text8: UILabel!
    @IBOutlet weak var Text9: UILabel!
    @IBOutlet weak var Text10: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        if let a = UserDefaults.standard.object(forKey: "TotalExpense1") as? String{
            Text1.text = a
        }
        if let b = UserDefaults.standard.object(forKey: "CurrentExpense1") as? String{
            Text6.text = b
        }
        if let c = UserDefaults.standard.object(forKey: "TotalExpense2") as? String{
            Text2.text = c
        }
        if let d = UserDefaults.standard.object(forKey: "CurrentExpense2") as? String{
            Text7.text = d
        }
        if let e = UserDefaults.standard.object(forKey: "TotalExpense3") as? String{
            Text3.text = e
        }
        if let f = UserDefaults.standard.object(forKey: "CurrentExpense3") as? String{
            Text8.text = f
        }
        if let g = UserDefaults.standard.object(forKey: "TotalExpense4") as? String{
            Text4.text = g
        }
        if let h = UserDefaults.standard.object(forKey: "CurrentExpense4") as? String{
            Text9.text = h
        }
        if let i = UserDefaults.standard.object(forKey: "TotalExpense5") as? String{
            Text5.text = i
        }
        if let j = UserDefaults.standard.object(forKey: "CurrentExpense5") as? String{
            Text10.text = j
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
        if let c = UserDefaults.standard.object(forKey: "TotalExpense2") as? String{
            Text2.text = c
        }
        if let d = UserDefaults.standard.object(forKey: "CurrentExpense2") as? String{
            Text7.text = d
        }
        if let e = UserDefaults.standard.object(forKey: "TotalExpense3") as? String{
            Text3.text = e
        }
        if let f = UserDefaults.standard.object(forKey: "CurrentExpense3") as? String{
            Text8.text = f
        }
        if let g = UserDefaults.standard.object(forKey: "TotalExpense4") as? String{
            Text4.text = g
        }
        if let h = UserDefaults.standard.object(forKey: "CurrentExpense4") as? String{
            Text9.text = h
        }
        if let i = UserDefaults.standard.object(forKey: "TotalExpense5") as? String{
            Text5.text = i
        }
        if let j = UserDefaults.standard.object(forKey: "CurrentExpense5") as? String{
            Text10.text = j
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
