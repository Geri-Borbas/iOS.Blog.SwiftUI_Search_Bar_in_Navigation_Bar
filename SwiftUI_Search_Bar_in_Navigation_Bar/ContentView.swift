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
    
    
    let planets = Planets()
    @ObservedObject var searchBar: SearchBar = SearchBar()
    
    
    var body: some View
    {
        NavigationView
        {
            List(
                planets.all.filter
                {
                    searchBar.text.isEmpty ||
                    $0.id.localizedStandardContains(searchBar.text)
                }
            )
            {
                eachPlanet in
                HStack
                {
                    Image("\(eachPlanet.id) thumbnail")
                        .frame(width: 60, height: 60)
                    VStack(alignment: .leading, spacing: 0)
                    {
                        Text(eachPlanet.id)
                            .font(.title)
                            .fontWeight(.bold)
                        HStack
                        {
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
                .navigationBarTitle("Planets")
                .add(self.searchBar)
        }
            .navigationViewStyle(StackNavigationViewStyle())
    }
}


struct LabelStyle: ViewModifier
{
    
    
    func body(content: Content) -> some View
    {
        content
            .font(.caption)
            .foregroundColor(Color(.systemBackground))
            .padding(.horizontal, 5.0)
            .padding(.vertical, 2.0)
            .background(Color(.quaternaryLabel))
            .clipShape(Capsule())
    }
}



struct ContentView_Previews: PreviewProvider
{
    static var previews: some View
    { ContentView().environment(\.colorScheme, .dark) }
}
