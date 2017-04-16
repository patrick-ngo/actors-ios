//
//  UIViewExtension.swift
//  Test
//
//  Created by Patrick Ngo on 29/3/17.
//  Copyright © 2017 ngo. All rights reserved.
//

import UIKit

extension UIView
{
    func makeCircular()
    {
        layer.cornerRadius = frame.size.height/2
        clipsToBounds = true
    }
    
    func roundCorners()
    {
        layer.cornerRadius = 5
        clipsToBounds = true
    }
}
