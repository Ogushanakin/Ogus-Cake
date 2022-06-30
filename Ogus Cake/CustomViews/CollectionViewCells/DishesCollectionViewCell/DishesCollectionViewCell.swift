//
//  DishesCollectionViewCell.swift
//  Ogus Cake
//
//  Created by AKIN on 30.06.2022.
//

import UIKit
import Kingfisher

class DishesCollectionViewCell: UICollectionViewCell {

    static let identifier = String(describing: DishesCollectionViewCell.self)
    
    @IBOutlet weak var dishesImageView: UIImageView!
    @IBOutlet weak var dishesTitleLabel: UILabel!
    
    func setup(dish: Dishes) {
        dishesTitleLabel.text = dish.name
        dishesImageView.kf.setImage(with: dish.image?.asUrl)
    }
}
