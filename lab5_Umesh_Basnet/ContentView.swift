//
//  ContentView.swift
//  lab5_Umesh_Basnet
//
//  Created by Umesh Basnet on 11/06/2025.
//

import SwiftUI

struct ContentView: View {
    @State var authState : AuthState = .login
    @StateObject var patient = Patient()
    var body: some View {
        Group {
            switch authState {
            case .login:
                LoginScreen(authState: $authState)
            case .register:
                RegisterScreen(authState: $authState)
            case .home:
                DashboardScreen(authState: $authState)
            }
        }
        .environmentObject(patient)
        
        
    }
}

#Preview {
    ContentView()
}
