//
//  PlanetsHomeViewModel.swift
//  SyscoLabsProject
//
//  Created by Kasun Jayasekara on 2023-09-17.
//

import Foundation


class PlanetsHomeViewModel : ObservableObject {
    
    let jsonDataHandlling = JSONDataServices()

    func onScrollPlanetsNextPageLoader(currentPage:Int) {
        self.jsonDataHandlling.checkAvilabilityOfNextPage(pageUrl: ConfigData.URLS.pageURL, currentPageCount: currentPage) { nextPageAvailable in
            if nextPageAvailable {
                self.jsonDataHandlling.getSinglePlanetPageData(pageUrl: ConfigData.URLS.pageURL, currentPageCount: currentPage) {
                    NotificationCenter.default.post(name: Notification.Name("PLANETS_DATA_NEXT_PAGE_COMPLETED"), object: nil)
                }
            }else {
                NotificationCenter.default.post(name: Notification.Name("PLANETS_DATA_NEXT_PAGE_COMPLETED"), object: nil)
            }
        }
    }
    
}
