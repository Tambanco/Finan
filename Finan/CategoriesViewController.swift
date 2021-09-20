//
//  CategoriesViewController.swift
//  Finan
//
//  Created by tambanco 🥳 on 17.09.2021.
//

import UIKit
import CoreData

class CategoriesViewController: UIViewController {
    
// MARK: - Properties
    var categories: [NSManagedObject] = []
    
    
// MARK: - Outlets
    @IBOutlet weak var categoriesTableView: UITableView!
    
// MARK: - App life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Categories"
        categoriesTableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        
        let logoutBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "plus"), style: .done, target: self, action: #selector(addCategories))
        self.navigationItem.rightBarButtonItem  = logoutBarButtonItem
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        let managedContext = appDelegate.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Categories")
        
        do {
            categories = try managedContext.fetch(fetchRequest)
        } catch let error as NSError {
            print("Could not fetch. \(error), \(error.userInfo)")
        }
    }
    
    
    @objc func addCategories() {
        let alert = UIAlertController(title: "New Categories", message: "Add a new category", preferredStyle: .alert)
        let saveAction = UIAlertAction(title: "Save", style: .default) { [unowned self] action in
            guard let textField = alert.textFields?.first,
                  let nameToSave = textField.text else {
                
                return
            }
            
            self.save(name: nameToSave)
            self.categoriesTableView.reloadData()
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
        alert.addTextField()
        alert.addAction(saveAction)
        alert.addAction(cancelAction)
        
        present(alert, animated: true)
    }
    
    func save(name: String) {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        let managedContext = appDelegate.persistentContainer.viewContext
        let entity = NSEntityDescription.entity(forEntityName: "Categories", in: managedContext)!
        let categoryName = NSManagedObject(entity: entity, insertInto: managedContext)
        categoryName.setValue(name, forKeyPath: "categoryName")
        
        do {
            try managedContext.save()
            categories.append(categoryName)
        } catch let error as NSError {
            print("Could not save. \(error), \(error.userInfo)")
        }
    }
}

// MARK: - TableView methods
extension CategoriesViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categories.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let categories = categories[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = categories.value(forKey: "categoryName") as? String
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        guard editingStyle == .delete else { return }
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        let managedContext = appDelegate.persistentContainer.viewContext
        let category = categories[indexPath.row]
        managedContext.delete(category)
        categories.remove(at: indexPath.row)
        categoriesTableView.deleteRows(at: [indexPath], with: .automatic)
        
        do {
            try managedContext.save()
        } catch let error as NSError {
            print("Could not save. \(error), \(error.userInfo)")
        }
    }
}
