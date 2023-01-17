//
//  Mission.swift
//  Moonshoot
//
//  Created by Harish on 28/12/22.
//

import Foundation

struct Mission: Codable, Identifiable {
    //Nested Types
    struct CrewRole: Codable {
        let name: String
        let role: String
    }
    
    let id: Int
    let description: String
    let launchDate: Date?
    let crew: [CrewRole]
    
    var displayName: String {
        "Apollo \(id)"
    }
    
    var image: String {
        "apollo\(id)"
    }
    
    var formattedLaunchDate: String {
        launchDate?.formatted(date: .abbreviated, time: .omitted) ?? "N/A"
    }
}

