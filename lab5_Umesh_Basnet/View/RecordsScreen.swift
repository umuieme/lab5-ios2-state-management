//
//  AccountScreen.swift
//  lab5_Umesh_Basnet
//
//  Created by Umesh Basnet on 2025-06-13.
//

import SwiftUI

struct RecordsScreen: View {
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var patient: Patient

    @State private var shouldShowError = false
    @State private var errorMessage = ""
    @State private var allergies = ""
    @State private var medicalHistory = ""

    var body: some View {
        Form {
            TextField("Allergies", text: $allergies)
            TextField("Medical History", text: $medicalHistory)
           
            HStack{
                Spacer()
                Button {
                   
                    patient.allergies = allergies
                    patient.medicalHistory = medicalHistory

                    dismiss()
                } label: {
                    Text("Save")
                }
                .buttonStyle(.borderedProminent)
                Spacer()
            }
            
           
        }
        .navigationTitle("Records")
        .onAppear(){
            allergies = patient.allergies
            medicalHistory = patient.medicalHistory
        }
    }
}

#Preview {
    RecordsScreen()
        .environmentObject(Dummy.getPatient())
}
