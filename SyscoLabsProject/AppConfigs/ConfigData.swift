//
//  ConfigData.swift
//  SyscoLabsProject
//
//  Created by Kasun Jayasekara on 2023-09-17.
//

import Foundation

struct ConfigData {
    
    static let server = "https://swapi.dev"
    
    struct URLS {
        static let baseURL = server + "/api/planets"
        static let pageURL = server + "/api/planets/?page="
    }
    
}
