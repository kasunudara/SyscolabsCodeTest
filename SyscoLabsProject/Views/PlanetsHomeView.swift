//
//  ContentView.swift
//  SyscoLabsProject
//
//  Created by Kasun Jayasekara on 2023-09-14.
//

import SwiftUI

struct PlanetsHomeView : View {
    
    @State private var willMoveToPlanetsDetailView = false
    @State private var isAnimating: Bool = false
    @ObservedObject private var planetsHomeViewModel = PlanetsHomeViewModel()
    @ObservedObject var planetsData = PlanetsData.sharedInstance
    let planetsNextPageCompleted = NotificationCenter.default.publisher(for: NSNotification.Name(ConfigData.NOTIFICATION_KEYS.nextPageLoadCompleted))
    let jsonDataHandlling = JSONDataServices()
    
    var body: some View {
        VStack {
            List(Array(zip(self.planetsData.planetName,self.planetsData.planetClimate)), id: \.0) { item in
                if self.planetsData.planetName.last == item.0 {
                    PlanetsHomeItemView(planetName: item.0, planetClimate: item.1, isLast: true, willMoveToPlanetsDetailView: $willMoveToPlanetsDetailView,isAnimating:$isAnimating).listRowSeparator(.hidden)
                } else {
                    PlanetsHomeItemView(planetName: item.0, planetClimate: item.1, isLast: false, willMoveToPlanetsDetailView: $willMoveToPlanetsDetailView,isAnimating:$isAnimating)
                        .listRowSeparator(.hidden)
                }
                Divider()
            }
        }
        .padding()
        .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItem(placement: .principal) {
                Text("Planets")
                    .font(.headline)
                    .foregroundColor(Color.black)
            }
        }
        .overlay(
            ActivityIndicatorViewRep(isAnimating: $isAnimating)
                .frame(width: 75, height: 75, alignment: .center))
        .onReceive(planetsNextPageCompleted) { (output) in
            NotificationCenter.default.removeObserver(self.planetsNextPageCompleted)
            self.isAnimating.toggle()
        }
        
        NavigationLink(destination: PlanetsDetailView(), isActive: $willMoveToPlanetsDetailView) {
            EmptyView()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        PlanetsHomeView()
    }
}
