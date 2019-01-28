//
//  SecondViewController.swift
//  Budget-It
//
//  Created by Weija Zhou on 2017-11-18.
//  Copyright © 2017 Weija Zhou. All rights reserved.
//
import UIKit

class SavingController: UIViewController {
    @IBOutlet weak var currentBudget: UILabel!
    
       override func viewDidLoad() {
        super.viewDidLoad()
       
        
         let i = UserDefaults.standard.object(forKey: "CurrentExpense1") as? String
            var a = Int(i!)
        
        let j = UserDefaults.standard.object(forKey: "CurrentExpense2") as? String
            var b = Int(j!)
        
         let k = UserDefaults.standard.object(forKey: "CurrentExpense3") as? String
            var c = Int(k!)
        
        let l = UserDefaults.standard.object(forKey: "CurrentExpense4") as? String
            var d = Int(j!)
        let m = UserDefaults.standard.object(forKey: "CurrentExpense5") as? String
            var e = Int(m!)
        
        var total = a! + b!
            total = total + c!
            total = total + d!
            total = total + e!
        var dollar = "$"
        currentBudget.text = dollar+String(total)
        
        
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    override func viewWillAppear(_ animated: Bool) {
        let i = UserDefaults.standard.object(forKey: "CurrentExpense1") as? String
        var a = Int(i!)
        
        let j = UserDefaults.standard.object(forKey: "CurrentExpense2") as? String
        var b = Int(j!)
        
        let k = UserDefaults.standard.object(forKey: "CurrentExpense3") as? String
        var c = Int(k!)
        
        let l = UserDefaults.standard.object(forKey: "CurrentExpense4") as? String
        var d = Int(j!)
        let m = UserDefaults.standard.object(forKey: "CurrentExpense5") as? String
        var e = Int(m!)
        
        var total = a! + b!
        total = total + c!
        total = total + d!
        total = total + e!
        var dollar = "$"
        currentBudget.text = dollar+String(total)
        

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
