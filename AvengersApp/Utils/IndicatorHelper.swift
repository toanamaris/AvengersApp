//
//  IndicatorHelper.swift
//  AvengersApp
//
//  Created by Nguyen Toan on 25/05/2021.
//

import Foundation
import ANActivityIndicator

class IndicatorHelper {
   
    static let shared = IndicatorHelper()
    
    func startLoading(type: ANActivityIndicatorAnimationType, message: String? = nil){
        ANActivityIndicatorPresenter.shared.showIndicator(CGSize(width: 100, height: 100), message: message, animationType: type, color: .white, padding: 10)
    }
    
    func stopLoading() {
        ANActivityIndicatorPresenter.shared.hideIndicator()
    }
}
