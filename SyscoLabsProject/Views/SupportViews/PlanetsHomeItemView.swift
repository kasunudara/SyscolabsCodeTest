//
//  PlanetsHomeItemView.swift
//  SyscoLabsProject
//
//  Created by Kasun Jayasekara on 2023-09-14.
//

import SwiftUI

struct PlanetsHomeItemView: View {
    
    let planetName : String
    let planetClimate : String
    var isLast : Bool
    let planetsData = PlanetsData.sharedInstance
    let statusData = StatusData.sharedInstance
    @Binding var willMoveToPlanetsDetailView : Bool
    @Binding var isAnimating : Bool
    @ObservedObject private var planetsHomeViewModel = PlanetsHomeViewModel()
    
    var body: some View {
        VStack {
            HStack {
                Text("Planet Name :")
                    .bold()
                    .foregroundColor(Color.red)
                    .fontWeight(.heavy)
                Text("\(planetName)")
                    .foregroundColor(Color.green)
                    .fontWeight(.bold)
            }
            HStack {
                Text("Planet Climate :")
                    .bold()
                    .foregroundColor(Color.red)
                    .fontWeight(.heavy)
                Text("\(planetClimate)")
                    .foregroundColor(Color.green)
                    .fontWeight(.bold)
            }
        }
        .frame(width: AppUtils.width,height: AppUtils.height*0.1)
        .onTapGesture {
            self.willMoveToPlanetsDetailView.toggle()
            self.planetsData.selectdPlanetName = planetName
        }
        .onAppear {
            if self.isLast {
                print("Loading data")
                self.isAnimating.toggle()
                self.statusData.currentPageCount += 1
                print("Status data count \(self.statusData.currentPageCount)")
                self.planetsHomeViewModel.onScrollPlanetsNextPageLoader(currentPage: self.statusData.currentPageCount)
            }
        }
        
    }
}

//struct PlanetsHomeItemView_Previews: PreviewProvider {
//    static var previews: some View {
//        PlanetsHomeItemView(planetName: "Jupitor", planetClimate: "120", willMoveToPlanetsDetailView: .constant(.true))
//    }
//}
