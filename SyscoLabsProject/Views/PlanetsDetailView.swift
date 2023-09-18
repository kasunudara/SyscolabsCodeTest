//
//  PlanetsDetailView.swift
//  SyscoLabsProject
//
//  Created by Kasun Jayasekara on 2023-09-15.
//

import SwiftUI

struct PlanetsDetailView: View {
    
    let planetsData = PlanetsData.sharedInstance
    @ObservedObject private var planetsDetailViewModel = PlanetsDetailViewModel()
    
    var body: some View {
        VStack {
            HStack {
                Text("Planet Name: ")
                    .bold()
                    .foregroundColor(Color.red)
                    .fontWeight(.heavy)
                Text("\(self.planetsData.planetName[self.planetsDetailViewModel.getTheSelectedPlanetIndex(selectedPlanet: self.planetsData.selectdPlanetName)])")
                    .foregroundColor(Color.green)
                    .fontWeight(.bold)
                
            }
            HStack {
                Text("Orbital Period: ")
                    .bold()
                    .foregroundColor(Color.red)
                    .fontWeight(.heavy)
                Text("\((self.planetsData.planetOrbitalPeriod[self.planetsDetailViewModel.getTheSelectedPlanetIndex(selectedPlanet: self.planetsData.selectdPlanetName)]))")
                    .foregroundColor(Color.green)
                    .fontWeight(.bold)
            }
            HStack {
                Text("Gravity: ")
                    .bold()
                    .foregroundColor(Color.red)
                    .fontWeight(.heavy)
                Text("\(((self.planetsData.planetGravity[self.planetsDetailViewModel.getTheSelectedPlanetIndex(selectedPlanet: self.planetsData.selectdPlanetName)])))")
                    .foregroundColor(Color.green)
                    .fontWeight(.bold)
            }
            
        }
        .frame(width: AppUtils.width,height: AppUtils.height)
        .background(Color.white)
        .edgesIgnoringSafeArea(.all)
        .toolbar {
            ToolbarItem(placement: .principal) {
                Text("PlanetsDetailView")
                    .font(.headline)
                    .foregroundColor(Color.black)
            }
        }
        
    }
}

//struct PlanetsDetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        PlanetsDetailView()
//    }
//}
