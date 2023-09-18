//
//  SplashView.swift
//  SyscoLabsProject
//
//  Created by Kasun Jayasekara on 2023-09-16.
//

import SwiftUI

struct SplashView: View {
    
    @State private var appReadyAnyLounch = StatusData.sharedInstance.isAppReadyFirstLounch
    let planetsDataPageOneCompleted = NotificationCenter.default.publisher(for: NSNotification.Name("PLANETS_DATA_PAGE_ONE_COMPLETED"))

    var body: some View {
        NavigationView {
            ZStack {
                NavigationLink(destination: PlanetsHomeView(), isActive: $appReadyAnyLounch) {
                    EmptyView()
                }
            }
            .frame(width: AppUtils.width,height: AppUtils.height)
            .background(.white)
            .onReceive(planetsDataPageOneCompleted) { (output) in
                NotificationCenter.default.removeObserver(self.planetsDataPageOneCompleted)
                self.appReadyAnyLounch.toggle()
            }

        }
    }
    
    
}

struct SplashView_Previews: PreviewProvider {
    static var previews: some View {
        SplashView()
    }
}
