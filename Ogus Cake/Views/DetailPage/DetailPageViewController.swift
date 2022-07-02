//
//  DetailPageViewController.swift
//  Ogus Cake
//
//  Created by AKIN on 1.07.2022.
//

import UIKit
import ProgressHUD

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
        let name = titleLbl.text?.trimmingCharacters(in: .whitespaces)
        
        ProgressHUD.show("Add Library...")
        NetworkService.shared.placeOrder(dishId: dish.id ?? "" , name: name ?? "") { (result) in
            switch result {
            case .success(_):
                ProgressHUD.showSuccess("Added your Library")
            case.failure(let error):
                ProgressHUD.showError(error.localizedDescription)
            }
            
        }
        
    }
    

}
