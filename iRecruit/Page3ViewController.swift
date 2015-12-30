//
//  Page3Controller.swift
//  iRecruit
//
//  Created by Plus Pingya on 12/30/2558 BE.
//  Copyright © 2558 Plus Pingya. All rights reserved.
//

import Foundation
import UIKit

class Page3ViewController: UIViewController {
    
    var profile: Profile!;
    @IBOutlet weak var result: UILabel!
    @IBOutlet weak var button: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.setHidesBackButton(true, animated:true);
        profile.printData();

        setInitialUI();
        submitData();
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func setInitialUI() {
        button.hidden = true;
    }
    
    func setFinalUI() {
        button.hidden = false;
    }
    
    func submitData() {

        let urlPath: String = "http://localhost:8080/api/submit"
        let url: NSURL = NSURL(string: urlPath)!
        let request1: NSMutableURLRequest = NSMutableURLRequest(URL: url)
        
        request1.HTTPMethod = "POST"
        let stringPost =    "firstName=" + profile.firstName +
                            "&lastName=" + profile.lastName +
                            "&age=\(profile.age)" +
                            "&about=" + profile.about +
                            "&location=" + profile.location +
                            "&salary=\(profile.salary)"
        
        let data = stringPost.dataUsingEncoding(NSUTF8StringEncoding)
        
        request1.timeoutInterval = 60
        request1.HTTPBody=data
        request1.HTTPShouldHandleCookies=false
        
        let queue:NSOperationQueue = NSOperationQueue()
        
        NSURLConnection.sendAsynchronousRequest(request1, queue: queue, completionHandler:{response,data,error in
            self.responseDidReceived(data!);
        });
        
    }
    
    func responseDidReceived(data: NSData) {
        
        let jsonResult: NSDictionary = try! NSJSONSerialization.JSONObjectWithData(data, options: []) as! NSDictionary
        print("AsSynchronous\(jsonResult)")
        
        setFinalUI();
        
        let error = jsonResult.objectForKey("error");
        if ((error) != nil) {
            result.text = error as? String;
            return;
        }
        
        let res = jsonResult.objectForKey("result");
        if ((res) != nil) {
            result.text = res as? String;
            return;
        }
        
        result.text = "completed";
        
    }
    
}