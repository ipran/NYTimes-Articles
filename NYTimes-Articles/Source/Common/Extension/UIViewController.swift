//
//  UIViewController.swift
//  NYTimes-Articles
//
//  Created by Pranil V P on 12/12/19.
//  Copyright © 2019 Pranil V P. All rights reserved.
//

import UIKit

extension UIViewController {
    // Fetch controller name
    static var identifier: String {
        return String(describing: self).components(separatedBy: ".").last!
        
    }
    
}
