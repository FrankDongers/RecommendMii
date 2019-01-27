//
//  FirstViewController.swift
//  RecommendMii
//
//
import UIKit

class viewController: UIViewController {

    
    @IBOutlet weak var myWebView: UIWebView!
    
    @IBOutlet weak var advisorView: UIWebView!
    
    override func viewDidLoad() {
        myWebView.loadRequest(URLRequest(url: URL(string: "https://my.wealthsimple.com/app/start?")!))
        advisorView.loadRequest(URLRequest(url: URL(string: "https://bot.dialogflow.com/remembermii")!))
        super.viewDidLoad()
        //Uncomment the line below if you want the tap n
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}


