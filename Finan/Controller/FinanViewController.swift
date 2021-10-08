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
}
