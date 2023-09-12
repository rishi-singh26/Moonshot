//
//  MissionGridItem.swift
//  MoonShot
//
//  Created by Rishi Singh on 13/09/23.
//

import SwiftUI

struct MissionGridItem: View {
    let mission: Mission
    var body: some View {
        VStack {
            Image(mission.imageName)
                .resizable()
                .scaledToFit()
                .frame(width: 100, height: 100)
                .padding([.top, .leading, .trailing])
            
            VStack {
                Text(mission.diaplayName)
                    .font(.headline)
                    .foregroundColor(.primary)
                Text(mission.formattedLaunchDate)
                    .font(.caption)
                    .foregroundColor(.primary)
            }
            .padding(.vertical)
            .frame(maxWidth: .infinity)
        }
        .shadow(radius: 10)
    }
}

struct MissionGridItem_Previews: PreviewProvider {
    static let missions: [Mission] = Bundle.main.decode("missions.json")

    static var previews: some View {
        MissionGridItem(mission: missions[0])
    }
}
