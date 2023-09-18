//
//  StatusData.swift
//  SyscoLabsProject
//
//  Created by Kasun Jayasekara on 2023-09-16.
//

import Foundation

class StatusData: NSObject, ObservableObject {
    
    @Published var isAppReadyFirstLounch: Bool = false
    @Published var currentPageCount: Int = 1

    static let sharedInstance = StatusData()
    
    private override init() {
    }
    
}
