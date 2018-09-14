//
//  DogsCollectionViewCell.swift
//  TestNuvemShop
//
//  Created by Antonio Queiroz on 13/09/2018.
//  Copyright © 2018 Antonio Queiroz. All rights reserved.
//

import UIKit

class DogsCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var image: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    static var nib:UINib {
        return UINib(nibName: identifier, bundle: nil)
    }
    
    static var identifier: String {
        return String(describing: self)
    }
    
}
