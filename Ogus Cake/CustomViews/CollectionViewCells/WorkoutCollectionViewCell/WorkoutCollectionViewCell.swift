//
//  WorkoutCollectionViewCell.swift
//  Ogus Cake
//
//  Created by AKIN on 30.06.2022.
//

import UIKit

class WorkoutCollectionViewCell: UICollectionViewCell {

    static let identifier = String(describing: WorkoutCollectionViewCell.self)
    
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var workoutImageView: UIImageView!
    @IBOutlet weak var firstDescriptionLbl: UILabel!
    @IBOutlet weak var secondDescriptionLbl: UILabel!
    
    func setup(workout: Workout) {
        titleLbl.text = workout.name
        workoutImageView.kf.setImage(with: workout.image?.asUrl)
        firstDescriptionLbl.text = workout.description
        secondDescriptionLbl.text = workout.secondDescription
    }
    
}
