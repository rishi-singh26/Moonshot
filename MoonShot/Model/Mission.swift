//
//  Mission.swift
//  MoonShot
//
//  Created by Rishi Singh on 12/09/23.
//

import Foundation

struct Mission: Codable, Identifiable {
    struct CrewRole: Codable {
        let name: String
        let role: String
    }

    let id: Int
    let launchDate: Date?
    let crew: [CrewRole]
    let description: String
    
    var diaplayName: String {
        return "Apollo \(id)"
    }
    
    var imageName: String {
        return "apollo\(id)"
    }
    
    var formattedLaunchDate: String {
        return launchDate?.formatted(date: .abbreviated, time: .omitted) ?? "N/A"
    }
}
