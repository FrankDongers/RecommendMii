//
//  SecondViewController.swift
//  Budget-It
//
//  Created by Weija Zhou on 2017-11-18.
//  Copyright © 2017 Weija Zhou. All rights reserved.
//
import UIKit
import CoreData
class FourthViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
    
    @IBOutlet weak var Table1: UITableView!
    @IBOutlet weak var Table2: UITableView!
    @IBOutlet weak var Table3: UITableView!
    var list1:[String] = ["Item"]
    var list2:[String] = ["Price"]
    var list3:[String] = ["Type"]
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        if tableView == Table1 {
            return (list1.count);
        }
        else if tableView == Table2{
            return (list2.count);
        }
        else {
            return (list3.count);
        }
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        if (tableView == Table1){
            let cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "cell1")
            cell.textLabel?.text = list1[indexPath.row]
            return(cell)
        }
        else if (tableView == Table2){
            let cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "cell2")
            cell.textLabel?.text = list2[indexPath.row]
            return(cell)
        }
        else {
            let cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "cell3")
            cell.textLabel?.text = list3[indexPath.row]
            return(cell)
        }
 

    }
    
    
    
//    public func tableView(Table1: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
//        let cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "cell")
//        cell.textLabel?.text = list[indexPath.row]
//        return(cell)
//    }
//    
//    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
//        return (list.count)
//        
//    }
//    
//    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
//        let cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "cell")
//        cell.textLabel?.text = list[indexPath.row]
//        return(cell)
//    }

    @IBOutlet weak var testLabel: UILabel!
        override func viewWillAppear(_ animated: Bool) {
        super.viewDidLoad()
        self.Table1.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        self.Table2.register(UITableViewCell.self, forCellReuseIdentifier: "cell2")
        self.Table3.register(UITableViewCell.self, forCellReuseIdentifier: "cell3")

        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Entry")
        var newPrice = "0"
        request.returnsObjectsAsFaults = false
        do{
            let results = try context.fetch(request)
            
            if results.count>0{
                for result in results as! [NSManagedObject]{
                    let itemName = result.value(forKey: "itemName") as? String
                     let price = result.value(forKey: "price") as? String
                 
                    let category = result.value(forKey: "category") as? String
                   
                    print(itemName)
                    print(category)
                    print(price)
                    print ("FINAL STRING -----")
                    
                    list1.append(itemName!)
                    list2.append(price!)
                    list3.append(category!)

                    
                }
            }
        }
        catch{
            
        }
        
        

    
    
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
