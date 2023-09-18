//
//  PlanetsDetailViewModel.swift
//  SyscoLabsProject
//
//  Created by Kasun Jayasekara on 2023-09-17.
//

import Foundation


class PlanetsDetailViewModel : ObservableObject {
    
    let planetsData = PlanetsData.sharedInstance
    
    func getTheSelectedPlanetIndex(selectedPlanet:String) -> Int {
        if let index = planetsData.planetName.firstIndex(of: selectedPlanet) {
            return index
        } else {
            return 0
        }
    }

}

