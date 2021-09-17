//
//  SettingsViewController.swift
//  Finan
//
//  Created by tambanco 🥳 on 14.09.2021.
//

import UIKit

class SettingsViewController: UIViewController {
    
    @IBOutlet weak var settingsTableView: UITableView!
    
    var names: [String] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Settings"
        settingsTableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        
        let logoutBarButtonItem = UIBarButtonItem(title: "Logout", style: .done, target: self, action: #selector(logoutUser))
        self.navigationItem.rightBarButtonItem  = logoutBarButtonItem
        
        
    }
    
    @objc func logoutUser() {
        print("fff")
    }
}


extension SettingsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return names.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = names[indexPath.row]
        return cell
    }
    
}
