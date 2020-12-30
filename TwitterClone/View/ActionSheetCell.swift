//
//  ActionSheetCell.swift
//  TwitterClone
//
//  Created by 罗帅卿 on 12/29/20.
//

import UIKit

class ActionSheetCell: UITableViewCell {
    
    // MARK: - Properties
    
    private let optionImageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFit
        iv.clipsToBounds = true
        iv.image = #imageLiteral(resourceName: "twitter_logo_blue")
        return iv
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 18)
        label.text = "Test Option"
        return label
    }()
    
    // MARK: - Lifecycle
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        addSubview(optionImageView)
        optionImageView.centerY(view: self)
        optionImageView.anchor(leading: leadingAnchor, paddingLeft: 8)
        optionImageView.setDimensions(width: 36, height: 36)
        
        addSubview(titleLabel)
        titleLabel.centerY(view: self)
        titleLabel.anchor(leading: optionImageView.trailingAnchor, paddingLeft: 12)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
