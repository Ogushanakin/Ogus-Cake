//
//  BooksCollectionViewCell.swift
//  Ogus Cake
//
//  Created by AKIN on 1.07.2022.
//

import UIKit

class BooksCollectionViewCell: UICollectionViewCell {

    static let identifier = String(describing: BooksCollectionViewCell.self)
    
    @IBOutlet weak var bookImageView: UIImageView!
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var descriptionLbl: UILabel!
    @IBOutlet weak var secondDescriptionLbl: UILabel!
    
    func setup(book: Model) {
        bookImageView.kf.setImage(with: book.image?.asUrl)
        titleLbl.text = book.name
        descriptionLbl.text = book.description
        secondDescriptionLbl.text = book.secondDescription
    }

}
