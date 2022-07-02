//
//  LibraryViewController.swift
//  Ogus Cake
//
//  Created by AKIN on 1.07.2022.
//

import UIKit
import ProgressHUD

class LibraryViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var library: [Library] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Library"
        registerCells()
        
        ProgressHUD.show()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        NetworkService.shared.fetchLibrary { [weak self] (result) in
            switch result {
            case .success(let library):
                ProgressHUD.dismiss()
                
                self?.library = library
                self?.tableView.reloadData()
            case .failure(let error):
                ProgressHUD.showError(error.localizedDescription)
            }
        }
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
