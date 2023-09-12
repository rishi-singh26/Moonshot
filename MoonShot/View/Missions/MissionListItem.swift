//
//  MissionListItem.swift
//  MoonShot
//
//  Created by Rishi Singh on 13/09/23.
//

import SwiftUI

struct MissionListItem: View {
    let mission: Mission
    var body: some View {
        HStack {
            Image(mission.imageName)
                .resizable()
                .scaledToFit()
                .frame(width: 60, height: 60)
                .padding(.trailing)
            
            VStack(alignment: .leading) {
                Text(mission.diaplayName)
                    .font(.headline)
                Text(mission.formattedLaunchDate)
                    .font(.caption)
            }
        }
    }
}

struct MissionListItem_Previews: PreviewProvider {
    static let missions: [Mission] = Bundle.main.decode("missions.json")

    static var previews: some View {
        MissionListItem(mission: missions[0])
    }
}
