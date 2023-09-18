//
//  AppUtils.swift
//  SyscoLabsProject
//
//  Created by Kasun Jayasekara on 2023-09-15.
//

import UIKit
import Alamofire

struct AppUtils {
    
    static var width: CGFloat {
        return UIScreen.main.bounds.size.width
    }
    
    static var height: CGFloat {
        return UIScreen.main.bounds.height
    }
    
    struct Connectivity {
        static let sharedInstance = NetworkReachabilityManager()!
        static var isConnectedToInternet:Bool {
            return self.sharedInstance.isReachable
        }
    }
}
