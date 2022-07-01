//
//  ListDishesViewController.swift
//  Ogus Cake
//
//  Created by AKIN on 1.07.2022.
//

import UIKit

class ListDishesViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var dish: Dishes!
    
    var dishes: [Model] = [
    
        .init(id: "id2", name: "Post Workout Meal", image: "https://picsum.photos/100/200", description: "Lean muscle build", secondDescription: "chest,abs,back and shoulder training plan"),
        .init(id: "id2", name: "Pre Workout Meal", image: "https://picsum.photos/100/200", description: "Lean muscle build", secondDescription: "chest,abs,back and shoulder training plan"),
        .init(id: "id2", name: "Breakfast", image: "https://picsum.photos/100/200", description: "Lean muscle build", secondDescription: "chest,abs,back and shoulder training plan"),
        .init(id: "id2", name: "Defination Meal", image: "https://picsum.photos/100/200", description: "Defination Meal", secondDescription: "chest,abs,back and shoulder training plan"),
        .init(id: "id2", name: "Muscle Mass Meal", image: "https://picsum.photos/100/200", description: "Lean muscle build", secondDescription: "chest,abs,back and shoulder training plan")
        
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = dish.name
        registerCells()
        
    }
    
    private func registerCells() {
        tableView.register(UINib(nibName: DishListTableViewCell.identifier, bundle: nil), forCellReuseIdentifier: DishListTableViewCell.identifier)
    }
}

extension ListDishesViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dishes.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell =  tableView.dequeueReusableCell(withIdentifier: DishListTableViewCell.identifier) as! DishListTableViewCell
        cell.setup(dish: dishes[indexPath.row])
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let controller = DetailPageViewController.instantiate()
        controller.dish = dishes[indexPath.row]
        navigationController?.pushViewController(controller, animated: true)
    }
}
