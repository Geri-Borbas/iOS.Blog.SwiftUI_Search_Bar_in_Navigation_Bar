//
//  PlanetsViewModel.swift
//  SwiftUI_Search_Bar_in_Navigation_Bar
//
//  Created by Geri Borbás on 2020. 05. 28..
//  Copyright © 2020. Geri Borbás. All rights reserved.
//

import Foundation


class PlanetsViewModel
{
    
   
    let url = URL(string:
        "https://api.le-systeme-solaire.net/rest/bodies/" +
        "?data=id,englishName,isPlanet,perihelion,aphelion,meanRadius" +
        "&filter[]=isPlanet,neq,false"
        )!
    
    
    func fetch()
    {
        let task = URLSession.shared.dataTask(with: url, completionHandler:
        {
            data, response, error in
            
            // Log.
            print(response)
            
            // Check error.
            if error != nil
            {
                print(error)
                return
            }
            
            do
            {
                let json = try JSONDecoder().decode(Planets.self, from: data! )
                print(json)
            }
            catch
            { print("Error during JSON serialization: \(error.localizedDescription)") }
        })
        task.resume()
    }
}
