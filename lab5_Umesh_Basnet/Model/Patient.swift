//
//  Patient.swift
//  lab5_Umesh_Basnet
//
//  Created by Umesh Basnet on 11/06/2025.
//

import Foundation

class Patient : ObservableObject {
    @Published var name : String
    @Published var email: String
    @Published var allergies: [String]
    @Published var medicalHistory: String
    
    init() {
        self.name = ""
        self.email = ""
        self.allergies = []
        self.medicalHistory = ""
    }
    
    init(name: String, email: String, allergies: [String], medicalHistory: String) {
        self.name = name
        self.email = email
        self.allergies = allergies
        self.medicalHistory = medicalHistory
    }
    
}
