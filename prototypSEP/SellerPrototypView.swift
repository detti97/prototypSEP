//
//  SellerPrototypView.swift
//  prototypSEP
//
//  Created by Jan Dettler on 27.04.23.
//

import SwiftUI

struct SellerPrototypView: View {
    let validCredentials = [
        "User1": "password1",
        "user2": "password2",
        "user3": "password3"
    ]
    
    @State private var username = ""
    @State private var password = ""
    @State private var loginFailed = false
    @State private var isActiveLogin = true
    @State private var isActiveCheckout = true
    @State private var selectedDate = Date()
    
    var body: some View {
        
        NavigationView{
            
            if isActiveLogin{
                
                VStack {
                    Image(systemName: "checkmark.seal")
                        .font(.system(size: 50))
                        .foregroundColor(.blue)
                    
                    VStack {
                        TextField("Benutzername", text: $username)
                            .padding()
                            .background(Color.gray.opacity(0.2))
                            .cornerRadius(10)
                        
                        SecureField("Passwort", text: $password)
                            .padding()
                            .background(Color.gray.opacity(0.2))
                            .cornerRadius(10)
                        
                        if loginFailed {
                            Text("Ungültige Anmeldedaten.")
                                .foregroundColor(.red)
                        }
                        
                        Button("Log in") {
                            if let expectedPassword = validCredentials[username], expectedPassword == password {
                                print("Erfolgreich angemeldet als \(username)")
                                isActiveLogin = false
                                isActiveCheckout = true
                            } else {
                                loginFailed = true
                            }
                        }
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                        
                    }
                    .padding()
                }
            }
            if isActiveCheckout{
                
                Image(systemName: "person")
            }
        }
    }
}

struct SellerPrototypView_Previews: PreviewProvider {
    static var previews: some View {
        SellerPrototypView()
    }
}
