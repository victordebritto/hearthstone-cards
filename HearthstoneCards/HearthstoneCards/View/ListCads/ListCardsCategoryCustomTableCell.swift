//
//  ListCardsCategoryCustomTableCell.swift
//  HearthstoneCards
//
//  Created by Victor Britto e Barros on 01/11/22.
//

import UIKit

class ListCardsCategoryCustomTableCell: UITableViewCell {
    
    static let identifier = "ListCardsCategoryCustomTableCell"
    
    let label = UILabel()
    
    override func prepareForReuse() {
        super.prepareForReuse()
        self.label.text = ""
    }
    
    func setCardName(name: String) {
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = name
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        defineLayout()
    }
    
    private func defineLayout() {
        contentView.addSubview(label)
        
        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            label.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
        ])
        contentView.backgroundColor = .white
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
