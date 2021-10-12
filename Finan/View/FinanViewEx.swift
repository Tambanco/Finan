//
//  FinanViewEx.swift
//  Finan
//
//  Created by tambanco 🥳 on 30.09.2021.
//

import Foundation
import UIKit
import TagListView
import CoreData

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
        categoriesSubView.translatesAutoresizingMaskIntoConstraints = false
        finanView.addSubview(categoriesSubView)
        
        let categoriesLabel = UILabel()
        categoriesLabel.font = UIFont.systemFont(ofSize: Constants.titleFont)
        categoriesLabel.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        categoriesLabel.textAlignment = .left
        categoriesLabel.text = "Categories"
        categoriesLabel.translatesAutoresizingMaskIntoConstraints = false
        categoriesSubView.addSubview(categoriesLabel)
        
        let addCatButton = UIButton(frame: CGRect())
        addCatButton.contentEdgeInsets = UIEdgeInsets(top: 0, left: 7, bottom: 0, right: 7)
        addCatButton.setImage(UIImage(systemName: "plus"), for: .normal)
        addCatButton.tintColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        addCatButton.layer.borderColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        addCatButton.layer.cornerRadius = Constants.cardsCornerRadius
        addCatButton.layer.borderWidth = Constants.borderWidth
        addCatButton.addTarget(self, action: #selector(setCategories), for: .touchUpInside)
        addCatButton.translatesAutoresizingMaskIntoConstraints = false
        categoriesSubView.addSubview(addCatButton)
        
        let categoriesTagView = TagListView()
        setupTags(categoriesTagView: categoriesTagView)
        categoriesSubView.addSubview(categoriesTagView)
        
        //PriceView
        let priceSubView = UIView()
        priceSubView.backgroundColor = Constants.cardsBGColor
        priceSubView.translatesAutoresizingMaskIntoConstraints = false
        finanView.addSubview(priceSubView)
        
        let priceLabel = UILabel()
        priceLabel.font = UIFont.systemFont(ofSize: Constants.titleFont)
        priceLabel.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
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
        currencyLabel.font = UIFont.systemFont(ofSize: Constants.currencyFont)
        currencyLabel.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        currencyLabel.textAlignment = .left
        currencyLabel.text = "RUB"
        currencyLabel.translatesAutoresizingMaskIntoConstraints = false
        priceSubView.addSubview(currencyLabel)

        //CommentsView
        let commentSubView = UIView()
        commentSubView.backgroundColor = Constants.cardsBGColor
        commentSubView.translatesAutoresizingMaskIntoConstraints = false
        finanView.addSubview(commentSubView)
        
        let commentLabel = UILabel()
        commentLabel.font = UIFont.systemFont(ofSize: Constants.titleFont)
        commentLabel.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        commentLabel.textAlignment = .left
        commentLabel.text = "Comment"
        commentLabel.translatesAutoresizingMaskIntoConstraints = false
        commentSubView.addSubview(commentLabel)
        
        let commentTextField =  UITextField(frame: CGRect())
        commentTextField.placeholder = "Enter price here"
        commentTextField.font = UIFont.systemFont(ofSize: Constants.textFieldFont)
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
        addImageButton.contentEdgeInsets = UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
        addImageButton.tintColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        addImageButton.layer.borderColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        addImageButton.layer.cornerRadius = Constants.cardsCornerRadius
        addImageButton.layer.borderWidth = Constants.borderWidth
        addImageButton.addTarget(self, action: #selector(inputImage), for: .touchUpInside)
        addImageButton.translatesAutoresizingMaskIntoConstraints = false
        commentSubView.addSubview(addImageButton)
        
        //save Button
        let saveButton = UIButton(frame: CGRect())
        saveButton.setTitle("Save", for: .normal)
        saveButton.tintColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        saveButton.titleLabel?.font = UIFont.systemFont(ofSize: Constants.currencyFont)
        saveButton.layer.borderColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        saveButton.layer.cornerRadius = Constants.cardsCornerRadius
        saveButton.layer.borderWidth = Constants.borderWidth
        saveButton.addTarget(self, action: #selector(save), for: .touchUpInside)
        saveButton.translatesAutoresizingMaskIntoConstraints = false
        finanView.addSubview(saveButton)
        
        let constraints = [finanView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 100),
                           finanView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
                           finanView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
                           finanView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
                           
                           //categoriesSubView constraints
                           categoriesSubView.topAnchor.constraint(equalTo: finanView.topAnchor, constant: 10),
                           categoriesSubView.leadingAnchor.constraint(equalTo: finanView.leadingAnchor, constant: 10),
                           categoriesSubView.trailingAnchor.constraint(equalTo: finanView.trailingAnchor, constant: -10),
                           categoriesSubView.heightAnchor.constraint(equalToConstant: 60),
                           
                           categoriesLabel.topAnchor.constraint(equalTo: categoriesSubView.topAnchor, constant: 10),
                           categoriesLabel.leadingAnchor.constraint(equalTo: categoriesSubView.leadingAnchor, constant: 10),
                           
                           addCatButton.topAnchor.constraint(equalTo: categoriesSubView.topAnchor, constant: 10),
                           addCatButton.trailingAnchor.constraint(equalTo: categoriesSubView.trailingAnchor, constant: -10),
                           addCatButton.centerYAnchor.constraint(equalTo: categoriesLabel.centerYAnchor),
                           
                           //priceSubView constraints
                           priceSubView.topAnchor.constraint(equalTo: categoriesTagView.bottomAnchor, constant: 10),
                           priceSubView.leadingAnchor.constraint(equalTo: finanView.leadingAnchor, constant: 10),
                           priceSubView.trailingAnchor.constraint(equalTo: finanView.trailingAnchor, constant: -10),
                           priceSubView.heightAnchor.constraint(equalToConstant: 100),
                           
                           priceLabel.topAnchor.constraint(equalTo: priceSubView.topAnchor, constant: 10),
                           priceLabel.leadingAnchor.constraint(equalTo: priceSubView.leadingAnchor, constant: 10),
                           
                           priceTextField.topAnchor.constraint(equalTo: priceLabel.bottomAnchor, constant: 10),
                           priceTextField.leadingAnchor.constraint(equalTo: priceSubView.leadingAnchor, constant: 10),
                           priceTextField.trailingAnchor.constraint(equalTo: currencyLabel.leadingAnchor, constant: -10),
                           
                           currencyLabel.topAnchor.constraint(equalTo: priceLabel.bottomAnchor, constant: 10),
                           currencyLabel.trailingAnchor.constraint(equalTo: priceSubView.trailingAnchor, constant: -10),
                           currencyLabel.centerYAnchor.constraint(equalTo: priceTextField.centerYAnchor),
                           
                           //commentSubView constraints
                           commentSubView.topAnchor.constraint(equalTo: priceSubView.bottomAnchor, constant: 10),
                           commentSubView.leadingAnchor.constraint(equalTo: finanView.leadingAnchor, constant: 10),
                           commentSubView.trailingAnchor.constraint(equalTo: finanView.trailingAnchor, constant: -10),
                           commentSubView.heightAnchor.constraint(equalToConstant: 100),
                           
                           commentLabel.topAnchor.constraint(equalTo: commentSubView.topAnchor, constant: 10),
                           commentLabel.leadingAnchor.constraint(equalTo: commentSubView.leadingAnchor, constant: 10),
                           
                           commentTextField.topAnchor.constraint(equalTo: commentLabel.bottomAnchor, constant: 10),
                           commentTextField.leadingAnchor.constraint(equalTo: commentSubView.leadingAnchor, constant: 10),
                           commentTextField.trailingAnchor.constraint(equalTo: commentSubView.trailingAnchor, constant: -10),
                           
                           addImageButton.topAnchor.constraint(equalTo: commentSubView.topAnchor, constant: 10),
                           addImageButton.trailingAnchor.constraint(equalTo: commentSubView.trailingAnchor, constant: -10),
                           addImageButton.centerYAnchor.constraint(equalTo: commentLabel.centerYAnchor),
                           
                           // save button
                           saveButton.topAnchor.constraint(equalTo: commentSubView.bottomAnchor, constant: 10),
                           saveButton.leadingAnchor.constraint(equalTo: finanView.leadingAnchor, constant: 10),
                           saveButton.trailingAnchor.constraint(equalTo: finanView.trailingAnchor, constant: -10),
                           saveButton.heightAnchor.constraint(equalToConstant: 50)
        ]
        NSLayoutConstraint.activate(constraints)
    }
    
    
    @objc func setCategories() {
        performSegue(withIdentifier: "showCategories", sender: nil)
    }
    
    @objc func inputImage() {
        print(#function)
    }
    
    @objc func save() {
        print(#function)
    }
    
    func someFunc() {
        print(#function)
    }
    
    // MARK: - Create categories
    func createCategories() {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        let managedContext = appDelegate.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Categories")
        
        do {
            categories = try managedContext.fetch(fetchRequest)
            categoriesArr = categories.map { $0.value(forKey: "categoryName") as! String }
        } catch let error as NSError {
            print("Could not fetch. \(error), \(error.userInfo)")
        }
    }
    
    func setupTags(categoriesTagView: TagListView) {
        categoriesTagView.frame = CGRect(x: 0, y: 75, width: 350, height: 100)
        categoriesTagView.backgroundColor = Constants.cardsBGColor
        categoriesTagView.textFont = UIFont.systemFont(ofSize: Constants.tagFont)
        categoriesTagView.tagBackgroundColor = .clear
        categoriesTagView.cornerRadius = Constants.cardsCornerRadius
        categoriesTagView.borderColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        categoriesTagView.borderWidth = Constants.borderWidth
        categoriesTagView.paddingX = Constants.paddingX
        categoriesTagView.paddingY = Constants.paddingY
        categoriesTagView.alignment = .center
        categoriesTagView.addTags(categoriesArr)
    }
}
