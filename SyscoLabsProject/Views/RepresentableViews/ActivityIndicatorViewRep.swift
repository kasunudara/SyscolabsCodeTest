//
//  ActivityIndicatorViewRep.swift
//  SyscoLabsProject
//
//  Created by Kasun Jayasekara on 2023-09-18.
//

import Foundation
import SwiftUI
import NVActivityIndicatorView

struct ActivityIndicatorViewRep : UIViewRepresentable {
    
    typealias UIViewType = NVActivityIndicatorView
    
    @Binding var isAnimating: Bool
    
    func makeUIView(context: Context) -> NVActivityIndicatorView {
        let activityIndicator = NVActivityIndicatorView(frame: CGRect(x: AppUtils.width/2, y: AppUtils.height/2, width: 25, height: 25), type: NVActivityIndicatorType.lineScalePulseOut, color: .red, padding: nil)
        return activityIndicator
    }
    
    func updateUIView(_ uiView: NVActivityIndicatorView, context: Context) {
        isAnimating ? uiView.startAnimating() : uiView.stopAnimating()
    }
    
    
    
}
