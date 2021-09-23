//
//  FinanView.swift
//  Finan
//
//  Created by tambanco 🥳 on 23.09.2021.
//

import Foundation
import UIKit

final class FinanView: UIView {
    
    // MARK: - First layer
    var categoriesView: UIView = {
        let view = UIView()
        view.backgroundColor = Constants.cardsBGColor
        view.layer.cornerRadius = Constants.cardsCornerRadius
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    var priceView: UIView = {
        let view = UIView()
        view.backgroundColor = Constants.cardsBGColor
        view.layer.cornerRadius = Constants.cardsCornerRadius
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    var commentView: UIView = {
        let view = UIView()
        view.backgroundColor = Constants.cardsBGColor
        view.layer.cornerRadius = Constants.cardsCornerRadius
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    // MARK: - SecondLayer
    lazy var categoryLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: Constants.titleFont)
        label.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        label.textAlignment = .left
        label.text = "Categories"
        label.layer.cornerRadius = 10.0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private var setCategoryButton: UIButton = {
        let button = UIButton(frame: CGRect())
        button.setImage(UIImage(systemName: "plus"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        overlayCategoriesView()
        overlayPriceView()
        overlayCommentsView()
        overlaySecondLayer()
    }
    
    func overlaySecondLayer() {
        categoriesView.addSubview(categoryLabel)
        categoriesView.addSubview(setCategoryButton)
        
        categoryLabel.topAnchor.constraint(equalTo: categoriesView.topAnchor, constant: 10).isActive = true
        categoryLabel.leadingAnchor.constraint(equalTo: categoriesView.leadingAnchor, constant: 10).isActive = true
        categoryLabel.trailingAnchor.constraint(equalTo: setCategoryButton.leadingAnchor, constant: -10).isActive = true
        categoryLabel.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        setCategoryButton.topAnchor.constraint(equalTo: categoriesView.topAnchor, constant: 10).isActive = true
        setCategoryButton.leadingAnchor.constraint(equalTo: categoryLabel.trailingAnchor, constant: 10).isActive = true
        setCategoryButton.trailingAnchor.constraint(equalTo: categoriesView.trailingAnchor, constant: -10).isActive = true
        setCategoryButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
    }
    
    func overlayCategoriesView() {
        addSubview(categoriesView)
        
        categoriesView.topAnchor.constraint(equalTo: topAnchor, constant: 100).isActive = true
        categoriesView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20).isActive = true
        categoriesView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20).isActive = true
        categoriesView.heightAnchor.constraint(equalToConstant: 200).isActive = true
        
    }
    
    func overlayPriceView() {
        addSubview(priceView)
        
        priceView.topAnchor.constraint(equalTo: categoriesView.bottomAnchor, constant: 20).isActive = true
        priceView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20).isActive = true
        priceView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20).isActive = true
        priceView.heightAnchor.constraint(equalToConstant: 200).isActive = true
    }
    
    func overlayCommentsView() {
        addSubview(commentView)
        
        commentView.topAnchor.constraint(equalTo: priceView.bottomAnchor, constant: 20).isActive = true
        commentView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20).isActive = true
        commentView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20).isActive = true
        commentView.heightAnchor.constraint(equalToConstant: 200).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
