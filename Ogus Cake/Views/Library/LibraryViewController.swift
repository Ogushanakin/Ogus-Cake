//
//  LibraryViewController.swift
//  Ogus Cake
//
//  Created by AKIN on 1.07.2022.
//

import UIKit

class LibraryViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var library: [Library] = [
    
        .init(id: "id", name: "MY Upper Body Workout", dish:
                .init(id: "id2", name: "Upper Body Workout", image: "https://picsum.photos/100/200", description: "Lean muscle build", secondDescription: "chest,abs,back and shoulder training plan")),
        .init(id: "id", name: "MY Read-List", dish:
                .init(id: "id2", name: "Black Book", image: "https://picsum.photos/100/200", description: "Orhan Pamuk", secondDescription: "Literature")),
        .init(id: "id", name: "MY Upper Body Workout", dish:
                .init(id: "id2", name: "Post Workout Meal", image: "https://picsum.photos/100/200", description: "Lean muscle build", secondDescription: "Chicken Brest,Brown Rice and Greens")),
        .init(id: "id", name: "MY Upper Body Workout", dish:
                .init(id: "id2", name: "Upper Body Workout", image: "https://picsum.photos/100/200", description: "Lean muscle build", secondDescription: "chest,abs,back and shoulder training plan")),
        .init(id: "id", name: "MY Upper Body Workout", dish:
                .init(id: "id2", name: "Upper Body Workout", image: "https://picsum.photos/100/200", description: "Lean muscle build", secondDescription: "chest,abs,back and shoulder training plan"))
        
    ]
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Library"
        registerCells()
        
    }
    
    private func registerCells() {
        tableView.register(UINib(nibName: DishListTableViewCell.identifier, bundle: nil), forCellReuseIdentifier: DishListTableViewCell.identifier)
    }
}

extension LibraryViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return library.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: DishListTableViewCell.identifier) as! DishListTableViewCell
        cell.setup(library: library[indexPath.row])
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let controller = DetailPageViewController.instantiate()
        controller.dish = library[indexPath.row].dish
        navigationController?.pushViewController(controller, animated: true)
    }
}
