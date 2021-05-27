//
//  View+Extension.swift
//  AvengersApp
//
//  Created by Nguyen Toan on 25/05/2021.
//

import UIKit
import Foundation

extension UIView {
    enum ReloadAnimationType{
        case up
        case down
        case left
        case right
        case clearIn
    }
    func addAnimation(animationDirection: ReloadAnimationType, delay: Int) {
        var index = delay
        let tableHeight: CGFloat = self.bounds.size.height
        
        //let cell: UITableViewCell = i as UITableViewCell
        switch animationDirection {
        case .up:
            self.transform = CGAffineTransform(translationX: 0, y: -tableHeight)
            break
        case .down:
            self.transform = CGAffineTransform(translationX: 0, y: tableHeight)
            break
        case .left:
            self.transform = CGAffineTransform(translationX: self.frame.width, y: 0)
            break
        case .right:
            self.transform = CGAffineTransform(translationX: -self.frame.width, y: 0)
            break
        default:
            self.transform = CGAffineTransform(translationX: tableHeight, y: 0)
            break
        }
        
        UIView.animate(withDuration: 0.5,
                       delay: 0.01 * Double(index),
                       usingSpringWithDamping: 0.8,
                       initialSpringVelocity: 0,
                       options: .curveEaseIn,
                       animations: { self.transform = CGAffineTransform(translationX: 0, y: 0) },
                       completion: nil)
        index += 1
        layoutIfNeeded()
    }
}
