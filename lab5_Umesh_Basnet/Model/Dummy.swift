//
//  Dummy.swift
//  lab5_Umesh_Basnet
//
//  Created by Umesh Basnet on 2025-06-13.
//

class Dummy {
    
    private init(){
        
    }
    
    static func getPatient() -> Patient {
        return Patient(name: "Luffy", email: "luffy@strawhat.com", allergies: "brain", medicalHistory: "suffernig from greatness")
    }
}
