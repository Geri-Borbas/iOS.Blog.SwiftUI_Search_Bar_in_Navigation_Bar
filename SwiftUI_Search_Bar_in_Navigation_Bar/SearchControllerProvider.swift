//
//  SearchControllerProvider.swift
//  SwiftUI_Search_Bar_in_Navigation_Bar
//
//  Created by Geri Borbás on 2020. 04. 27..
//  Copyright © 2020. Geri Borbás. All rights reserved.
//

import SwiftUI


class SearchControllerProvider: NSObject, ObservableObject
{
    
    
    @Published var searchText: String = ""
    let searchController: UISearchController = UISearchController(searchResultsController: nil)
    
    
    override init()
    {
        super.init()
        self.searchController.obscuresBackgroundDuringPresentation = false
        self.searchController.searchResultsUpdater = self
    }
}


extension SearchControllerProvider: UISearchResultsUpdating
{
   
    
    func updateSearchResults(for searchController: UISearchController)
    {
        // Publish search text changes.
        if let searchText = searchController.searchBar.text
        { self.searchText = searchText }
    }
}


struct SearchControllerProviderModifier: ViewModifier
{
    
    
    let searchControllerProvider: SearchControllerProvider
    
    
    func body(content: Content) -> some View
    {
        content
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


extension View
{
    
    
    func addSearchControllerToNavigationBar(from searchControllerProvider: SearchControllerProvider) -> some View
    { return self.modifier(SearchControllerProviderModifier(searchControllerProvider: searchControllerProvider)) }
}
