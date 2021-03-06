//
//  AlbumCell.swift
//  Photo App
//
//  Created by Mohamed Hamed on 5/29/18.
//  Copyright © 2018 Mohamed Hamed. All rights reserved.
//

import Foundation
import UIKit

class AlbumCell : UITableViewCell {
    // MARK: IBOutlets
    @IBOutlet weak var albumPhoto: UIImageView!
    @IBOutlet weak var albumTitle: UITextView!
    @IBOutlet weak var albumID: UILabel!
    @IBOutlet weak var radioButton: UIButton!
    

    @IBAction func radioBtnTapped(_ sender: UIButton) {
        sender.isSelected = !sender.isSelected
        if sender.isSelected {
            sender.isEnabled = true
            sender.tintColor = UIColor.clear
        }
    }
    
}

extension UIButton {
    
    func roundCorners(_ corners: UIRectCorner, radius: CGFloat) {
        let path = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        self.layer.mask = mask
    }
    
}
