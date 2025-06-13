//
//  ProfileScreen.swift
//  lab5_Umesh_Basnet
//
//  Created by Umesh Basnet on 2025-06-13.
//

import SwiftUI

struct ProfileScreen: View {
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var patient: Patient

    @State private var shouldShowError = false
    @State private var errorMessage = ""
    @State private var name = ""
    @State private var email = ""


    
    var body: some View {
        Form {
            TextField("Name", text: $name)
                .keyboardType(.namePhonePad)
            TextField("Email", text: $email)
                .keyboardType(.emailAddress)
           
            HStack{
                Spacer()
                Button {
                    guard !name.isEmpty else {
                        errorMessage = "Name cannot be empty"
                        shouldShowError = true
                        return
                    }

                    guard !email.isEmpty else {
                        errorMessage = "Email cannot be empty"
                        shouldShowError = true
                        return
                    }
                    patient.name = name
                    patient.email = email

                    dismiss()
                } label: {
                    Text("Save")
                }
                .buttonStyle(.borderedProminent)
                Spacer()
            }
            
           
        }
        .navigationTitle("Profile")
        .alert(errorMessage, isPresented: $shouldShowError) {
            Button("Ok") {

            }
        }
        .onAppear(){
            name = patient.name
            email = patient.email
        }

    }
}

#Preview {
    ProfileScreen()
        .environmentObject(Dummy.getPatient())
}
