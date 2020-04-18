//
//  CustomTableViewCell.swift
//  SampleListTask
//
//  Created by Narendra Biswa on 03/04/20.
//  Copyright © 2020 Narendra Biswa. All rights reserved.
//

import UIKit


import UIKit

class CustomTableViewCell: UITableViewCell {
    
    
    let rowImageView:UIImageView = {
        let img = UIImageView()
        img.contentMode = .scaleAspectFit // image will never be strecthed vertially or horizontally
        img.translatesAutoresizingMaskIntoConstraints = false // enable autolayout
        img.layer.cornerRadius = 35
        img.clipsToBounds = true
        return img
    }()
    
    let rowTitleLabel:UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.textColor = .black
        //            label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let rowDescriptionLabel:UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 14)
        label.textColor =  .black
        
        label.clipsToBounds = true
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        
        
        let marginGuide = contentView.layoutMarginsGuide
        // configure titleLabel
        
        self.contentView.addSubview(rowImageView)
        self.contentView.addSubview(rowTitleLabel)
        self.contentView.addSubview(rowDescriptionLabel)
        
        
        
        rowImageView.translatesAutoresizingMaskIntoConstraints = false
        rowImageView.centerYAnchor.constraint(equalTo:self.contentView.centerYAnchor).isActive = true
        rowImageView.leadingAnchor.constraint(equalTo:self.contentView.leadingAnchor, constant:10).isActive = true
        rowImageView.widthAnchor.constraint(equalToConstant:70).isActive = true
        // rowImageView.heightAnchor.constraint(equalToConstant:70).isActive = true
        rowImageView.bottomAnchor.constraint(equalTo: marginGuide.bottomAnchor).isActive = true
        
        
        
        rowTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        rowTitleLabel.leadingAnchor.constraint(equalTo: marginGuide.leadingAnchor,constant:  90).isActive = true
        rowTitleLabel.topAnchor.constraint(equalTo: marginGuide.topAnchor).isActive = true
        rowTitleLabel.trailingAnchor.constraint(equalTo: marginGuide.trailingAnchor).isActive = true
        rowTitleLabel.numberOfLines = 0
        
        rowDescriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        rowDescriptionLabel.leadingAnchor.constraint(equalTo: marginGuide.leadingAnchor,constant:  90).isActive = true
        rowDescriptionLabel.bottomAnchor.constraint(equalTo: marginGuide.bottomAnchor).isActive = true
        rowDescriptionLabel.trailingAnchor.constraint(equalTo: marginGuide.trailingAnchor).isActive = true
        rowDescriptionLabel.topAnchor.constraint(equalTo: rowTitleLabel.bottomAnchor).isActive = true
        rowDescriptionLabel.numberOfLines = 0
        
        
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        
        super.init(coder: aDecoder)
    }
    
}
