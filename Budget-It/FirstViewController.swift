//
//  FirstViewController.swift
//  RecommendMii
//
import UIKit
import Firebase
import FirebaseDatabase

class FirstViewController: UIViewController {
    public static var infoArray = [String?]()
    public static var setArray = [String?]()
    public static var recommendationArray = [String?]()
    public static var mixList = [String?]()
    public static var userName = "";
    
    var ref: DatabaseReference?
    
    @IBOutlet weak var Text1: UITextField!
    
    func runTimedCode() {
    
        //create the session object
        let session = URLSession.shared
        
        let keywordArray = ["ceeps","chatime","chipotle","coco","congee","dostacos","frog","happy","jacks","nandos","ozen","sharetea"];
        
        let recommendationsArray = ["BBT/set1.json","BBT/set2.json","BBT/set3.json","Dinner/set1.json","Dinner/set2.json","Dinner/set3.json","Lit-day/set1.json","Lit-day/set2.json","Lit-day/set3.json"];
        
        
        let url = URL(string: "https://recommendmii-343b5.firebaseio.com/users/1/recommendations.json")!
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
                let json = try JSONSerialization.jsonObject(with: data, options: []) as! Dictionary<String,AnyObject>
                for (key, value) in json {
                    FirstViewController.mixList.append(key as? String);
                }
            } catch let error {
                print(error.localizedDescription)
            }
        })
        task.resume()
        
        var count = 0;
        
        while (count < 12){
            let url = URL(string: "https://recommendmii-343b5.firebaseio.com/vendors/" + keywordArray[count] + ".json")!
            print ("===========================")
            print (url)
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
                    let json = try JSONSerialization.jsonObject(with: data, options: []) as! Dictionary<String,AnyObject>
                    for (key, value) in json {
                        print("\(key) -> \(value)")
                        FirstViewController.infoArray.append(value as? String);
                    }
                } catch let error {
                    print(error.localizedDescription)
                }
            })
            count = count + 1;
            task.resume()
        }
        
        var newcount = 0
        while (newcount < 9){
            let url = URL(string: "https://recommendmii-343b5.firebaseio.com/users/1/recommendations/" + recommendationsArray[newcount])!
            print ("===========================")
            print (url)
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
                    let json = try JSONSerialization.jsonObject(with: data, options: []) as! NSArray
                    //for (key, value) in json {
                    FirstViewController.recommendationArray.append(json[0] as? String);
                    FirstViewController.recommendationArray.append(json[1] as? String);
                    FirstViewController.recommendationArray.append(json[2] as? String);
                     //   print("adding to list (THE VALUE AS STRING)")
                     //   print("\(key) -> \(value)")
                    //}
                } catch let error {
                    print(error.localizedDescription)
                }
            })
            newcount = newcount + 1;
            task.resume()
        }
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
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        runTimedCode()
        
        
        //var gameTimer: Timer!
        
        //gameTimer = Timer.scheduledTimer(timeInterval: 50, target: self, selector: #selector(runTimedCode), userInfo: nil, repeats: true)
        
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
