//
//  CustomDivider.swift
//  MoonShot
//
//  Created by Rishi Singh on 13/09/23.
//

import SwiftUI

struct CustomDivider: View {
    var body: some View {
        Rectangle()
            .frame(height: 2)
            .foregroundColor(.lightBackground)
            .padding(.vertical)
    }
}

struct CustomDivider_Previews: PreviewProvider {
    static var previews: some View {
        CustomDivider()
    }
}
