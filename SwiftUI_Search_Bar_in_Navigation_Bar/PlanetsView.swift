//
//  ContentView.swift
//  SwiftUI_Search_Bar_in_Navigation_Bar
//
//  Created by Geri Borbás on 2020. 04. 27..
//  Copyright © 2020. Geri Borbás. All rights reserved.
//

import SwiftUI

struct PlanetsView: View {
    
    struct Planet: Identifiable, Hashable { let id, size, distance: String }
    let planets =
        [
            Planet(id: "Mercury", size: "2,440 km", distance: "0.4 AU"),
            Planet(id: "Venus", size: "6,052 km", distance: "0.7 AU"),
            Planet(id: "Earth", size: "6,378 km", distance: "1.0 AU"),
            Planet(id: "Mars", size: "3,397 km", distance: "1.5 AU"),
            Planet(id: "Jupiter", size: "71,493 km", distance: "5.2 AU"),
            Planet(id: "Saturn", size: "60,267 km", distance: "9.5 AU"),
            Planet(id: "Uranus", size: "25,557 km", distance: "19.2 AU"),
            Planet(id: "Neptune", size: "24,766 km", distance: "30.0 AU")
        ] +
        [
            Planet(id: "Ceres", size: "473 km", distance: "2.7 AU"),
            Planet(id: "Pluto", size: "1,187 km", distance: "39.4 AU"),
            Planet(id: "Haumea", size: "816 km", distance: "43.3 AU"),
            Planet(id: "Makemake", size: "715 km", distance: "45.8 AU"),
            Planet(id: "Eris", size: "1,163 km", distance: "67.7 AU")
        ]
    
    @ObservedObject var searchBar: SearchBar
    
    var body: some View {
        ScrollView {
            VStack {
                ForEach(
                    planets.filter {
                        searchBar.text.isEmpty ||
                        $0.id.localizedStandardContains(searchBar.text)
                    }
                ) { eachPlanet in
                    HStack {
                        Image("\(eachPlanet.id) thumbnail")
                            .frame(width: 60, height: 60)
                        VStack(alignment: .leading, spacing: 0) {
                            Text(eachPlanet.id)
                                .font(.title)
                                .fontWeight(.bold)
                            HStack {
                                Text("Radius")
                                    .modifier(LabelStyle())
                                Text(eachPlanet.size)
                                    .font(.body)
                                    .foregroundColor(Color(.tertiaryLabel))
                                Text("Distance")
                                    .modifier(LabelStyle())
                                Text(eachPlanet.distance)
                                    .font(.body)
                                    .foregroundColor(Color(.tertiaryLabel))
                            }
                        }
                            .shadow(color: Color.black, radius: 10)
                            .shadow(color: Color.black, radius: 10)
                    }
                }
            }
        }
    }
}

struct LabelStyle: ViewModifier {
    
    func body(content: Content) -> some View {
        content
            .font(.caption)
            .foregroundColor(Color(.systemBackground))
            .padding(.horizontal, 5.0)
            .padding(.vertical, 2.0)
            .background(Color(.quaternaryLabel))
            .clipShape(Capsule())
    }
}
