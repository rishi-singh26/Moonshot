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
    
    let columns = [GridItem(.adaptive(minimum: 150))]
    
    @State private var showingList = false
    
    var body: some View {
        NavigationView {
            Group {
                if showingList {
                    List(missions) { mission in
                        NavigationLink {
                            MissionView(mission: mission, astranauts: astronauts)
                        } label: {
                            MissionListItem(mission: mission)
                        }
                    }
                } else {
                    ScrollView {
                        LazyVGrid(columns: columns) {
                            ForEach(missions) { mission in
                                NavigationLink {
                                    MissionView(mission: mission, astranauts: astronauts)
                                } label: {
                                    MissionGridItem(mission: mission)
                                }
                            }
                        }
                        .padding([.horizontal, .bottom])
                    }
                }
            }
            .navigationTitle("Moonshot")
            .toolbar {
                Button {
                    showingList.toggle()
                } label: {
                    Image(systemName: showingList ? "square.grid.2x2" : "list.bullet")
                }
                
            }

        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
