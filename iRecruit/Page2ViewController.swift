//
//  Page2ViewController.swift
//  iRecruit
//
//  Created by Plus Pingya on 12/30/2558 BE.
//  Copyright © 2558 Plus Pingya. All rights reserved.
//

import Foundation
import UIKit

class Page2ViewController: UIViewController {
    
    var profile: Profile!
    
    @IBOutlet weak var about: UITextView!
    @IBOutlet weak var location: UITextField!
    @IBOutlet weak var salary: UITextField!
    @IBOutlet weak var result: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.setHidesBackButton(true, animated:true);
        profile.printData();
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func onSubmit(sender: AnyObject) {
        
        let error = Profile.validate2(about.text!, location: location.text!, salary: salary.text!);
        if (error != Profile.getErrorMessage(ProfileError.NoError)) {
            result.text = error;
            return;
        }
        
        result.text = "";
        
        profile.setData(about.text, location: location.text!, salary: salary.text!);
        
        performSegueWithIdentifier("GotoPage3", sender: nil)
        
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if (segue.identifier == "GotoPage3") {
            let nextViewController = segue.destinationViewController as! Page3ViewController;
            nextViewController.profile = profile;
        }
    }
    
}