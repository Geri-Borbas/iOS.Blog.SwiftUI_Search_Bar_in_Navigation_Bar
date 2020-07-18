//
//  Planets.swift
//  SwiftUI_Search_Bar_in_Navigation_Bar
//
//  Created by Geri Borbás on 2020. 05. 28..
//  Copyright © 2020. Geri Borbás. All rights reserved.
//

import Foundation

struct Planets: Decodable {
    
    let bodies: [Planet]
    
    struct Planet: Decodable {
        
        let id: String
        let englishName: String
        let isPlanet: Bool
        let perihelion: Int32
        let aphelion: Int32
        let meanRadius: Double
    }
}
