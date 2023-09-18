//
//  SyscoLabsProjectApp.swift
//  SyscoLabsProject
//
//  Created by Kasun Jayasekara on 2023-09-14.
//

import SwiftUI

@main
struct SyscoLabsProjectApp: App {
    
    let jsonDataHandlling = JSONDataServices()
    
    init() {
        self.jsonDataHandlling.getAllPlanetsData()
    }
    
    var body: some Scene {
        WindowGroup {
            SplashView()
        }
    }
}
