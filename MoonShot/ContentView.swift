//
//  ContentView.swift
//  MoonShot
//
//  Created by Rishi Singh on 11/09/23.
//

import SwiftUI

struct ContentView: View {
    let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    let missions: [Mission] = Bundle.main.decode("missions.json")

    var body: some View {
        VStack {
            Text("\(astronauts.count)")
            Text("\(missions.count)")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
