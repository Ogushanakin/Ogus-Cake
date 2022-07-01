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
    @IBOutlet weak var booksCollectionView: UICollectionView!
    
    var dishes: [Dishes] = [
        .init(id: "id1", name: "Post Workout Meal", image: "https://picsum.photos/100/200"),
        .init(id: "id1", name: "Pre Workout Meal", image: "https://picsum.photos/100/200"),
        .init(id: "id1", name: "Breakfast", image: "https://picsum.photos/100/200"),
        .init(id: "id1", name: "Muscle Mass Meal", image: "https://picsum.photos/100/200"),
        .init(id: "id1", name: "Defination Meal", image: "https://picsum.photos/100/200")
    ]
        
    var workouts: [Model] = [
    
        .init(id: "id2", name: "Upper Body Workout", image: "https://picsum.photos/100/200", description: "Lean muscle build", secondDescription: "chest,abs,back and shoulder training plan"),
        .init(id: "id2", name: "Upper Body Workout", image: "https://picsum.photos/100/200", description: "Lean muscle build", secondDescription: "chest,abs,back and shoulder training plan"),
        .init(id: "id2", name: "Upper Body Workout", image: "https://picsum.photos/100/200", description: "Lean muscle build", secondDescription: "chest,abs,back and shoulder training plan"),
        .init(id: "id2", name: "Upper Body Workout", image: "https://picsum.photos/100/200", description: "Lean muscle build", secondDescription: "chest,abs,back and shoulder training plan"),
        .init(id: "id2", name: "Upper Body Workout", image: "https://picsum.photos/100/200", description: "Lean muscle build", secondDescription: "chest,abs,back and shoulder training plan")

    ]
    
    var books: [Model] = [
    
        .init(id: "id3", name: "Black Book", image: "https://picsum.photos/100/200", description: "Orhan Pamuk", secondDescription: "Literature"),
        .init(id: "id3", name: "Homo Sapiens", image: "https://picsum.photos/100/200", description: "Yuval Noah Harari", secondDescription: "History,Science"),
        .init(id: "id3", name: "Das Kapital", image: "https://picsum.photos/100/200", description: "Karl Marx", secondDescription: "Politics"),
        .init(id: "id3", name: "Harry Potter", image: "https://picsum.photos/100/200", description: "J. K. Rowling", secondDescription: "Fantastic"),
        .init(id: "id3", name: "The Little Prince", image: "https://picsum.photos/100/200", description: "Antoine de Saint-Exupery", secondDescription: "Child")
        
    ]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        registerCells()
        
    }
    
    private func registerCells() {
        dishesCollectionView.register(UINib(nibName: DishesCollectionViewCell.identifier, bundle: nil), forCellWithReuseIdentifier: DishesCollectionViewCell.identifier)
        workoutCollectionView.register(UINib(nibName: WorkoutCollectionViewCell.identifier, bundle: nil), forCellWithReuseIdentifier: WorkoutCollectionViewCell.identifier)
        booksCollectionView.register(UINib(nibName: BooksCollectionViewCell.identifier, bundle: nil), forCellWithReuseIdentifier: BooksCollectionViewCell.identifier)
    }
    
}

extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch collectionView {
        case dishesCollectionView:
            return dishes.count
        case workoutCollectionView:
            return workouts.count
        case booksCollectionView:
            return books.count
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
        case booksCollectionView:
            let cell =  collectionView.dequeueReusableCell(withReuseIdentifier: BooksCollectionViewCell.identifier, for: indexPath) as! BooksCollectionViewCell
            cell.setup(book: books[indexPath.row])
            return cell
        default: return UICollectionViewCell()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == dishesCollectionView {
            
        } else {
            let controller = DetailPageViewController.instantiate()
            controller.dish = collectionView == workoutCollectionView ? workouts[indexPath.row] : books[indexPath.row]
            navigationController?.pushViewController(controller, animated: true)
        }
    }
}
