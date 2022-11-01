//
//  CustomListCollectionViewCell.swift
//  HearthstoneCards
//
//  Created by Victor Britto e Barros on 28/10/22.
//

import UIKit

class CustomListCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "CustomListCollectionViewCell"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        defineLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private var label: UILabel!
    
    private var type: CategoryTypes?
    private var nameItem: String?
        
    private func defineLayout() {
        label = {
            let lb = UILabel()
            lb.translatesAutoresizingMaskIntoConstraints = false
            lb.textColor = .black
            lb.numberOfLines = 2
            lb.textAlignment = .center
            return lb
        }()
        
        contentView.addSubview(label)
        
        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            label.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            label.widthAnchor.constraint(lessThanOrEqualTo: contentView.widthAnchor, multiplier: 0.8)
        ])
    }
    
    func setData(type: CategoryTypes, nameItem: String) {
        self.type = type
        self.nameItem = nameItem
        label.text = nameItem
    }
}
