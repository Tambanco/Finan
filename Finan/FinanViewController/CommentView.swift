//
//  CommentView.swift
//  Finan
//
//  Created by tambanco 🥳 on 20.09.2021.
//

import UIKit

class CommentView: UIView {
    
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
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = UIColor.init(rgb: 0x4B6587)
        self.layer.cornerRadius = 10.0
        
        addSubview(commentLabel)
        addSubview(commentInput)
        
        commentLabel.anchor(top: topAnchor,
                          leading: leadingAnchor,
                          bottom: commentInput.topAnchor,
                          trailing: trailingAnchor,
                          padding: UIEdgeInsets(top: 10,
                                                left: 10,
                                                bottom: 0,
                                                right: 10))
        
        commentInput.anchor(top: commentLabel.bottomAnchor,
                          leading: leadingAnchor,
                          bottom: bottomAnchor,
                          trailing: trailingAnchor,
                          padding: UIEdgeInsets(top: 10,
                                                left: 10,
                                                bottom: 10,
                                                right: 10))
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
