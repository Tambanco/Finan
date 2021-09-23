//
//  FinanView.swift
//  Finan
//
//  Created by tambanco 🥳 on 23.09.2021.
//

import Foundation
import UIKit

final class FinanView: UIView {
    
    var categoriesView: UIView = {
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 0.5843137503, green: 0.8235294223, blue: 0.4196078479, alpha: 1)
        view.layer.cornerRadius = 10
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    var priceView: UIView = {
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 0.5843137503, green: 0.8235294223, blue: 0.4196078479, alpha: 1)
        view.layer.cornerRadius = 10
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    var commentView: UIView = {
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 0.5843137503, green: 0.8235294223, blue: 0.4196078479, alpha: 1)
        view.layer.cornerRadius = 10
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(categoriesView)
        addSubview(priceView)
        addSubview(commentView)
        
        categoriesView.topAnchor.constraint(equalTo: topAnchor, constant: 100).isActive = true
        categoriesView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20).isActive = true
        categoriesView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20).isActive = true
        categoriesView.heightAnchor.constraint(equalToConstant: 200).isActive = true
        
        priceView.topAnchor.constraint(equalTo: categoriesView.bottomAnchor, constant: 20).isActive = true
        priceView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20).isActive = true
        priceView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20).isActive = true
        priceView.heightAnchor.constraint(equalToConstant: 200).isActive = true
        
        commentView.topAnchor.constraint(equalTo: priceView.bottomAnchor, constant: 20).isActive = true
        commentView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20).isActive = true
        commentView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20).isActive = true
        commentView.heightAnchor.constraint(equalToConstant: 200).isActive = true
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
