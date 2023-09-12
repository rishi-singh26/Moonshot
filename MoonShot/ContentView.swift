//
//  ContentView.swift
//  MoonShot
//
//  Created by Rishi Singh on 11/09/23.
//

import SwiftUI

struct User: Codable {
    let name: String
    let address: Address
}

struct Address: Codable {
    let street: String
    let city: String
}

struct ContentView: View {
    var body: some View {
        Button("Decode JSON") {
            let input = """
                        {
                            "name": "Talor Swift",
                            "address": {
                                "street": "1st street 2nd lane",
                                "city": "Nashville"
                            }
                        }
                        """
            let data = Data(input.utf8)
            if let user = try? JSONDecoder().decode(User.self, from: data) {
                print(user)
            } else {
                print("Error")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
