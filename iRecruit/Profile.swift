//
//  Profile.swift
//  iRecruit
//
//  Created by Plus Pingya on 12/30/2558 BE.
//  Copyright © 2558 Plus Pingya. All rights reserved.
//

import Foundation

enum ProfileError {
    case NoError
    case FirstNameIsMissing
    case LastNameIsMissing
    case AgeInvalid
    case AboutIsMissing
    case LocationIsMissing
    case SalaryIsMissing
}

class Profile {
    
    var id: String = "";
    var firstName: String = "";
    var lastName: String = "";
    var age: Int = 0;
    var about: String = "";
    var location: String = "";
    var salary: Int = 0;
    
    static let maxNameLength = 16;
    
    init(firstName: String, lastName: String, age: String) {
        self.firstName = firstName;
        self.lastName = lastName;
        self.age = Int(age)!;
    }
    
    func setData(about: String, location: String, salary: String) {
        self.about = about;
        self.location = location;
        self.salary = Int(salary)!;
    }
    
    func printData() {
        print("==================================");
        print("Name: " + firstName + " " + lastName);
        print("Age: \(age)");
        print("About: " + about);
        print("Location: " + location);
        print("Expected salary: \(salary)");
    }
    
    static func isStringEmpty(string: String) -> Bool {
        return (string == "");
    };
    
    static func getErrorMessage(errorEnum: ProfileError) -> String {
        
        switch errorEnum {
        case .NoError:                  return ""
        case .FirstNameIsMissing:       return "First name is missing!"
        case .LastNameIsMissing:        return "Last name is missing!"
        case .AgeInvalid:               return "Age is missing!"
        case .AboutIsMissing:           return "About is missing!"
        case .LocationIsMissing:        return "Location is missing!"
        case .SalaryIsMissing:          return "Salary is missing!"
        }
        
    }
    
    /** validate firstName, lastName, and age */
    static func validate1(firstName: String, lastName: String, age: String) -> String {
        
        if (isStringEmpty(firstName)) {
            return getErrorMessage(ProfileError.FirstNameIsMissing);
        }
        
        if (isStringEmpty(lastName)) {
            return getErrorMessage(ProfileError.LastNameIsMissing);
        }
        
        if (isStringEmpty(age)) {
            return getErrorMessage(ProfileError.AgeInvalid);
        }
        
        return getErrorMessage(ProfileError.NoError);
        
    }
    
    static func validate2(about: String, location: String, salary: String) -> String {
        
        if (isStringEmpty(about)) {
            return getErrorMessage(ProfileError.AboutIsMissing);
        }
        
        if (isStringEmpty(location)) {
            return getErrorMessage(ProfileError.LocationIsMissing);
        }
        
        if (isStringEmpty(salary)) {
            return getErrorMessage(ProfileError.SalaryIsMissing);
        }
        
        return getErrorMessage(ProfileError.NoError);
    }
    
}
