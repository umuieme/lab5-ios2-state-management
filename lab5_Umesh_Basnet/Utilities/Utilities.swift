//
//  Utilities.swift
//  lab5_Umesh_Basnet
//
//  Created by Umesh Basnet on 2025-06-13.
//

import Foundation

class Utilities {
    
    private init(){
        
    }
    
    static func getTimeOfDay() -> String {
        let date = Date()
        let calendar = Calendar.current
        let hour = calendar.component(.hour, from: date)
        
        if hour < 12 {
            return "Morning"
        }
        
        if hour < 18 {
            return "Afternoon"
        }
        
        return "Evening"
    }
    
}

extension String {
    
    func isValidEmail() -> Bool {
        let regex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPredicaet = NSPredicate(format: "SELF MATCHES %@", regex)
        return emailPredicaet.evaluate(with: self)
    }
    
}
