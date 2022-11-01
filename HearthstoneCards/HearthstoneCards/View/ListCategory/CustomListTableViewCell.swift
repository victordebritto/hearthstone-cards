//
//  CustomListTableViewCell.swift
//  HearthstoneCards
//
//  Created by Victor Britto e Barros on 28/10/22.
//

import Foundation
import UIKit

class CustomListTableViewCell: UITableViewCell {
    
    static let identifier = "CustomListTableViewCell"
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        defineLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private var stackView: UIStackView!
    private var typeLabel: UILabel!
    private var sepator: UIView!
    private var collectionView: UICollectionView!
    
    private var type: CategoryTypes?
    private var nameItems: [String]?
    
    var viewModel: ListCardsViewModel?
    
    private func defineLayout() {
        stackView = {
            let sv = UIStackView()
            sv.translatesAutoresizingMaskIntoConstraints = false
            sv.distribution = .fill
            sv.alignment = .fill
            sv.axis = .vertical
            sv.spacing = 3
            return sv
        }()
        
        typeLabel = {
           let l = UILabel()
            l.text = ""
            l.textColor = .black
            return l
        }()
        
        sepator = {
            let v = UIView()
            v.translatesAutoresizingMaskIntoConstraints = false
            v.backgroundColor = .black
            return v
        }()
        
        let layout = {
            let l = UICollectionViewFlowLayout()
            l.scrollDirection = .horizontal
            l.itemSize = CGSize(width: 160, height: 130)
            return l
        }()
        
        collectionView = {
            let cv = UICollectionView(frame: self.stackView.frame, collectionViewLayout: layout)
            cv.translatesAutoresizingMaskIntoConstraints = false
            cv.showsHorizontalScrollIndicator = false
            cv.delegate = self
            cv.dataSource = self
            cv.register(CustomListCollectionViewCell.self,
                        forCellWithReuseIdentifier: CustomListCollectionViewCell.identifier)
            return cv
        }()
        contentView.backgroundColor = .none
        contentView.addSubview(stackView)
        stackView.addArrangedSubview(typeLabel)
        stackView.addArrangedSubview(sepator)
        stackView.addArrangedSubview(collectionView)
        
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 3),
            stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -3),
            stackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            stackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 10),
            sepator.heightAnchor.constraint(equalToConstant: 1),
            typeLabel.heightAnchor.constraint(equalToConstant: 20)
        ])
    }
    
    
    func setData(typeSelect: CategoryTypes, nameItems: [String]) {
        self.type = typeSelect
        self.typeLabel.text = typeSelect.rawValue
        self.nameItems = nameItems
    }
}

extension CustomListTableViewCell: UICollectionViewDelegate {
    
}

extension CustomListTableViewCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.nameItems?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CustomListCollectionViewCell.identifier,
                                                      for: indexPath) as! CustomListCollectionViewCell
        if let type = type, let nameItems = nameItems {
            cell.setData(type: type, nameItem: nameItems[indexPath.row])
        }
        cell.layer.cornerRadius = 20
       
        cell.backgroundColor = .gray
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let type = type, let nameItems = nameItems else { return  }
        viewModel?.openCategory(category: type, item: nameItems[indexPath.row])
    }
}
