//
//  ContentView.swift
//  MoonShot
//
//  Created by Rishi Singh on 11/09/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            List(0..<100) { row in
                NavigationLink {
                    Text("Detail view \(row)")
                } label: {
                    Text("Hello world \(row)")
                }
            }
            .listStyle(.sidebar)
            .navigationTitle("SwiftUI")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
