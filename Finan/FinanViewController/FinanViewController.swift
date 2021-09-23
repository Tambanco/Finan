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
    var categoriesArr: [String] = ["Питание"]
    
    // MARK: - App life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(FinanView.init(frame: CGRect(x: 0,
                                                     y: 0,
                                                     width: view.frame.width,
                                                     height: view.frame.height)))
    }
    
    // MARK: - Button builder
    private func buttonBuilder() {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        let managedContext = appDelegate.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Categories")
        
        do {
            categories = try managedContext.fetch(fetchRequest)
        } catch let error as NSError {
            print("Could not fetch. \(error), \(error.userInfo)")
        }
        
                for idx in 0..<categoriesArr.count {
                    let button = UIButton(frame: CGRect(x: 100, y: 100, width: 100, height: 50))
                    button.backgroundColor = .gray
                    button.setTitle(categoriesArr[idx], for: .normal)
                    button.layer.cornerRadius = 10.0
                    button.layer.shadowOpacity = 0.5
                    button.layer.shadowRadius = 10
                    self.view.addSubview(button)
                }
    }
}
