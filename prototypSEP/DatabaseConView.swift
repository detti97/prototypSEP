//
//  DatabaseConView.swift
//  prototypSEP
//
//  Created by Jan Dettler on 29.04.23.
//

import SwiftUI

struct TestUser: Codable {
    let name: String
}

struct DatabaseConView: View {
    @State private var name: String = ""
    
    var body: some View {
        VStack {
            TextField("Name", text: $name)
                .padding()
                
            Button(action: {
                let test = TestUser(name: name)
                guard let data = try? JSONEncoder().encode(test) else {
                    return
                }
                guard let url = URL(string: "http://131.173.65.77:3000/test-user") else {
                    return
                }
                var request = URLRequest(url: url)
                request.httpMethod = "POST"
                request.setValue("application/json", forHTTPHeaderField: "Content-Type")
                request.httpBody = data
                let task = URLSession.shared.dataTask(with: request){ data, response, error in guard let data = data else {
                    return
                }
                    if let httpResponse = response as? HTTPURLResponse,
                                           httpResponse.statusCode == 200 {
                                            print("Name erfolgreich gesendet")
                                        }
                }
                task.resume()
                name = ""
            }){
                Text("Namen senden")
            }
            }
        }
}

struct DatabaseConView_Previews: PreviewProvider {
    static var previews: some View {
        DatabaseConView()
    }
}
