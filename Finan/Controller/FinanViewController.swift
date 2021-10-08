//
//  FinanViewController.swift
//  Finan
//
//  Created by tambanco 🥳 on 14.09.2021.
//

import UIKit
import CoreData

final class FinanViewController: UIViewController {
    
    // MARK: - Properties
    
    var categories: [NSManagedObject] = []
    var categoriesArr: [String] = []
    
    // MARK: - App life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        createCategories()
        createFinanView()
    }
    
    // MARK: - Button builder
    private func createCategories() {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        let managedContext = appDelegate.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Categories")
        
        do {
            categories = try managedContext.fetch(fetchRequest)
            categoriesArr = categories.map { $0.value(forKey: "categoryName") as! String }
        } catch let error as NSError {
            print("Could not fetch. \(error), \(error.userInfo)")
        }
        
    }
}
