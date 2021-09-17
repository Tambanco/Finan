//
//  FinanViewController.swift
//  Finan
//
//  Created by tambanco 🥳 on 14.09.2021.
//

import UIKit
import CoreData

class FinanViewController: UIViewController {
    
    // MARK: - Properties
    var categories: [NSManagedObject] = []
    var categoriesArr = ["Питание", "ЖКХ", "Досуг"]
    
    // MARK: - Outlets
    @IBOutlet weak var addButton: UIButton!
    
    
    // MARK: - App life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        buttonBuilder()
    }
    
    @objc func buttonAction(sender: UIButton!) {
        print("Button tapped")
    }
    
    @IBAction func addButtonAction(_ sender: UIButton) {
        performSegue(withIdentifier: "showCategories", sender: nil)
    }
    
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
            self.view.addSubview(button)
        }
//        let button = UIButton(frame: CGRect(x: 100, y: 100, width: 100, height: 50))
//        button.backgroundColor = .green
//        button.setTitle(categoriesArr.first, for: .normal)
//        button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
//
//        self.view.addSubview(button)
    }
}
