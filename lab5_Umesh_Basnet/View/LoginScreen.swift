//
//  LoginScreen.swift
//  lab5_Umesh_Basnet
//
//  Created by Umesh Basnet on 11/06/2025.
//

import SwiftUI

struct LoginScreen: View {
    @EnvironmentObject var patient: Patient

    @Binding var authState: AuthState

    @State private var shouldShowError = false
    @State private var errorMessage = ""

    var body: some View {
        NavigationStack {
            Form {
                Text("Login")
                    .font(.title)
                TextField("Name", text: $patient.name)
                    .keyboardType(.namePhonePad)
                TextField("Email", text: $patient.email)
                    .keyboardType(.emailAddress)

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
                    
                    guard patient.email.isValidEmail() else {
                        errorMessage = "Email must be valid"
                        shouldShowError = true
                        return
                    }

                    authState = .home

                } label: {
                    Spacer()
                    Text("Login")
                    Spacer()
                }
                .buttonStyle(.borderedProminent)
                HStack {
                    Spacer()
                    Button("Regsiter") {
                        authState = .register
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
}

#Preview {
    LoginScreen(authState: .constant(.login))
        .environmentObject(Patient())
}
