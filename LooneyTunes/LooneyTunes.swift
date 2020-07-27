//
//  LooneyTunes.swift
//  LooneyTunes
//
//  Created by Eric Carroll on 7/25/20.
//  Copyright © 2020 Eric Carroll. All rights reserved.
//

import Foundation

class LooneyTunes: ObservableObject {
    @Published var looneyTunes: [LooneyTune]
    
    init() {
        self.looneyTunes = Bundle.main.decode([LooneyTune].self, from: "LooneyTunes.json")
    }
}

class LooneyTune: Codable, Identifiable {
    let id: Int
    let name: String
    let description: String
    let rarity: String
    let region: String
    let role: String
    let toonTags: [String]
    let maxPower: Int
    let maxAttack: Int
    let maxDefense: Int
    let maxHealth: Int
    let maxSpeed: Int
    let relationships: [String]
    let skills: [String]
    let image: String
}

