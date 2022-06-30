//
//  HomeViewController.swift
//  Ogus Cake
//
//  Created by AKIN on 24.06.2022.
//

import UIKit

class HomeViewController: UIViewController {

    
    @IBOutlet weak var dishesCollectionView: UICollectionView!
    @IBOutlet weak var workoutCollectionView: UICollectionView!
    
    var dishes: [Dishes] = [
        .init(id: "id1", name: "Post Workout Meal", image: "https://picsum.photos/100/200"),
        .init(id: "id1", name: "Pre Workout Meal", image: "https://picsum.photos/100/200"),
        .init(id: "id1", name: "Breakfast", image: "https://picsum.photos/100/200"),
        .init(id: "id1", name: "Muscle Mass Meal", image: "https://picsum.photos/100/200"),
        .init(id: "id1", name: "Defination Meal", image: "https://picsum.photos/100/200")
    ]
        
    var workouts: [Workout] = [
    
        .init(id: "id2", name: "Upper Body Workout", image: "https://picsum.photos/100/200", description: "Lean muscle build", secondDescription: "chest,abs,back and shoulder training plan"),
        .init(id: "id2", name: "Upper Body Workout", image: "https://picsum.photos/100/200", description: "Lean muscle build", secondDescription: "chest,abs,back and shoulder training plan"),
        .init(id: "id2", name: "Upper Body Workout", image: "https://picsum.photos/100/200", description: "Lean muscle build", secondDescription: "chest,abs,back and shoulder training plan"),
        .init(id: "id2", name: "Upper Body Workout", image: "https://picsum.photos/100/200", description: "Lean muscle build", secondDescription: "chest,abs,back and shoulder training plan"),
        .init(id: "id2", name: "Upper Body Workout", image: "https://picsum.photos/100/200", description: "Lean muscle build", secondDescription: "chest,abs,back and shoulder training plan")

    ]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        registerCells()
        
    }
    
    private func registerCells() {
        dishesCollectionView.register(UINib(nibName: DishesCollectionViewCell.identifier, bundle: nil), forCellWithReuseIdentifier: DishesCollectionViewCell.identifier)
        workoutCollectionView.register(UINib(nibName: WorkoutCollectionViewCell.identifier, bundle: nil), forCellWithReuseIdentifier: WorkoutCollectionViewCell.identifier)
    }
    
}

extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch collectionView {
        case dishesCollectionView:
            return dishes.count
        case workoutCollectionView:
            return workouts.count
        default: return 0
        }
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch collectionView {
        case dishesCollectionView:
            let cell =  collectionView.dequeueReusableCell(withReuseIdentifier: DishesCollectionViewCell.identifier, for: indexPath) as! DishesCollectionViewCell
            cell.setup(dish: dishes[indexPath.row])
            return cell
        case workoutCollectionView:
            let cell =  collectionView.dequeueReusableCell(withReuseIdentifier: WorkoutCollectionViewCell.identifier, for: indexPath) as! WorkoutCollectionViewCell
            cell.setup(workout: workouts[indexPath.row])
            return cell
        default: return UICollectionViewCell()
        }
        
        
    }
}