//
//  SecondViewController.swift
//  RecommendMii
//
import UIKit

class SavingController: UIViewController {
    @IBOutlet weak var currentBudget: UILabel!
    
       override func viewDidLoad() {
        super.viewDidLoad()
        var total = 200
        var dollar = "$"
        currentBudget.text = dollar+String(total)
        
        
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    override func viewWillAppear(_ animated: Bool) {
        
        var total = 200
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
