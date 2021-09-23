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
        button.addTarget(self, action: #selector(setCategories), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    lazy var priceLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 32)
        label.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        label.textAlignment = .left
        label.text = "Price"
        label.layer.cornerRadius = 10.0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var priceInput: UITextField = {
        let textField =  UITextField(frame: CGRect())
        textField.placeholder = "Enter price here"
        textField.font = UIFont.systemFont(ofSize: 15)
        textField.borderStyle = UITextField.BorderStyle.roundedRect
        textField.autocorrectionType = UITextAutocorrectionType.no
        textField.keyboardType = UIKeyboardType.default
        textField.returnKeyType = UIReturnKeyType.done
        textField.clearButtonMode = UITextField.ViewMode.whileEditing
        textField.contentVerticalAlignment = UIControl.ContentVerticalAlignment.center
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    lazy var commentLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 32)
        label.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        label.textAlignment = .left
        label.text = "Comment"
        label.layer.cornerRadius = 10.0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var commentInput: UITextField = {
        let textField =  UITextField(frame: CGRect())
        textField.placeholder = "Enter comment here"
        textField.font = UIFont.systemFont(ofSize: 15)
        textField.borderStyle = UITextField.BorderStyle.roundedRect
        textField.autocorrectionType = UITextAutocorrectionType.no
        textField.keyboardType = UIKeyboardType.default
        textField.returnKeyType = UIReturnKeyType.done
        textField.clearButtonMode = UITextField.ViewMode.whileEditing
        textField.contentVerticalAlignment = UIControl.ContentVerticalAlignment.center
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = #colorLiteral(red: 0.1411764771, green: 0.3960784376, blue: 0.5647059083, alpha: 1)
        
        overlayCategoriesView()
        overlayCategoriesViewContent()
        
        overlayPriceView()
        overlayPriceViewContent()
        
        overlayCommentsView()
        overlayCommentsViewContent()
    }
    
    // MARK: - Button methods
    @objc func setCategories() {
        print("dfddg")
    }
    
    // MARK: - Categories view content
    func overlayCategoriesViewContent() {
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
    
    // MARK: - Price view content
    func overlayPriceViewContent() {
        priceView.addSubview(priceLabel)
        priceView.addSubview(priceInput)
        
        priceLabel.topAnchor.constraint(equalTo: priceView.topAnchor, constant: 10).isActive = true
        priceLabel.leadingAnchor.constraint(equalTo: priceView.leadingAnchor, constant: 10).isActive = true
        priceLabel.trailingAnchor.constraint(equalTo: priceView.trailingAnchor, constant: -10).isActive = true
        priceLabel.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        priceInput.topAnchor.constraint(equalTo: priceLabel.bottomAnchor, constant: 10).isActive = true
        priceInput.leadingAnchor.constraint(equalTo: priceView.leadingAnchor, constant: 10).isActive = true
        priceInput.trailingAnchor.constraint(equalTo: priceView.trailingAnchor, constant: -10).isActive = true
        priceInput.heightAnchor.constraint(equalToConstant: 40).isActive = true
    }
    
    func overlayPriceView() {
        addSubview(priceView)
        
        priceView.topAnchor.constraint(equalTo: categoriesView.bottomAnchor, constant: 20).isActive = true
        priceView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20).isActive = true
        priceView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20).isActive = true
        priceView.heightAnchor.constraint(equalToConstant: 200).isActive = true
    }
    
    
    // MARK: - Comments view content
    func overlayCommentsViewContent() {
        commentView.addSubview(commentLabel)
        commentView.addSubview(commentInput)
        
        commentLabel.topAnchor.constraint(equalTo: commentView.topAnchor, constant: 10).isActive = true
        commentLabel.leadingAnchor.constraint(equalTo: commentView.leadingAnchor, constant: 10).isActive = true
        commentLabel.trailingAnchor.constraint(equalTo: commentView.trailingAnchor, constant: -10).isActive = true
        commentLabel.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        commentInput.topAnchor.constraint(equalTo: commentLabel.bottomAnchor, constant: 10).isActive = true
        commentInput.leadingAnchor.constraint(equalTo: commentView.leadingAnchor, constant: 10).isActive = true
        commentInput.trailingAnchor.constraint(equalTo: commentView.trailingAnchor, constant: -10).isActive = true
        commentInput.heightAnchor.constraint(equalToConstant: 40).isActive = true
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
