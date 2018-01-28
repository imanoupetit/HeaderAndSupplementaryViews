//
//  HeaderReusableView.swift
//  HeaderAndSupplementaryViews
//
//  Created by Imanou on 28/01/2018.
//  Copyright © 2018 Imanou. All rights reserved.
//

import UIKit

class HeaderReusableView: UICollectionReusableView {
    
    let label = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .magenta
        addSubview(label)
        
        label.translatesAutoresizingMaskIntoConstraints = false
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-[label]-|", options: [], metrics: nil, views: ["label": label]))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-[label]-|", options: [], metrics: nil, views: ["label": label]))
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
