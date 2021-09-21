//
//  FinanView.swift
//  Finan
//
//  Created by tambanco 🥳 on 20.09.2021.
//

import UIKit

class FinanView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = UIColor.init(rgb: 0xF7F6F2)
        
        addSubview(CategoriesView.init(frame: CGRect(x: 20, y: 50, width: self.frame.width - 40, height: 200)))
        addSubview(PriceView.init(frame: CGRect(x: 20, y: 280, width: self.frame.width - 40, height: 150)))
        addSubview(CommentView.init(frame: CGRect(x: 20, y: 450, width: self.frame.width - 40, height: 150)))

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
