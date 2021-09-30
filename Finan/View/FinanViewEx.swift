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
        categoriesSubView.backgroundColor = #colorLiteral(red: 0.7254902124, green: 0.4784313738, blue: 0.09803921729, alpha: 1)
        categoriesSubView.translatesAutoresizingMaskIntoConstraints = false
        finanView.addSubview(categoriesSubView)
        
        let categoriesLabel = UILabel()
        categoriesLabel.font = UIFont.systemFont(ofSize: Constants.titleFont)
        categoriesLabel.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        categoriesLabel.backgroundColor = #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1)
        categoriesLabel.textAlignment = .left
        categoriesLabel.text = "Categories"
        categoriesLabel.translatesAutoresizingMaskIntoConstraints = false
        categoriesSubView.addSubview(categoriesLabel)
        
        let addCatButton = UIButton(frame: CGRect())
        addCatButton.setImage(UIImage(systemName: "plus.circle"), for: .normal)
        addCatButton.tintColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        addCatButton.backgroundColor = #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1)
        addCatButton.contentHorizontalAlignment = .trailing
        addCatButton.addTarget(self, action: #selector(setCategories), for: .touchUpInside)
        addCatButton.translatesAutoresizingMaskIntoConstraints = false
        categoriesSubView.addSubview(addCatButton)
        
        //PriceView
        let priceSubView = UIView()
        priceSubView.backgroundColor = Constants.cardsBGColor
        priceSubView.backgroundColor = #colorLiteral(red: 0.7254902124, green: 0.4784313738, blue: 0.09803921729, alpha: 1)
        priceSubView.translatesAutoresizingMaskIntoConstraints = false
        finanView.addSubview(priceSubView)
        
        let priceLabel = UILabel()
        priceLabel.font = UIFont.systemFont(ofSize: Constants.titleFont)
        priceLabel.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        priceLabel.backgroundColor = #colorLiteral(red: 0.7254902124, green: 0.4784313738, blue: 0.09803921729, alpha: 1)
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
        currencyLabel.backgroundColor = #colorLiteral(red: 0.7254902124, green: 0.4784313738, blue: 0.09803921729, alpha: 1)
        currencyLabel.textAlignment = .left
        currencyLabel.text = "RUB"
        currencyLabel.translatesAutoresizingMaskIntoConstraints = false
        priceSubView.addSubview(currencyLabel)

        let constraints = [finanView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 40),
                           finanView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
                           finanView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
                           finanView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
                           
                           //categoriesSubView constraints
                           categoriesSubView.topAnchor.constraint(equalTo: finanView.topAnchor, constant: 15),
                           categoriesSubView.leadingAnchor.constraint(equalTo: finanView.leadingAnchor, constant: 15),
                           categoriesSubView.trailingAnchor.constraint(equalTo: finanView.trailingAnchor, constant: -15),
                           categoriesSubView.heightAnchor.constraint(equalToConstant: 60),
                           
                           categoriesLabel.topAnchor.constraint(equalTo: categoriesSubView.topAnchor, constant: 15),
                           categoriesLabel.leadingAnchor.constraint(equalTo: categoriesSubView.leadingAnchor, constant: 15),
                           
                           addCatButton.topAnchor.constraint(equalTo: categoriesSubView.topAnchor, constant: 15),
                           addCatButton.trailingAnchor.constraint(equalTo: categoriesSubView.trailingAnchor, constant: -15),
                           addCatButton.centerYAnchor.constraint(equalTo: categoriesLabel.centerYAnchor),
                           
                           //priceSubView constraints
                           priceSubView.topAnchor.constraint(equalTo: categoriesSubView.bottomAnchor, constant: 15),
                           priceSubView.leadingAnchor.constraint(equalTo: finanView.leadingAnchor, constant: 15),
                           priceSubView.trailingAnchor.constraint(equalTo: finanView.trailingAnchor, constant: -15),
                           priceSubView.heightAnchor.constraint(equalToConstant: 60),
                           
                           priceLabel.topAnchor.constraint(equalTo: priceSubView.topAnchor, constant: 15),
                           priceLabel.leadingAnchor.constraint(equalTo: priceSubView.leadingAnchor, constant: 15),
                           
                           priceTextField.topAnchor.constraint(equalTo: priceLabel.bottomAnchor, constant: 15),
                           priceTextField.leadingAnchor.constraint(equalTo: priceSubView.leadingAnchor, constant: 15),
                           
                           currencyLabel.topAnchor.constraint(equalTo: priceLabel.bottomAnchor, constant: 15),
                           currencyLabel.leadingAnchor.constraint(equalTo: priceTextField.trailingAnchor, constant: 15),
                           currencyLabel.centerYAnchor.constraint(equalTo: priceTextField.centerYAnchor)
                           

                           
        ]
        NSLayoutConstraint.activate(constraints)
    }
    
    @objc func setCategories() {
        print(#function)
    }
}
