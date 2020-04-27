//
//  ContentView.swift
//  SwiftUI_Search_Bar_in_Navigation_Bar
//
//  Created by Geri Borbás on 2020. 04. 27..
//  Copyright © 2020. Geri Borbás. All rights reserved.
//

import SwiftUI



struct ContentView: View
{
    
    
    var planets =
        ["Mercury", "Venus", "Earth", "Mars", "Jupiter", "Saturn", "Uranus", "Neptune"] +
        ["Ceres", "Pluto", "Haumea", "Makemake", "Eris"]
    
    
    @ObservedObject var searchControllerProvider: SearchControllerProvider = SearchControllerProvider()
    
    
    var body: some View
    {
        NavigationView
        {
            List
            {                
                ForEach(
                    planets.filter
                    {
                        searchControllerProvider.searchText.isEmpty ||
                        $0.localizedStandardContains(searchControllerProvider.searchText)
                    },
                    id: \.self
                )
                {
                    eachPlanet in
                    Text(eachPlanet)
                }
            }
                .navigationBarTitle("Planets")
                .overlay(
                    ViewControllerResolver
                    {
                        viewController in
                        viewController.navigationItem.searchController = self.searchControllerProvider.searchController
                    }
                        .frame(width: 0, height: 0)
                )
        }
    }
}
