//
//  MissionView.swift
//  MoonShot
//
//  Created by Rishi Singh on 12/09/23.
//

import SwiftUI

struct MissionView: View {
    struct CrewMember {
        let role: String
        let astronaut: Astronaut
    }
    let mission: Mission
    let crew: [CrewMember]
    
    var body: some View {
        GeometryReader { geo in
            ScrollView {
                VStack {
                    Image(mission.imageName)
                        .resizable()
                        .scaledToFit()
                        .frame(maxWidth: geo.size.width * 0.6)
                        .padding(.top)
                    
                    CustomDivider()
                        .padding(.horizontal)
                    
                    VStack(alignment: .leading) {
                        Text("Mission Highlight")
                            .font(.title.bold())
                            .padding(.bottom, 5)
                        
                        Text(mission.description)
                        
                        CustomDivider()
                        
                        Text("Crew")
                            .font(.title.bold())
                            .padding(.bottom, 5)
                    }
                    .padding(.horizontal)
                    
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack {
                            ForEach(crew, id: \.role) { crew in
                                NavigationLink {
                                    AstronautView(astronaut: crew.astronaut)
                                } label: {
                                    VStack(alignment: .leading) {
                                        Image(crew.astronaut.id)
                                            .resizable()
                                            .frame(width: 208, height: 144)
                                            .clipShape(RoundedRectangle(cornerRadius: 10))
                                            .overlay {
                                                RoundedRectangle(cornerRadius: 10)
                                                    .strokeBorder(.white, lineWidth: 2)
                                            }
                                        
                                        VStack(alignment: .leading) {
                                            Text(crew.astronaut.name)
                                                .font(.headline)
                                                .foregroundColor(.white)
                                            Text(crew.role)
                                                .foregroundColor(.secondary)
                                        }
                                    }
                                    .padding(.horizontal)
                                }
                            }
                        }
                    }
                }
                .padding(.bottom)
            }
        }
        .navigationTitle(mission.diaplayName)
        .navigationBarTitleDisplayMode(.inline)
        .background(.darkBackground)
    }
    
    init(mission: Mission, astranauts: [String: Astronaut]) {
        self.mission = mission
        self.crew = mission.crew.map { member in
            if let astranaut = astranauts[member.name] {
                return CrewMember(role: member.role, astronaut: astranaut)
            } else {
                fatalError("Missing \(member.name) in astronauts.json")
            }
        }
    }
}

struct MissionView_Previews: PreviewProvider {
    static let missions: [Mission] = Bundle.main.decode("missions.json")
    static let astranauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    static var previews: some View {
        MissionView(mission: missions[0], astranauts: astranauts)
            .preferredColorScheme(.dark)
    }
}
