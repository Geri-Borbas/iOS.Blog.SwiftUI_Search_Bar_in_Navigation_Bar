//
//  ParentResolverViewController+SearchController.swift
//  SwiftUI_Search_Bar_in_Navigation_Bar
//
//  Created by Geri Borbás on 2020. 08. 01..
//  Copyright © 2020. Geri Borbás. All rights reserved.
//

import SwiftUI

extension ParentResolverViewController {
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        if let searchController = self.parent?.navigationItem.searchController {
            searchController.hidesNavigationBarDuringPresentation = false
            UIView.performWithoutAnimation {
                searchController.isActive = false
                searchController.isActive = true
            }
        }
    }
}
