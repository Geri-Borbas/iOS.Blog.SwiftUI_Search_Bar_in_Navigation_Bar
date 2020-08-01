//
//  RootView.swift
//  SwiftUI_Search_Bar_in_Navigation_Bar
//
//  Created by Geri Borbás on 2020. 07. 31..
//  Copyright © 2020. Geri Borbás. All rights reserved.
//

import SwiftUI

struct RootView: View {
        
    var body: some View {
        NavigationView {
            NavigationLink(destination: PlanetsView()) {
                Text("PlanetsView")
            }
                .navigationViewStyle(StackNavigationViewStyle())
        }
    }
}
