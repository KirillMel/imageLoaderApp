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
        label.font = UIFont.boldSystemFont(ofSize: 18)
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
        self.setConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUp(with text: String, _ image: Data) {
        let gif = UIImage.gif(data: image)
        
        self.mainImage.image = gif
        self.mainTextLabel.text = text
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([mainImage.widthAnchor.constraint(equalToConstant: 120),
                                     mainImage.heightAnchor.constraint(equalToConstant: 140),
                                     mainImage.centerYAnchor.constraint(equalTo: self.contentView.centerYAnchor),
                                     mainImage.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 10),
                                     mainTextLabel.centerYAnchor.constraint(equalTo: self.contentView.centerYAnchor),
                                     mainTextLabel.leadingAnchor.constraint(equalTo: self.mainImage.trailingAnchor, constant: 10),
                                     mainTextLabel.widthAnchor.constraint(equalTo: self.contentView.widthAnchor, multiplier: 1.0, constant: -160)])
    }
}

