//
//  RegisterScreen.swift
//  lab5_Umesh_Basnet
//
//  Created by Umesh Basnet on 11/06/2025.
//

import SwiftUI

struct RegisterScreen: View {
    @EnvironmentObject var patient: Patient
    @Binding var authState: AuthState

    @State private var shouldShowError = false
    @State private var errorMessage = ""

    
    
    
    var body: some View {
        Form {
            Text("Regsiter new user")
                .font(.title)
            TextField("Name", text: $patient.name)
            TextField("Email", text: $patient.email)
            TextField("Allergies", text: $patient.allergies)
            TextField("Medical history", text: $patient.medicalHistory)

            Button {
                guard !patient.name.isEmpty else {
                    errorMessage = "Name cannot be empty"
                    shouldShowError = true
                    return
                }

                guard !patient.email.isEmpty else {
                    errorMessage = "Email cannot be empty"
                    shouldShowError = true
                    return
                }

                authState = .home

            } label: {
                Spacer()
                Text("Register")
                Spacer()
            }
            .buttonStyle(.borderedProminent)
            HStack {
                Spacer()
                Button("Login") {
                    authState = .login
                }

                Spacer()
            }
        }        
        .alert(errorMessage, isPresented: $shouldShowError) {
            Button("Ok") {

            }
        }

    }
}

#Preview {
    RegisterScreen(authState: .constant(.register))
        .environmentObject(Patient())
}
