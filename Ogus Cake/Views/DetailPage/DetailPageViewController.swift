//
//  DetailPageViewController.swift
//  Ogus Cake
//
//  Created by AKIN on 1.07.2022.
//

import UIKit

class DetailPageViewController: UIViewController {

    @IBOutlet weak var detailImageView: UIImageView!
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var secondLbl: UILabel!
    @IBOutlet weak var descriptionLbl: UILabel!
    
    var dish: Model!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        dishView()
        
    }
    
    private func dishView() {
        detailImageView.kf.setImage(with: dish.image?.asUrl)
        titleLbl.text = dish.name
        descriptionLbl.text = dish.description
        secondLbl.text = dish.secondDescription
    }

    @IBAction func addBtnClicked(_ sender: UIButton) {
        
        
        
    }
    

}
