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
        label.layer.cornerRadius = 10.0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private var addViewLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 32)
        label.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        label.textAlignment = .left
        label.text = "Add"
        label.layer.cornerRadius = 10.0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = #colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1)
        self.layer.cornerRadius = 10.0
        
        addSubview(categoryLabel)
        addSubview(addViewLabel)
        
        categoryLabel.anchor(top: topAnchor,
                             leading: leadingAnchor,
                             bottom: nil,
                             trailing: addViewLabel.leadingAnchor,
                             padding: UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10))
        
        addViewLabel.anchor(top: topAnchor,
                            leading: categoryLabel.trailingAnchor,
                            bottom: nil, trailing: trailingAnchor,
                            padding: UIEdgeInsets(top: 10, left: 10,
                                                  bottom: 10,
                                                  right: 10))
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
