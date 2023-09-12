//
//  AstronautView.swift
//  MoonShot
//
//  Created by Rishi Singh on 13/09/23.
//

import SwiftUI

struct AstronautView: View {
    let astronaut: Astronaut
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                Image(astronaut.id)
                    .resizable()
                    .scaledToFit()
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    .padding(.top)
                
                CustomDivider()
                
                Text(astronaut.name)
                    .font(.title.bold())
                    .padding(.bottom, 5)
                
                Text(astronaut.description)
            }
            .padding(.horizontal)
        }
        .background(.darkBackground)
        .preferredColorScheme(.dark)
    }
}

struct AstronautView_Previews: PreviewProvider {
    static let astranauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    static var previews: some View {
        AstronautView(astronaut: astranauts["grissom"]!)
    }
}
