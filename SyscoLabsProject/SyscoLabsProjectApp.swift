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
    
    @ObservedObject private var splashViewModel = SplashViewModel()

    
    init() {
        self.splashViewModel.firstPlanetsPageLoader()
    }
    
    var body: some Scene {
        WindowGroup {
            SplashView()
        }
    }
}
