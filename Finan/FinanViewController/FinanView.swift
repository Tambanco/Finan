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
        
        self.backgroundColor = #colorLiteral(red: 0.9764705896, green: 0.850980401, blue: 0.5490196347, alpha: 1)
        
        addSubview(CategoriesView.init(frame: CGRect(x: 20, y: 50, width: self.frame.width - 40, height: 300)))
        addSubview(PriceView.init(frame: CGRect(x: 20, y: 390, width: self.frame.width - 40, height: 100)))

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
