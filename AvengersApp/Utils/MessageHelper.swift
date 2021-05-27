//
//  MessageHelper.swift
//  AvengersApp
//
//  Created by Nguyen Toan on 26/05/2021.
//

import Foundation
import SwiftMessages


class MessageHelper {
    static let shared = MessageHelper()
    
    func displayMessage(theme: Theme, title: String, message: String){
        let view = MessageView.viewFromNib(layout: .cardView)
        
        view.configureTheme(theme)
        
        view.configureDropShadow()
        view.button?.isHidden = true
        view.configureContent(title: title, body: message, iconText: "")
        view.layoutMarginAdditions = UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
        
        (view.backgroundView as? CornerRoundingView)?.cornerRadius = 10
        
        SwiftMessages.show(view: view)
    }
}
