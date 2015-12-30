//
//  Page1ViewController.swift
//  iRecruit
//
//  Created by Plus Pingya on 12/30/2558 BE.
//  Copyright © 2558 Plus Pingya. All rights reserved.
//

import Foundation
import UIKit

class Page1ViewController: UIViewController {
    
    var profile: Profile!;
    
    @IBOutlet weak var firstName: UITextField!
    @IBOutlet weak var lastName: UITextField!
    @IBOutlet weak var age: UITextField!
    @IBOutlet weak var result: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.setHidesBackButton(true, animated:true);
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func onNext(sender: AnyObject) {
        
        let error = Profile.validate1(firstName.text!, lastName: lastName.text!, age: age.text!);
        if (error != Profile.getErrorMessage(ProfileError.NoError)) {
            result.text = error;
            return;
        }
        
        result.text = "";
        profile = Profile(firstName: firstName.text!, lastName: lastName.text!, age: age.text!);
        
        performSegueWithIdentifier("GotoPage2", sender: nil)
        
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if (segue.identifier == "GotoPage2") {
            let nextViewController = segue.destinationViewController as! Page2ViewController;
            nextViewController.profile = profile;
        }
    }
    
}
