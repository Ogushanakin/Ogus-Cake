//
//  DishListTableViewCell.swift
//  Ogus Cake
//
//  Created by AKIN on 1.07.2022.
//

import UIKit

class DishListTableViewCell: UITableViewCell {

    static let identifier = "DishListTableViewCell"
    @IBOutlet weak var dishImageView: UIImageView!
    @IBOutlet weak var dishTitleLbl: UILabel!
    @IBOutlet weak var descriptionLbl: UILabel!
    
    func setup(dish: Model) {
        dishImageView.kf.setImage(with: dish.image?.asUrl)
        dishTitleLbl.text = dish.name
        descriptionLbl.text = dish.description
    }
    
    func setup(library: Library) {
        dishImageView.kf.setImage(with: library.dish?.image?.asUrl)
        dishTitleLbl.text = library.dish?.name
        descriptionLbl.text = library.dish?.description
    }
}
