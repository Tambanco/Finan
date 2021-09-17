//
//  CategoriesViewController.swift
//  Finan
//
//  Created by tambanco 🥳 on 17.09.2021.
//

import UIKit

class CategoriesViewController: UIViewController {
    
    // MARK: - Properties
    private var categories: [String] = []
    
    
    // MARK: - Outlets
    @IBOutlet weak var categoriesTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Categories"
        categoriesTableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        
        let logoutBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "plus"), style: .done, target: self, action: #selector(addCategories))
        self.navigationItem.rightBarButtonItem  = logoutBarButtonItem
        
    }
    
    
    @objc func addCategories() {
        
        let alert = UIAlertController(title: "New Categories", message: "Add a new category", preferredStyle: .alert)
        let saveAction = UIAlertAction(title: "Save", style: .default) { [unowned self] action in
            guard let textField = alert.textFields?.first,
                  let nameToSave = textField.text else {
                
                return
            }
            
            self.categories.append(nameToSave)
            self.categoriesTableView.reloadData()
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
        alert.addTextField()
        alert.addAction(saveAction)
        alert.addAction(cancelAction)
        
        present(alert, animated: true)
    }
}

// MARK: - TableView methods
extension CategoriesViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categories.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = categories[indexPath.row]
        
        return cell
    }
        
        
    }
