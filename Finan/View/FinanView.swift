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
        view.backgroundColor = .black
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    var priceView: UIView = {
        let view = UIView()
        view.backgroundColor = Constants.cardsBGColor
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    var commentView: UIView = {
        let view = UIView()
        view.backgroundColor = Constants.cardsBGColor
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    var saveView: UIView = {
        let view = UIView()
        view.backgroundColor = Constants.cardsBGColor
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
        label.backgroundColor = .green
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var setCategoryButton: UIButton = {
        let button = UIButton(frame: CGRect())
        button.setImage(UIImage(systemName: "plus.circle"), for: .normal)
        button.tintColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        button.contentHorizontalAlignment = .trailing
        button.backgroundColor = .green
        button.addTarget(self, action: #selector(setCategories), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    //priceView Content
    var priceLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 32)
        label.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        label.textAlignment = .left
        label.text = "Price"
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
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var commentTextField: UITextField = {
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
    
    var setImageButton: UIButton = {
        let button = UIButton(frame: CGRect())
        button.setImage(UIImage(systemName: "photo.on.rectangle"), for: .normal)
        button.tintColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        button.addTarget(self, action: #selector(inputImage), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    //saveView Content
    var saveButton: UIButton = {
        let button = UIButton(frame: CGRect())
        button.setTitle("Save", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 32)
        button.tintColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        button.backgroundColor = Constants.buttonsBGColor
        button.addTarget(self, action: #selector(saver), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    // MARK: - Initialisers
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = #colorLiteral(red: 0.1411764771, green: 0.3960784376, blue: 0.5647059083, alpha: 1)
        layer.cornerRadius = 10.0
        translatesAutoresizingMaskIntoConstraints = false
        
        overlayCategoriesView()
        overlayCategoriesViewContent()
        
        overlayPriceView()
        overlayPriceViewContent()
        
        overlayCommentsView()
        overlayCommentsViewContent()
        
//        overlaySaveView()
//        overlaySaveViewContent()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Button methods
    @objc private func setCategories() {
        self.delegate?.finanViewAddCategoriesButtonClicked()
    }
    
    @objc private func inputImage() {
        print(#function)
    }
    
    @objc private func saver() {
        print(#function)
    }
    
    // MARK: - Categories view content
    func overlayCategoriesViewContent() {
        categoriesView.addSubview(categoryLabel)
        categoriesView.addSubview(setCategoryButton)
        
        categoryLabel.topAnchor.constraint(equalTo: categoriesView.topAnchor, constant: 10).isActive = true
        categoryLabel.leadingAnchor.constraint(equalTo: categoriesView.leadingAnchor, constant: 10).isActive = true
        
        setCategoryButton.topAnchor.constraint(equalTo: categoriesView.topAnchor, constant: 10).isActive = true
        setCategoryButton.trailingAnchor.constraint(equalTo: categoriesView.trailingAnchor, constant: -10).isActive = true
    }
    
    func overlayCategoriesView() {
        addSubview(categoriesView)
        
        categoriesView.topAnchor.constraint(equalTo: topAnchor, constant: 10).isActive = true
        categoriesView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10).isActive = true
        categoriesView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10).isActive = true
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
        
        priceTextField.topAnchor.constraint(equalTo: priceLabel.bottomAnchor, constant: 10).isActive = true
        priceTextField.leadingAnchor.constraint(equalTo: priceView.leadingAnchor, constant: 10).isActive = true
        priceTextField.trailingAnchor.constraint(equalTo: currencyLabel.leadingAnchor, constant: -10).isActive = true
        
        currencyLabel.topAnchor.constraint(equalTo: priceLabel.bottomAnchor, constant: 10).isActive = true
        currencyLabel.trailingAnchor.constraint(equalTo: priceView.trailingAnchor, constant: -10).isActive = true
    }
    
    func overlayPriceView() {
        addSubview(priceView)
        
        priceView.topAnchor.constraint(equalTo: categoriesView.bottomAnchor, constant: 0).isActive = true
        priceView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10).isActive = true
        priceView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10).isActive = true
        priceView.heightAnchor.constraint(equalToConstant: 110).isActive = true
    }
    
    
    // MARK: - Comments view content
    func overlayCommentsViewContent() {
        commentView.addSubview(commentLabel)
        commentView.addSubview(setImageButton)
        commentView.addSubview(commentTextField)
        
        commentLabel.topAnchor.constraint(equalTo: commentView.topAnchor, constant: 10).isActive = true
        commentLabel.leadingAnchor.constraint(equalTo: commentView.leadingAnchor, constant: 10).isActive = true
        commentLabel.trailingAnchor.constraint(equalTo: setImageButton.leadingAnchor, constant: 10).isActive = true
        
        setImageButton.topAnchor.constraint(equalTo: commentView.topAnchor, constant: 10).isActive = true
        setImageButton.trailingAnchor.constraint(equalTo: commentView.trailingAnchor, constant: -10).isActive = true
        
        commentTextField.topAnchor.constraint(equalTo: commentLabel.bottomAnchor, constant: 10).isActive = true
        commentTextField.leadingAnchor.constraint(equalTo: commentView.leadingAnchor, constant: 10).isActive = true
        commentTextField.trailingAnchor.constraint(equalTo: commentView.trailingAnchor, constant: -10).isActive = true
        
    }
    
    func overlayCommentsView() {
        addSubview(commentView)
        
        commentView.topAnchor.constraint(equalTo: priceView.bottomAnchor, constant: 0).isActive = true
        commentView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10).isActive = true
        commentView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10).isActive = true
        commentView.heightAnchor.constraint(equalToConstant: 110).isActive = true
    }
    
    // MARK: - Save view content
//    func overlaySaveViewContent() {
//        saveView.addSubview(saveButton)
//
//        saveButton.topAnchor.constraint(equalTo: topAnchor, constant: 10).isActive = true
//        saveButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10).isActive = true
//    }
//
//    func overlaySaveView() {
//        addSubview(saveView)
//
//        saveView.topAnchor.constraint(equalTo: commentView.bottomAnchor, constant: 0).isActive = true
//        saveView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10).isActive = true
//        saveView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10).isActive = true
//    }
    
}
