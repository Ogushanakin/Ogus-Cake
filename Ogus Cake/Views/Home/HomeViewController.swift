//
//  HomeViewController.swift
//  Ogus Cake
//
//  Created by AKIN on 24.06.2022.
//

import UIKit
import ProgressHUD

class HomeViewController: UIViewController {

    
    @IBOutlet weak var dishesCollectionView: UICollectionView!
    @IBOutlet weak var workoutCollectionView: UICollectionView!
    @IBOutlet weak var booksCollectionView: UICollectionView!
    
    var categories: [Dishes] = []
    var populars: [Model] = []
    var specials: [Model] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        registerCells()
        ProgressHUD.show()
        
        NetworkService.shared.fetchAllCategories { [weak self] (result) in
            switch result {
            case .success(let allDishes):
                ProgressHUD.dismiss()
                self?.categories = allDishes.categories ?? []
                self?.populars = allDishes.populars ?? []
                self?.specials = allDishes.specials ?? []
                
                self?.dishesCollectionView.reloadData()
                self?.workoutCollectionView.reloadData()
                self?.booksCollectionView.reloadData()
            case .failure(let error):
                ProgressHUD.showError(error.localizedDescription)
            }
        }
        
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
            return categories.count
        case workoutCollectionView:
            return populars.count
        case booksCollectionView:
            return specials.count
        default: return 0
        }
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch collectionView {
        case dishesCollectionView:
            let cell =  collectionView.dequeueReusableCell(withReuseIdentifier: DishesCollectionViewCell.identifier, for: indexPath) as! DishesCollectionViewCell
            cell.setup(dish: categories[indexPath.row])
            return cell
        case workoutCollectionView:
            let cell =  collectionView.dequeueReusableCell(withReuseIdentifier: WorkoutCollectionViewCell.identifier, for: indexPath) as! WorkoutCollectionViewCell
            cell.setup(workout: populars[indexPath.row])
            return cell
        case booksCollectionView:
            let cell =  collectionView.dequeueReusableCell(withReuseIdentifier: BooksCollectionViewCell.identifier, for: indexPath) as! BooksCollectionViewCell
            cell.setup(book: specials[indexPath.row])
            return cell
        default: return UICollectionViewCell()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == dishesCollectionView {
            let controller = ListDishesViewController.instantiate()
            controller.dish = categories[indexPath.row]
            navigationController?.pushViewController(controller, animated: true)
        } else {
            let controller = DetailPageViewController.instantiate()
            controller.dish = collectionView == workoutCollectionView ? populars[indexPath.row] : specials[indexPath.row]
            navigationController?.pushViewController(controller, animated: true)
        }
    }
}
