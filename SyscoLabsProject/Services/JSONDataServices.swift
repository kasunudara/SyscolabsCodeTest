//
//  JSONDataServices.swift
//  SyscoLabsProject
//
//  Created by Kasun Jayasekara on 2023-09-15.
//

import Foundation
import Alamofire

class JSONDataServices {
    
    let planetsData = PlanetsData.sharedInstance
    
    //MARK: - Check Next Page Avilability
    func checkAvilabilityOfNextPage(pageUrl:String,currentPageCount:Int,completion: @escaping (Bool) -> Void)  {
        AF.request(pageUrl+String(currentPageCount), method: .get, parameters: nil, encoding: URLEncoding.default, headers: nil, interceptor: nil).responseJSON { response in
            switch response.result {
            case .success(let data):
                if let outcome = data as? NSDictionary {
                    if outcome["next"] is String {
                        completion(true)
                    } else {
                        completion(false)
                    }
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    //MARK: - Get Planet data for first loading
    func getAllPlanetsData(pageUrl:String,completion: @escaping () -> Void) {
        AF.request(pageUrl, method: .get, parameters: nil, encoding: URLEncoding.default, headers: nil, interceptor: nil).responseJSON { response in
            switch response.result {
            case .success(let data):
                let jsonDictionary = data as! NSDictionary
                let mainResultArray = jsonDictionary["results"] as! [[String : AnyObject]]
                if mainResultArray.isEmpty == false {
                    for contentObject in mainResultArray {
                        print("\(contentObject["name"] as! String)")
                        self.planetsData.planetName.append(contentObject["name"] as! String)
                        self.planetsData.planetClimate.append(contentObject["climate"] as! String)
                        self.planetsData.planetOrbitalPeriod.append(contentObject["orbital_period"] as! String)
                        self.planetsData.planetGravity.append(contentObject["gravity"] as! String)
                    }
                    completion()
                } else {
                    print("Empty Result Array")
                }
                
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    //MARK: - Get Planet data for Page loading
    func getSinglePlanetPageData(pageUrl:String,currentPageCount:Int,completion: @escaping () -> Void) {
        AF.request(pageUrl+String(currentPageCount), method: .get, parameters: nil, encoding: URLEncoding.default, headers: nil, interceptor: nil).responseJSON { response in
            switch response.result {
            case .success(let data):
                let jsonDictionary = data as! NSDictionary
                let mainResultArray = jsonDictionary["results"] as! [[String : AnyObject]]
                if mainResultArray.isEmpty == false {
                    for contentObject in mainResultArray {
                        print("\(contentObject["name"] as! String)")
                        self.planetsData.planetName.append(contentObject["name"] as! String)
                        self.planetsData.planetClimate.append(contentObject["climate"] as! String)
                        self.planetsData.planetOrbitalPeriod.append(contentObject["orbital_period"] as! String)
                        self.planetsData.planetGravity.append(contentObject["gravity"] as! String)
                    }
                    completion()
                } else {
                    print("Empty Result Array")
                }
                
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    
}
























