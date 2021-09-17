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
    
    @IBOutlet weak var categoriesTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Categories"
        categoriesTableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        
        let logoutBarButtonItem = UIBarButtonItem(title: "Logout", style: .done, target: self, action: #selector(logoutUser))
        self.navigationItem.rightBarButtonItem  = logoutBarButtonItem
        
    }
    
    
    @objc func logoutUser() {
       
    }
    
}

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
