//
//  SplashViewModel.swift
//  SyscoLabsProject
//
//  Created by Kasun Jayasekara on 2023-09-17.
//

import Foundation

class SplashViewModel : ObservableObject {
    
    let jsonDataHandlling = JSONDataServices()

    
    func firstPlanetsPageLoader () {
        self.jsonDataHandlling.getAllPlanetsData(pageUrl: ConfigData.URLS.baseURL) {
            NotificationCenter.default.post(name: Notification.Name(ConfigData.NOTIFICATION_KEYS.initialLoadCompleted), object: nil)
        }
    }
    
}

