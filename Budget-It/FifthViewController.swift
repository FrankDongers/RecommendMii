//
//  FifthViewController.swift
//  RecommendMii
//
//  Created by Frank Dong on 2019-01-26.
//

import UIKit

class FifthViewController: UIViewController {
    
    public static var storedMapValues = [String?]()
    
    @IBOutlet weak var six: UILabel!
    @IBOutlet weak var four: UILabel!
    @IBOutlet weak var mix1: UILabel!
    @IBOutlet weak var mix2: UILabel!
    @IBOutlet weak var mix3: UILabel!
    @IBOutlet weak var one: UILabel!
    @IBOutlet weak var two: UILabel!
    @IBOutlet weak var three: UILabel!
    @IBOutlet weak var five: UILabel!
    @IBOutlet weak var seven: UILabel!
    @IBOutlet weak var eight: UILabel!
    @IBOutlet weak var nine: UILabel!
    @IBOutlet weak var Option3Button1: UIButton!
    @IBOutlet weak var Option2Button1: UIButton!
    @IBOutlet weak var Option1Button2: UIButton!
    @IBOutlet weak var Option1Button1: UIButton!
    @IBOutlet weak var descriptionButton: UILabel!
    @IBOutlet weak var selectedOption: UILabel!
    var buttonBeingTriggered = 0
    var button1State = 0
    var button2State = 0
    var button3State = 0
    var button4State = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //button 1
        let tapGesture1 = UITapGestureRecognizer(target: self, action: #selector (tap1))  //Tap function will call when user tap on button
        let longGesture1 = UILongPressGestureRecognizer(target: self, action: #selector(long1))  //Long function will call when user long press on button.
        tapGesture1.numberOfTapsRequired = 1
        Option1Button1.addGestureRecognizer(tapGesture1)
        Option1Button1.addGestureRecognizer(longGesture1)
        
        //button2
        let tapGesture2 = UITapGestureRecognizer(target: self, action: #selector (tap2))  //Tap function will call when user tap on button
        let longGesture2 = UILongPressGestureRecognizer(target: self, action: #selector(long2))  //Long function will call when user long press on button.
        tapGesture2.numberOfTapsRequired = 1
        Option1Button2.addGestureRecognizer(tapGesture2)
        Option1Button2.addGestureRecognizer(longGesture2)
        
        //button3
        let tapGesture3 = UITapGestureRecognizer(target: self, action: #selector (tap3))  //Tap function will call when user tap on button
        let longGesture3 = UILongPressGestureRecognizer(target: self, action: #selector(long3))  //Long function will call when user long press on button.
        tapGesture3.numberOfTapsRequired = 1
        Option2Button1.addGestureRecognizer(tapGesture3)
        Option2Button1.addGestureRecognizer(longGesture3)
        
        //button4
        let tapGesture4 = UITapGestureRecognizer(target: self, action: #selector (tap4))  //Tap function will call when user tap on button
        let longGesture4 = UILongPressGestureRecognizer(target: self, action: #selector(long4))  //Long function will call when user long press on button.
        tapGesture4.numberOfTapsRequired = 1
        Option3Button1.addGestureRecognizer(tapGesture4)
        Option3Button1.addGestureRecognizer(longGesture4)
        
        selectedOption.text = SecondViewController.globalSelectedValue
        
        if (SecondViewController.globalSelectedValue == "Option1"){
            one.text = FirstViewController.recommendationArray[0];
            two.text = FirstViewController.recommendationArray[1];
            three.text = FirstViewController.recommendationArray[2];
            four.text = FirstViewController.recommendationArray[3];
            five.text = FirstViewController.recommendationArray[4];
            six.text = FirstViewController.recommendationArray[5];
            seven.text = FirstViewController.recommendationArray[6];
            eight.text = FirstViewController.recommendationArray[7];
            nine.text = FirstViewController.recommendationArray[8];
        }
        else if (SecondViewController.globalSelectedValue == "Option2"){
            one.text = FirstViewController.recommendationArray[9];
            two.text = FirstViewController.recommendationArray[10];
            three.text = FirstViewController.recommendationArray[11];
            four.text = FirstViewController.recommendationArray[12];
            five.text = FirstViewController.recommendationArray[13];
            six.text = FirstViewController.recommendationArray[14];
            seven.text = FirstViewController.recommendationArray[15];
            eight.text = FirstViewController.recommendationArray[16];
            nine.text = FirstViewController.recommendationArray[17];
        }
        else if (SecondViewController.globalSelectedValue == "Option3"){
            one.text = FirstViewController.recommendationArray[18];
            two.text = FirstViewController.recommendationArray[19];
            three.text = FirstViewController.recommendationArray[20];
            four.text = FirstViewController.recommendationArray[21];
            five.text = FirstViewController.recommendationArray[22];
            six.text = FirstViewController.recommendationArray[23];
            seven.text = FirstViewController.recommendationArray[24];
            eight.text = FirstViewController.recommendationArray[25];
            nine.text = FirstViewController.recommendationArray[26];
        }
        else{
            one.text = FirstViewController.recommendationArray[27];
            two.text = FirstViewController.recommendationArray[28];
            three.text = FirstViewController.recommendationArray[29];
            four.text = FirstViewController.recommendationArray[30];
            five.text = FirstViewController.recommendationArray[31];
            six.text = FirstViewController.recommendationArray[32];
            seven.text = FirstViewController.recommendationArray[33];
            eight.text = FirstViewController.recommendationArray[34];
            nine.text = FirstViewController.recommendationArray[35];
        }
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @objc func tap1() {
        print("Tap happend")
        
        if (button1State == 0){
        Option1Button2.setImage(#imageLiteral(resourceName: "Mix2"), for: UIControlState.normal)
          Option1Button1.setImage(#imageLiteral(resourceName: "Mix1-1"), for: UIControlState.normal)
            button1State = 1;
            button2State = 0;
        }
        else{
            Option1Button1.setImage(#imageLiteral(resourceName: "Mix2"), for: UIControlState.normal)
            button1State = 0;
        }
        
        descriptionButton.text = "A local diner with a classic spin!"
    }
    
    @objc func long2() {
        descriptionButton.text = "A fresh new rustic site with healthy cuisine."
        print("Long press")
    }
    
    @objc func tap2() {
        print("Tap happend")
        print(FirstViewController.recommendationArray[0]);
        
        descriptionButton.text = "A fresh new rustic site with healthy cuisine."
        if (button2State == 0){
            Option1Button1.setImage(#imageLiteral(resourceName: "Mix2"), for: UIControlState.normal)
            Option1Button2.setImage(#imageLiteral(resourceName: "Mix1-1"), for: UIControlState.normal)
            button2State = 1;
            button1State = 0;
        }
        else{
            Option1Button2.setImage(#imageLiteral(resourceName: "Mix2"), for: UIControlState.normal)
            button2State = 0;
        }
    }
    
    @objc func long1() {
        descriptionButton.text = "A local diner with a classic spin!"
        print("Long press")
    }

    @objc func long3() {
        descriptionButton.text = "The hippest hangout in town."
        print("Long press")
    }
    
    @objc func tap3() {
        descriptionButton.text = "The hippest hangout in town."
        print("Tap happend")
        
        if (button3State == 0){
            Option2Button1.setImage(#imageLiteral(resourceName: "Mix1-1"), for: UIControlState.normal)
            button3State = 1;
        }
        else{
            Option2Button1.setImage(#imageLiteral(resourceName: "Mix2"), for: UIControlState.normal)
            button3State = 0;
        }
    }
    @objc func long4() {
        descriptionButton.text = "End the night in a classic fashion"
        print("Long press")
    }
    
    @objc func tap4() {
        print("Tap happend")
        
        if (button4State == 0){
            Option3Button1.setImage(#imageLiteral(resourceName: "Mix1-1"), for: UIControlState.normal)
            button4State = 1;
        }
        else{
            Option3Button1.setImage(#imageLiteral(resourceName: "Mix2"), for: UIControlState.normal)
            button4State = 0;
        }
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    @IBAction func mapThis(_ sender: Any) {
        if (SecondViewController.globalSelectedValue == "Option1"){
            if (button1State == 1){
                FifthViewController.storedMapValues.append(one.text)
            }
            else{
                FifthViewController.storedMapValues.append(FirstViewController.recommendationArray[1] as! String)
            }
            FifthViewController.storedMapValues.append(FirstViewController.recommendationArray[4] as! String)
            FifthViewController.storedMapValues.append(FirstViewController.recommendationArray[7] as! String)
        }
    else if (SecondViewController.globalSelectedValue == "Option2"){
        if (button1State == 1){
        FifthViewController.storedMapValues.append(FirstViewController.recommendationArray[9])
        }
        else{
        FifthViewController.storedMapValues.append(FirstViewController.recommendationArray[10])
        }
        FifthViewController.storedMapValues.append(FirstViewController.recommendationArray[12])
        FifthViewController.storedMapValues.append(FirstViewController.recommendationArray[15])
        }
    else if (SecondViewController.globalSelectedValue == "Option2"){
        if (button1State == 1){
            FifthViewController.storedMapValues.append(FirstViewController.recommendationArray[9])
        }
        else{
            FifthViewController.storedMapValues.append(FirstViewController.recommendationArray[10])
        }
        FifthViewController.storedMapValues.append(FirstViewController.recommendationArray[12])
        FifthViewController.storedMapValues.append(FirstViewController.recommendationArray[15])
    }
        else if (SecondViewController.globalSelectedValue == "Option3"){
            if (button1State == 1){
                FifthViewController.storedMapValues.append(FirstViewController.recommendationArray[18])
            }
            else{
                FifthViewController.storedMapValues.append(FirstViewController.recommendationArray[19])
            }
            FifthViewController.storedMapValues.append(FirstViewController.recommendationArray[21])
            FifthViewController.storedMapValues.append(FirstViewController.recommendationArray[24])
        }
        else{
            if (button1State == 1){
                FifthViewController.storedMapValues.append(FirstViewController.recommendationArray[27])
            }
            else{
                FifthViewController.storedMapValues.append(FirstViewController.recommendationArray[28])
            }
            FifthViewController.storedMapValues.append(FirstViewController.recommendationArray[30])
            FifthViewController.storedMapValues.append(FirstViewController.recommendationArray[33])
        }
}
}
