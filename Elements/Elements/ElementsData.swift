//
//  ElementsData.swift
//  Elements
//
//  Created by Brendon Cecilio on 12/19/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import Foundation

struct Elements: Codable {
    let name: String
    let number: Int
    let symbol: String
    let discoveredBy: String?
    let melt: Double?
    let boil: Double?
    let id: String?
    let favoritedBy: String?
    let atomicMass: Double?
    
    enum CodingKeys: String, CodingKey {
        case discoveredBy = "discovered_by"
        case melt
        case boil
        case symbol
        case name
        case number
        case id
        case favoritedBy
        case atomicMass = "atomic_mass"
    }
}
