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
        
        // FinanView
        let finanView = UIView()
        finanView.backgroundColor = Constants.viewBGColor
        finanView.layer.cornerRadius = Constants.cardsCornerRadius
        finanView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(finanView)

        // CategoriesView
        let categoriesSubView = UIView()
        categoriesSubView.backgroundColor = Constants.cardsBGColor
//        categoriesSubView.backgroundColor = #colorLiteral(red: 0.7254902124, green: 0.4784313738, blue: 0.09803921729, alpha: 1)
        categoriesSubView.translatesAutoresizingMaskIntoConstraints = false
        finanView.addSubview(categoriesSubView)
        
        let categoriesLabel = UILabel()
        categoriesLabel.font = UIFont.systemFont(ofSize: Constants.titleFont)
        categoriesLabel.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
//        categoriesLabel.backgroundColor = #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1)
        categoriesLabel.textAlignment = .left
        categoriesLabel.text = "Categories"
        categoriesLabel.translatesAutoresizingMaskIntoConstraints = false
        categoriesSubView.addSubview(categoriesLabel)
        
        let addCatButton = UIButton(frame: CGRect())
        addCatButton.setImage(UIImage(systemName: "plus.circle"), for: .normal)
        addCatButton.tintColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
//        addCatButton.backgroundColor = #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1)
        addCatButton.contentHorizontalAlignment = .trailing
        addCatButton.addTarget(self, action: #selector(setCategories), for: .touchUpInside)
        addCatButton.translatesAutoresizingMaskIntoConstraints = false
        categoriesSubView.addSubview(addCatButton)
        
        //PriceView
        let priceSubView = UIView()
        priceSubView.backgroundColor = Constants.cardsBGColor
//        priceSubView.backgroundColor = #colorLiteral(red: 0.7254902124, green: 0.4784313738, blue: 0.09803921729, alpha: 1)
        priceSubView.translatesAutoresizingMaskIntoConstraints = false
        finanView.addSubview(priceSubView)
        
        let priceLabel = UILabel()
        priceLabel.font = UIFont.systemFont(ofSize: Constants.titleFont)
        priceLabel.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
//        priceLabel.backgroundColor = #colorLiteral(red: 0.7254902124, green: 0.4784313738, blue: 0.09803921729, alpha: 1)
        priceLabel.textAlignment = .left
        priceLabel.text = "Price"
        priceLabel.translatesAutoresizingMaskIntoConstraints = false
        priceSubView.addSubview(priceLabel)
        
        let priceTextField =  UITextField(frame: CGRect())
        priceTextField.placeholder = "Enter price here"
        priceTextField.font = UIFont.systemFont(ofSize: 15)
        priceTextField.borderStyle = UITextField.BorderStyle.roundedRect
        priceTextField.autocorrectionType = UITextAutocorrectionType.no
        priceTextField.keyboardType = UIKeyboardType.default
        priceTextField.returnKeyType = UIReturnKeyType.done
        priceTextField.clearButtonMode = UITextField.ViewMode.whileEditing
        priceTextField.contentVerticalAlignment = UIControl.ContentVerticalAlignment.center
        priceTextField.translatesAutoresizingMaskIntoConstraints = false
        priceSubView.addSubview(priceTextField)
        
        let currencyLabel = UILabel()
        currencyLabel.font = UIFont.systemFont(ofSize: Constants.titleFont)
        currencyLabel.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
//        currencyLabel.backgroundColor = #colorLiteral(red: 0.7254902124, green: 0.4784313738, blue: 0.09803921729, alpha: 1)
        currencyLabel.textAlignment = .left
        currencyLabel.text = "RUB"
        currencyLabel.translatesAutoresizingMaskIntoConstraints = false
        priceSubView.addSubview(currencyLabel)

        
        //CommentsView
        let commentSubView = UIView()
        commentSubView.backgroundColor = Constants.cardsBGColor
//        commentSubView.backgroundColor = #colorLiteral(red: 0.7254902124, green: 0.4784313738, blue: 0.09803921729, alpha: 1)
        commentSubView.translatesAutoresizingMaskIntoConstraints = false
        finanView.addSubview(commentSubView)
        
        let commentLabel = UILabel()
        commentLabel.font = UIFont.systemFont(ofSize: 32)
        commentLabel.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        commentLabel.textAlignment = .left
        commentLabel.text = "Comment"
        commentLabel.translatesAutoresizingMaskIntoConstraints = false
        commentSubView.addSubview(commentLabel)
        
        let commentTextField =  UITextField(frame: CGRect())
        commentTextField.placeholder = "Enter price here"
        commentTextField.font = UIFont.systemFont(ofSize: 15)
        commentTextField.borderStyle = UITextField.BorderStyle.roundedRect
        commentTextField.autocorrectionType = UITextAutocorrectionType.no
        commentTextField.keyboardType = UIKeyboardType.default
        commentTextField.returnKeyType = UIReturnKeyType.done
        commentTextField.clearButtonMode = UITextField.ViewMode.whileEditing
        commentTextField.contentVerticalAlignment = UIControl.ContentVerticalAlignment.center
        commentTextField.translatesAutoresizingMaskIntoConstraints = false
        commentSubView.addSubview(commentTextField)
        
        let addImageButton = UIButton(frame: CGRect())
        addImageButton.setImage(UIImage(systemName: "photo.on.rectangle"), for: .normal)
        addImageButton.tintColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        addImageButton.addTarget(self, action: #selector(inputImage), for: .touchUpInside)
        addImageButton.translatesAutoresizingMaskIntoConstraints = false
        commentSubView.addSubview(addImageButton)
        
        //save Button
        let saveButton = UIButton(frame: CGRect())
        saveButton.setTitle("Save", for: .normal)
        saveButton.tintColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        saveButton.layer.cornerRadius = Constants.cardsCornerRadius
        saveButton.backgroundColor = #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)
        saveButton.addTarget(self, action: #selector(save), for: .touchUpInside)
        saveButton.translatesAutoresizingMaskIntoConstraints = false
        finanView.addSubview(saveButton)
        
        let constraints = [finanView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 40),
                           finanView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
                           finanView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
                           finanView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
                           
                           //categoriesSubView constraints
                           categoriesSubView.topAnchor.constraint(equalTo: finanView.topAnchor, constant: 15),
                           categoriesSubView.leadingAnchor.constraint(equalTo: finanView.leadingAnchor, constant: 15),
                           categoriesSubView.trailingAnchor.constraint(equalTo: finanView.trailingAnchor, constant: -15),
                           categoriesSubView.heightAnchor.constraint(equalToConstant: 150),
                           
                           categoriesLabel.topAnchor.constraint(equalTo: categoriesSubView.topAnchor, constant: 15),
                           categoriesLabel.leadingAnchor.constraint(equalTo: categoriesSubView.leadingAnchor, constant: 15),
                           
                           addCatButton.topAnchor.constraint(equalTo: categoriesSubView.topAnchor, constant: 15),
                           addCatButton.trailingAnchor.constraint(equalTo: categoriesSubView.trailingAnchor, constant: -15),
                           addCatButton.centerYAnchor.constraint(equalTo: categoriesLabel.centerYAnchor),
                           
                           //priceSubView constraints
                           priceSubView.topAnchor.constraint(equalTo: categoriesSubView.bottomAnchor, constant: 15),
                           priceSubView.leadingAnchor.constraint(equalTo: finanView.leadingAnchor, constant: 15),
                           priceSubView.trailingAnchor.constraint(equalTo: finanView.trailingAnchor, constant: -15),
                           priceSubView.heightAnchor.constraint(equalToConstant: 150),
                           
                           priceLabel.topAnchor.constraint(equalTo: priceSubView.topAnchor, constant: 15),
                           priceLabel.leadingAnchor.constraint(equalTo: priceSubView.leadingAnchor, constant: 15),
                           
                           priceTextField.topAnchor.constraint(equalTo: priceLabel.bottomAnchor, constant: 15),
                           priceTextField.leadingAnchor.constraint(equalTo: priceSubView.leadingAnchor, constant: 15),
                           
                           currencyLabel.topAnchor.constraint(equalTo: priceLabel.bottomAnchor, constant: 15),
                           currencyLabel.leadingAnchor.constraint(equalTo: priceTextField.trailingAnchor, constant: 15),
                           currencyLabel.centerYAnchor.constraint(equalTo: priceTextField.centerYAnchor),
                           
                           //commentSubView constraints
                           commentSubView.topAnchor.constraint(equalTo: priceSubView.bottomAnchor, constant: 15),
                           commentSubView.leadingAnchor.constraint(equalTo: finanView.leadingAnchor, constant: 15),
                           commentSubView.trailingAnchor.constraint(equalTo: finanView.trailingAnchor, constant: -15),
                           commentSubView.heightAnchor.constraint(equalToConstant: 150),
                           
                           commentLabel.topAnchor.constraint(equalTo: commentSubView.topAnchor, constant: 15),
                           commentLabel.leadingAnchor.constraint(equalTo: commentSubView.leadingAnchor, constant: 15),
                           
                           commentTextField.topAnchor.constraint(equalTo: commentLabel.bottomAnchor, constant: 15),
                           commentTextField.leadingAnchor.constraint(equalTo: commentSubView.leadingAnchor, constant: 15),
                           
                           addImageButton.topAnchor.constraint(equalTo: commentSubView.topAnchor, constant: 15),
                           addImageButton.trailingAnchor.constraint(equalTo: commentSubView.trailingAnchor, constant: -15),
                           addImageButton.centerYAnchor.constraint(equalTo: commentLabel.centerYAnchor),
                           
                           // save button
                           saveButton.topAnchor.constraint(equalTo: commentSubView.bottomAnchor, constant: 15),
                           saveButton.leadingAnchor.constraint(equalTo: finanView.leadingAnchor, constant: 15),
                           saveButton.trailingAnchor.constraint(equalTo: finanView.trailingAnchor, constant: -15),
                           saveButton.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor, constant: -15)

                           
        ]
        NSLayoutConstraint.activate(constraints)
    }
    
    @objc func setCategories() {
        print(#function)
    }
    
    @objc func inputImage() {
        
    }
    
    @objc func save() {
        
    }
}
