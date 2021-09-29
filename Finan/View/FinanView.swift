//
//  FinanView.swift
//  Finan
//
//  Created by tambanco 🥳 on 23.09.2021.
//

import Foundation
import UIKit
import CoreData

protocol FinanViewDelegate: AnyObject {
    func finanViewAddCategoriesButtonClicked()
}

final class FinanView: UIView {
    // MARK: - Properties
    weak var delegate: FinanViewDelegate?
    var categories: [NSManagedObject] = []
    var categoriesArr: [String] = ["Питание"]
    
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
    
    //categoriesView Content
    var categoryLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: Constants.titleFont)
        label.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        label.textAlignment = .left
        label.text = "Categories"
        label.layer.cornerRadius = Constants.cardsCornerRadius
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var setCategoryButton: UIButton = {
        let button = UIButton(frame: CGRect())
        button.setImage(UIImage(systemName: "plus"), for: .normal)
        button.tintColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        button.addTarget(self, action: #selector(setCategories), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
//    var button: UIButton = {
//        let button = UIButton(frame: CGRect())
//        button.tintColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
//        button.backgroundColor = .gray
//        button.layer.cornerRadius = Constants.cardsCornerRadius
//        button.layer.shadowOpacity = 0.5
//        button.layer.shadowRadius = 10
//        button.setTitle(categoriesArr.first, for: .normal)
//        button.translatesAutoresizingMaskIntoConstraints = false
//        return button
//    }()
    
    //priceView Content
    var priceLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 32)
        label.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        label.textAlignment = .left
        label.text = "Price"
        label.layer.cornerRadius = Constants.cardsCornerRadius
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var priceTextField: UITextField = {
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
    
    var currencyLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 32)
        label.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        label.textAlignment = .left
        label.text = "RUB"
        label.layer.cornerRadius = Constants.cardsCornerRadius
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    //commentView Content
    var commentLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 32)
        label.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        label.textAlignment = .left
        label.text = "Comment"
        label.layer.cornerRadius = 10.0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var commentInput: UITextField = {
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
        layer.cornerRadius = 10.0
        
        overlayCategoriesView()
        overlayCategoriesViewContent()
        
        overlayPriceView()
        overlayPriceViewContent()
        
        overlayCommentsView()
        overlayCommentsViewContent()
    }
    
    // MARK: - Button methods
    @objc private func setCategories() {
        self.delegate?.finanViewAddCategoriesButtonClicked()
    }
    
    // MARK: - Categories view content
    func overlayCategoriesViewContent() {
        categoriesView.addSubview(categoryLabel)
        categoriesView.addSubview(setCategoryButton)
//        categoriesView.addSubview(button)
        
        categoryLabel.topAnchor.constraint(equalTo: categoriesView.topAnchor, constant: 10).isActive = true
        categoryLabel.leadingAnchor.constraint(equalTo: categoriesView.leadingAnchor, constant: 10).isActive = true
        categoryLabel.trailingAnchor.constraint(equalTo: setCategoryButton.leadingAnchor, constant: -10).isActive = true
        categoryLabel.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        setCategoryButton.topAnchor.constraint(equalTo: categoriesView.topAnchor, constant: 10).isActive = true
        setCategoryButton.leadingAnchor.constraint(equalTo: categoryLabel.trailingAnchor, constant: 10).isActive = true
        setCategoryButton.trailingAnchor.constraint(equalTo: categoriesView.trailingAnchor, constant: -10).isActive = true
        setCategoryButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
//        button.topAnchor.constraint(equalTo: categoryLabel.bottomAnchor, constant: 10).isActive = true
//        button.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10).isActive = true
//        button.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10).isActive = true
//        button.heightAnchor.constraint(equalToConstant: 40).isActive = true
    }
    
    func overlayCategoriesView() {
        addSubview(categoriesView)
        
        categoriesView.topAnchor.constraint(equalTo: topAnchor, constant: 20).isActive = true
        categoriesView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20).isActive = true
        categoriesView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20).isActive = true
        categoriesView.heightAnchor.constraint(equalToConstant: 200).isActive = true
        
    }
    
    // MARK: - Price view content
    func overlayPriceViewContent() {
        priceView.addSubview(priceLabel)
        priceView.addSubview(priceTextField)
        priceView.addSubview(currencyLabel)
        
        priceLabel.topAnchor.constraint(equalTo: priceView.topAnchor, constant: 10).isActive = true
        priceLabel.leadingAnchor.constraint(equalTo: priceView.leadingAnchor, constant: 10).isActive = true
        priceLabel.trailingAnchor.constraint(equalTo: priceView.trailingAnchor, constant: -10).isActive = true
        priceLabel.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        priceTextField.topAnchor.constraint(equalTo: priceLabel.bottomAnchor, constant: 10).isActive = true
        priceTextField.leadingAnchor.constraint(equalTo: priceView.leadingAnchor, constant: 10).isActive = true
        priceTextField.trailingAnchor.constraint(equalTo: currencyLabel.leadingAnchor, constant: -5).isActive = true
        priceTextField.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        currencyLabel.topAnchor.constraint(equalTo: priceLabel.bottomAnchor, constant: 10).isActive = true
        currencyLabel.leadingAnchor.constraint(equalTo: priceTextField.trailingAnchor, constant: 5).isActive = true
        currencyLabel.trailingAnchor.constraint(equalTo: priceView.trailingAnchor, constant: -10).isActive = true
        currencyLabel.heightAnchor.constraint(equalToConstant: 40).isActive = true
    }
    
    func overlayPriceView() {
        addSubview(priceView)
        
        priceView.topAnchor.constraint(equalTo: categoriesView.bottomAnchor, constant: 0).isActive = true
        priceView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20).isActive = true
        priceView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20).isActive = true
        priceView.heightAnchor.constraint(equalToConstant: 110).isActive = true
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
        
        commentView.topAnchor.constraint(equalTo: priceView.bottomAnchor, constant: 0).isActive = true
        commentView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20).isActive = true
        commentView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20).isActive = true
        commentView.heightAnchor.constraint(equalToConstant: 110).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
