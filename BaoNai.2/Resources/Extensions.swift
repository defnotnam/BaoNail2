//
//  Extensions.swift
//  BaoNai.2
//
//  Created by Nam Nguyen on 7/20/23.
//

import UIKit

extension UIView {
    func addSubviews(_ views: UIView...) {
        views.forEach ({
            addSubview($0)
        })
    }
}
