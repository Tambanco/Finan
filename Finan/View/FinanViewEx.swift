//
//  FinanViewEx.swift
//  Finan
//
//  Created by tambanco 🥳 on 30.09.2021.
//

import Foundation
import UIKit

extension FinanViewController {
    func createFinanView() {
        
        let finanView = UIView()
        finanView.backgroundColor = Constants.viewBGColor
        finanView.layer.cornerRadius = Constants.cardsCornerRadius
        self.view.addSubview(finanView)
        finanView.translatesAutoresizingMaskIntoConstraints = false

        let categoriesSubView = UIView()
        categoriesSubView.backgroundColor = Constants.cardsBGColor
        finanView.addSubview(categoriesSubView)
        categoriesSubView.translatesAutoresizingMaskIntoConstraints = false

        let constraints = [finanView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 40),
                           finanView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
                           finanView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
                           finanView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),

                           categoriesSubView.topAnchor.constraint(equalTo: finanView.topAnchor, constant: 15),
                           categoriesSubView.leadingAnchor.constraint(equalTo: finanView.leadingAnchor, constant: 15),
                           categoriesSubView.trailingAnchor.constraint(equalTo: finanView.trailingAnchor, constant: -15),
                           categoriesSubView.heightAnchor.constraint(equalToConstant: 60)
        ]
        NSLayoutConstraint.activate(constraints)
    }
}
