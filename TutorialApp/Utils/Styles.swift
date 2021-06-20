//
//  Styles.swift
//  TutorialApp
//
//  Created by usuario on 19/06/2021.
//

import UIKit

import UIKit

extension UIColor {
    
    static func rgb(red: CGFloat, green: CGFloat, blue: CGFloat) -> UIColor {
        return UIColor(red: red/255, green: green/255, blue: blue/255, alpha: 1)
    }
    
    static func mainBrown() -> UIColor {
        return UIColor.rgb(red: 117, green: 85, blue: 51)
    }
}

