//
//  PlanetsData.swift
//  SyscoLabsProject
//
//  Created by Kasun Jayasekara on 2023-09-16.
//

import Foundation

class PlanetsData: NSObject,ObservableObject {
    
    var selectdPlanetName : String = ""
    
    var nextPage : String? = nil
    var previousPage : String? = nil
    
    @Published var planetName : [String] = []
    @Published var planetClimate : [String] = []
    
    var planetOrbitalPeriod : [String] = []
    var planetGravity : [String] = []

    static let sharedInstance = PlanetsData()
    
    private override init() {
    }
    
    
}
