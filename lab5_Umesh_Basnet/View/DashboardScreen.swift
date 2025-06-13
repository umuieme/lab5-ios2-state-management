//
//  DashboardScreen.swift
//  lab5_Umesh_Basnet
//
//  Created by Umesh Basnet on 11/06/2025.
//

import SwiftUI

struct DashboardScreen: View {
    
    @EnvironmentObject var patient : Patient
    @Binding var authState : AuthState

    
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading, spacing: 8) {
                Text("Good \(Utilities.getTimeOfDay()),")
                    .font(.title2)
                Text(patient.name)
                    .font(.largeTitle)
                HStack {
                    Text("Email:")
                    Text(patient.email)
                        .foregroundStyle(.blue)
                        .underline()
                }
                HStack {
                    Text("Allergies:")
                    Text(patient.allergies)
                }
                HStack {
                    Text("History:")
                    Text(patient.medicalHistory)
                    Spacer()
                }
                Spacer()
            }
            .frame(maxWidth: .infinity)
            .padding()
            .navigationTitle("Umesh Basnet")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Menu {
                        NavigationLink("Profile") {
                            ProfileScreen()
                        }
                        NavigationLink("Records") {
                            RecordsScreen()
                        }
                        Button("Logout") {
                            patient.clear()
                            authState = .login
                        }
                    } label: {
                        Image(systemName: "gear")
                    }
                }
            }
            
        }
        
    }
}

#Preview {
    DashboardScreen(authState: .constant(.home))
        .environmentObject(
            Dummy.getPatient()
        )
}
