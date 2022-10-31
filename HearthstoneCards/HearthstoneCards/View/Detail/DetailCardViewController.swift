//
//  DetailCardViewController.swift
//  HearthstoneCards
//
//  Created by Victor Britto e Barros on 25/10/22.
//

import UIKit

class DetailCardViewController: UIViewController {
    
    private var cardDetailStackView: UIStackView!
    private var imgStackView: UIStackView!
        
    private var nameLabel: UILabel = UILabel()
    private var typeLabel: UILabel = UILabel()
    private var factionLabel: UILabel = UILabel()
    private var rarityLabel: UILabel = UILabel()
    private var costLabel: UILabel = UILabel()
    private var attackLabel: UILabel = UILabel()
    private var healthLabel: UILabel = UILabel()
    private var textLabel: UILabel = UILabel()
    private var flavorLabel: UILabel = UILabel()
    private var artistLabel: UILabel = UILabel()
    private var img: UIImageView!
    private var imgGold: UIImageView!
    
    
    func defineLayout() {
        
        cardDetailStackView = {
            let sv =  UIStackView()
            sv.axis = .vertical
            
            return sv
        }()
        
        imgStackView = {
            let sv = UIStackView()
            sv.axis = .horizontal
            sv.distribution = .equalCentering
            return sv
        }()
        
        
        img = {
            let img = UIImageView()
            return img
        }()
        
        imgGold = {
            let img = UIImageView()
            return img
        }()
        
        view.addSubview(cardDetailStackView)
        // TODO: verificar existencia das imagens no obj
        cardDetailStackView.addArrangedSubview(imgStackView)
        imgStackView.addArrangedSubview(img)
        imgStackView.addArrangedSubview(imgGold)
        
        cardDetailStackView.addArrangedSubview(nameLabel)
        cardDetailStackView.addArrangedSubview(typeLabel)
        cardDetailStackView.addArrangedSubview(factionLabel)
        cardDetailStackView.addArrangedSubview(rarityLabel)
        cardDetailStackView.addArrangedSubview(attackLabel)
        cardDetailStackView.addArrangedSubview(healthLabel)
        cardDetailStackView.addArrangedSubview(textLabel)
        cardDetailStackView.addArrangedSubview(flavorLabel)
        
        cardDetailStackView.addArrangedSubview(artistLabel)
        
        
        
        NSLayoutConstraint.activate([
            cardDetailStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            cardDetailStackView.trailingAnchor.constraint(equalTo: view.leadingAnchor),
            cardDetailStackView.topAnchor.constraint(equalTo: view.topAnchor),
            cardDetailStackView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
        
    }
    
    
    
    
}
