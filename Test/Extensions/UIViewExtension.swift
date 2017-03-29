//
//  UIViewExtension.swift
//  Test
//
//  Created by Netccentric on 29/3/17.
//  Copyright © 2017 ngo. All rights reserved.
//

import UIKit

extension UIView
{
    func makeCircular() {
        self.layer.cornerRadius = self.frame.size.height/2
        self.clipsToBounds = true
    }
    
    func roundCorners()
    {
        self.layer.cornerRadius = 5
        self.clipsToBounds = true
    }
}
