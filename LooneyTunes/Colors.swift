//
//  Colors.swift
//  LooneyTunes
//
//  Created by Eric Carroll on 7/25/20.
//  Copyright © 2020 Eric Carroll. All rights reserved.
//

import SwiftUI

extension Color {
    static let offWhite = Color(red: 225 / 255, green: 225 / 255, blue: 235 / 255)
    static let darkStart = Color(red: 50 / 255, green: 60 / 255, blue: 65 / 255)
    static let darkEnd = Color(red: 25 / 255, green: 25 / 255, blue: 30 / 255)
    static let lightStart = Color(red: 60 / 255, green: 160 / 255, blue: 240 / 255)
    static let lightEnd = Color(red: 30 / 255, green: 80 / 255, blue: 120 / 255)
    static let lightBlue = Color(red: 135 / 255, green: 206 / 255, blue: 250 / 255)
    static let ghostWhite = Color(red: 248 / 255, green: 248 / 255, blue: 255 / 255)
    static let ivory = Color(red: 255 / 255, green: 255 / 255, blue: 240 / 255)
    static let teal = Color(red: 0 / 255, green: 255 / 255, blue: 255 / 255)
    static let whiteSmoke = Color(red: 245 / 255, green: 245 / 255, blue: 245 / 255)
    static let goldYellow = Color(red: 248 / 255, green: 239 / 255, blue: 0 / 255)
    static let lightSeaGreen = Color(red: 32 / 255, green: 178 / 255, blue: 170 / 255)
    static let metallicGold = Color(red: 190 / 255, green: 183 / 255, blue: 2 / 255)
    static let greenYellow = Color(red: 173 / 255, green: 255 / 255, blue: 47 / 255)
    static let yellowGreen = Color(red: 154 / 255, green: 205 / 255, blue: 50 / 255)
    static let deepPink = Color(red: 255 / 255, green: 20 / 255, blue: 147 / 255)
    static let crimson = Color(red: 220 / 255, green: 20 / 255, blue: 60 / 255)
    static let fluorescentOrange = Color(red: 255 / 255, green: 191 / 255, blue: 0 / 255)
    static let darkOrange = Color(red: 255 / 255, green: 140 / 255, blue: 0 / 255)
    static let mediumSlateBlue = Color(red: 123 / 255, green: 104 / 255, blue: 238 / 255)
    static let mediumPurple = Color(red: 147 / 255, green: 112 / 255, blue: 219 / 255)
    static let indigo = Color(red: 75 / 255, green: 0 / 255, blue: 130 / 255)
    static let lemonChiffon = Color(red: 255 / 255, green: 250 / 255, blue: 205 / 255)
    static let olive = Color(red: 139 / 255, green: 143 / 255, blue: 19 / 255)
    static let oliveYellow = Color(red: 187 / 255, green: 228 / 255, blue: 30 / 255)
    static let fuchsia = Color(red: 246 / 255, green: 58 / 255, blue: 246 / 255)
    static let purple2 = Color(red: 181 / 255, green: 43 / 255, blue: 181 / 255)
    static let lawBorder = Color(red: 104 / 255, green: 104 / 255, blue: 233 / 255)
    static let law = Color(red: 75 / 255, green: 75 / 255, blue: 168 / 255)
}

let tuneColors: [Int : [Color]] = [1: [Color.lightSeaGreen, Color.teal],
                                        2: [Color.metallicGold, Color.goldYellow],
                                        3: [Color.yellowGreen, Color.greenYellow],
                                        4: [Color.crimson, Color.deepPink],
                                        5: [Color.fluorescentOrange, Color.darkOrange],
                                        6: [Color.blue, Color.green],
                                        40: [Color.blue, Color.green],
                                        50: [Color.blue, Color.green],
                                        60: [Color.blue, Color.green]
    
]
