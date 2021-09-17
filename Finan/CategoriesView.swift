//
//  CategoriesView.swift
//  Finan
//
//  Created by tambanco 🥳 on 17.09.2021.
//

import Foundation
import UIKit

class CategoriesView: UIView {

    private var categoryLabel: UILabel = {
       let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 32)
        label.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        label.textAlignment = .left
        label.text = "Categories"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private var setCategoryButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 290, y: 20, width: 50, height: 50))
        button.backgroundColor = .white
        button.setImage(UIImage(systemName: "plus"), for: .normal)
        button.layer.cornerRadius = 10.0
        button.layer.shadowOpacity = 0.3
        button.layer.shadowRadius = 10
        button.layer.shadowOffset = CGSize(width: 1, height: 1)
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1)
        self.layer.cornerRadius = 10.0
        self.layer.shadowOpacity = 0.3
        self.layer.shadowRadius = 10
        self.layer.shadowOffset = CGSize(width: 1, height: 1)
        
        addSubview(categoryLabel)
        addSubview(setCategoryButton)
        
        categoryLabel.anchor(top: topAnchor,
                             leading: leadingAnchor,
                             bottom: nil,
                             trailing: trailingAnchor,
                             padding: UIEdgeInsets(top: 20,
                                                   left: 20,
                                                   bottom: 0,
                                                   right: 20))
        
//        setCategoryButton.anchor(top: topAnchor,
//                                 leading: leadingAnchor,
//                                 bottom: nil,
//                                 trailing: trailingAnchor,
//                                 padding: UIEdgeInsets(top: 100, left: 20, bottom: 0, right: 20))
//
//        setCategoryButton.topAnchor.constraint(equalTo: topAnchor, constant: 12).isActive = true
//        setCategoryButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -12).isActive = true
//        setCategoryButton.leadingAnchor.constraint(equalTo: categoryLabel.trailingAnchor, constant: 8).isActive = true
//        setCategoryButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12).isActive = true
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
