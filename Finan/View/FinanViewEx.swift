//
//  FinanViewEx.swift
//  Finan
//
//  Created by tambanco 🥳 on 30.09.2021.
//

import Foundation
import UIKit

extension FinanViewController {
    func createCategoriesView() {
        
        let firstSubView = UIView()
        firstSubView.backgroundColor = .red
        self.view.addSubview(firstSubView)
        firstSubView.translatesAutoresizingMaskIntoConstraints = false

        let secondSubView = UIView()
        secondSubView.backgroundColor = .blue
        firstSubView.addSubview(secondSubView)
        secondSubView.translatesAutoresizingMaskIntoConstraints = false

        let constraints = [firstSubView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 40),
                           firstSubView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
                           firstSubView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
                           firstSubView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),

                           secondSubView.topAnchor.constraint(equalTo: firstSubView.topAnchor, constant: 15),
                           secondSubView.leadingAnchor.constraint(equalTo: firstSubView.leadingAnchor, constant: 15),
                           secondSubView.trailingAnchor.constraint(equalTo: firstSubView.trailingAnchor, constant: -15),
                           secondSubView.heightAnchor.constraint(equalToConstant: 60)
        ]
        NSLayoutConstraint.activate(constraints)
    }
}
