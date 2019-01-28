//
//  SecondViewController.swift
//  Budget-It
//
//  Created by Weija Zhou on 2017-11-18.
//  Copyright © 2017 Weija Zhou. All rights reserved.
//
import UIKit
import CoreData
class ThirdViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate{
    
    @IBOutlet weak var itemInput: UITextField!
    
    @IBOutlet weak var PickerView: UIPickerView!
    
    @IBOutlet weak var InputField: UITextField!
    @IBOutlet weak var Label1: UILabel!
    
        var currentCategory: String = "Beverages"
  
    
    
    let categories = ["Beverages", "Restaurant/Food", "Entertainment", "Retail", "Transportaion"]
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row : Int, forComponent component: Int) -> String? {
        return categories[row]
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent row : Int) -> Int {
        return categories.count
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row : Int, inComponent component: Int)  {
        
        currentCategory = categories[row]
    }
    
    
    @IBAction func insertEntry(_ sender: Any) {
        if ((itemInput.text != nil && itemInput.text != "") || (InputField.text != nil && InputField.text != "")){
            var textNumber: String = ""
            if (currentCategory == "Beverages"){
                textNumber = "CurrentExpense1"
            }
            else if (currentCategory == "Restaurant/Food"){
                textNumber = "CurrentExpense2"
            }
            else if (currentCategory == "Entertainment"){
                textNumber = "CurrentExpense3"
            }
            else if (currentCategory == "Retail"){
                textNumber = "CurrentExpense4"
            }
            else if (currentCategory == "Transportaion"){
                textNumber = "CurrentExpense5"
            }
            let x = UserDefaults.standard.object(forKey: textNumber) as? String
            print(textNumber)
            print(x)
            let currentExpense =  Int(x!)
            print (currentExpense)
            var text = InputField.text
            var inputTextString = itemInput.text
            var int_Text = Int(text!)
            let newExpense = currentExpense! - int_Text!
            let string_NewExpense = String(newExpense)
            UserDefaults.standard.removeObject(forKey: textNumber)
            UserDefaults.standard.set(string_NewExpense,forKey: textNumber)
            print(string_NewExpense)
            let appDelegate = UIApplication.shared.delegate as! AppDelegate
            let context = appDelegate.persistentContainer.viewContext
            let newEntry = NSEntityDescription.insertNewObject(forEntityName: "Entry", into: context)
            
            newEntry.setValue(text, forKey:"price")
            newEntry.setValue(currentCategory, forKey:"category")
            newEntry.setValue(inputTextString, forKey:"itemName")
            print(inputTextString)
            do{
                try context.save()
                print("YAY")
            }
            catch{
                
            }
            InputField.text = ""
            itemInput.text = ""
            
        }
        InputField.text = ""
        itemInput.text = ""
    }
    
        override func viewDidLoad() {
           
            let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: "dismissKeyboard")
            
            //Uncomment the line below if you want the tap not not interfere and cancel other interactions.
            //tap.cancelsTouchesInView = false
            
            view.addGestureRecognizer(tap)
        // Do any additional setup after loading the view, typically from a nib.
    }
    func dismissKeyboard() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
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
