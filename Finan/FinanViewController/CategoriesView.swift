//
//  CategoriesView.swift
//  Finan
//
//  Created by tambanco 🥳 on 17.09.2021.
//

import Foundation
import UIKit

class CategoriesView: UIView {

    lazy var categoryLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 32)
        label.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        label.textAlignment = .left
        label.text = "Categories"
        label.layer.cornerRadius = 10.0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private var setCategoryButton: UIButton = {
        let button = UIButton(frame: CGRect())
        button.backgroundColor = .white
        button.setImage(UIImage(systemName: "plus"), for: .normal)
        button.layer.cornerRadius = 10.0
        button.layer.shadowOpacity = 0.3
        button.layer.shadowRadius = 10
        button.layer.shadowOffset = CGSize(width: 1, height: 1)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = UIColor.init(rgb: 0x4B6587)
        self.layer.cornerRadius = 10.0
        
        addSubview(categoryLabel)
        addSubview(setCategoryButton)
        
        categoryLabel.anchor(top: topAnchor,
                             leading: leadingAnchor,
                             bottom: nil,
                             trailing: setCategoryButton.leadingAnchor,
                             padding: UIEdgeInsets(top: 10,
                                                   left: 10,
                                                   bottom: 10,
                                                   right: 10))
        
        setCategoryButton.anchor(top: topAnchor,
                            leading: categoryLabel.trailingAnchor,
                            bottom: nil, trailing: trailingAnchor,
                            padding: UIEdgeInsets(top: 10,
                                                  left: 10,
                                                  bottom: 10,
                                                  right: 10))
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
