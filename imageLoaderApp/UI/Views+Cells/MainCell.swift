//
//  MainCell.swift
//  imageLoaderApp
//
//  Created by kirill on 4/10/19.
//  Copyright © 2019 kirill. All rights reserved.
//

import UIKit
import SwiftGifOrigin


class GifCell : UITableViewCell {
    private let mainTextLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.textAlignment = NSTextAlignment.center
        label.numberOfLines = 4
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let mainImage : UIImageView = {
        let imgView = UIImageView()
        imgView.contentMode = .scaleAspectFit
        imgView.clipsToBounds = true
        imgView.translatesAutoresizingMaskIntoConstraints = false
        return imgView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?){
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.contentView.addSubview(mainTextLabel)
        self.contentView.addSubview(mainImage)
        
        mainImage.widthAnchor.constraint(equalToConstant: 40).isActive = true
        mainImage.heightAnchor.constraint(equalToConstant: 60).isActive = true
        mainImage.centerYAnchor.constraint(equalTo: self.contentView.centerYAnchor).isActive = true
        mainImage.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 20).isActive = true
 
        mainTextLabel.centerYAnchor.constraint(equalTo: self.contentView.centerYAnchor).isActive = true
        mainTextLabel.centerXAnchor.constraint(equalTo: self.contentView.centerXAnchor, constant: 20).isActive = true
        mainTextLabel.widthAnchor.constraint(equalTo: self.contentView.widthAnchor, multiplier: 0.7).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUp(with text: String, _ image: String) {
        let gif = UIImage.gif(url: image)
        
        self.mainImage.image = gif
        self.mainTextLabel.text = text
    }
}

