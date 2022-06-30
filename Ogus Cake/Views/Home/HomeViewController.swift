//
//  HomeViewController.swift
//  Ogus Cake
//
//  Created by AKIN on 24.06.2022.
//

import UIKit

class HomeViewController: UIViewController {

    
    @IBOutlet weak var dishesCollectionView: UICollectionView!
    
    var dishes: [Dishes] = [
        .init(id: "id1", name: "Post Workout Meal", image: "https://picsum.photos/100/200"),
        .init(id: "id1", name: "Pre Workout Meal", image: "https://picsum.photos/100/200"),
        .init(id: "id1", name: "Breakfast", image: "https://picsum.photos/100/200"),
        .init(id: "id1", name: "Muscle Mass Meal", image: "https://picsum.photos/100/200"),
        .init(id: "id1", name: "Defination Meal", image: "https://picsum.photos/100/200")
    ]
        
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        registerCells()
        
    }
    
    private func registerCells() {
        dishesCollectionView.register(UINib(nibName: DishesCollectionViewCell.identifier, bundle: nil), forCellWithReuseIdentifier: DishesCollectionViewCell.identifier)
    }
    
}

extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dishes.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell =  collectionView.dequeueReusableCell(withReuseIdentifier: DishesCollectionViewCell.identifier, for: indexPath) as! DishesCollectionViewCell
        cell.setup(dish: dishes[indexPath.row])
        return cell
    }
}
