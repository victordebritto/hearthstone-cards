//
//  DetailCardViewController.swift
//  HearthstoneCards
//
//  Created by Victor Britto e Barros on 25/10/22.
//

import UIKit

class DetailCardViewController: UIViewController {
    
    static func create(viewModel: DetailCardViewModel, card: Card) -> DetailCardViewController {
        let vm = DetailCardViewModel(card: card)
        let controller = DetailCardViewController()
        controller.viewModel = vm
        controller.card = card
        return controller
    }
    
    private var scrollView = {
        let sv = UIScrollView()
        sv.translatesAutoresizingMaskIntoConstraints = false
        return sv
    }()
    private var contentView = {
        let v = UIView()
         v.translatesAutoresizingMaskIntoConstraints = false
         v.backgroundColor = .white
         return v
    }()
    private var cardDetailStackView = {
        let sv =  UIStackView()
        sv.translatesAutoresizingMaskIntoConstraints = false
        sv.axis = .vertical
        sv.spacing = 3
        sv.distribution = .fillProportionally
        return sv
    }()
    private var imgStackView = {
        let sv =  UIStackView()
        sv.translatesAutoresizingMaskIntoConstraints = false
        sv.axis = .horizontal
        sv.distribution = .fill
        sv.alignment = .center
        return sv
    }()
        
    private var nameLabel = {
        let lb = UILabel()
        lb.translatesAutoresizingMaskIntoConstraints = false
        return lb
    }()
    private var typeLabel = {
        let lb = UILabel()
        lb.translatesAutoresizingMaskIntoConstraints = false
        return lb
    }()
    private var factionLabel = {
        let lb = UILabel()
        lb.translatesAutoresizingMaskIntoConstraints = false
        return lb
    }()
    private var rarityLabel = {
        let lb = UILabel()
        lb.translatesAutoresizingMaskIntoConstraints = false
        return lb
    }()
    private var costLabel = {
        let lb = UILabel()
        lb.translatesAutoresizingMaskIntoConstraints = false
        return lb
    }()
    private var attackLabel = {
        let lb = UILabel()
        lb.translatesAutoresizingMaskIntoConstraints = false
        return lb
    }()
    private var healthLabel = {
        let lb = UILabel()
        lb.translatesAutoresizingMaskIntoConstraints = false
        return lb
    }()
    private var flavorLabel = {
        let lb = UILabel()
        lb.translatesAutoresizingMaskIntoConstraints = false
        lb.numberOfLines = 3
        return lb
    }()
    private var artistLabel = {
        let lb = UILabel()
        lb.translatesAutoresizingMaskIntoConstraints = false
        return lb
    }()
    private let imgView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .center
        imageView.clipsToBounds = true
        return imageView
    }()
    
    var viewModel: DetailCardViewModel?
    var card: Card?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.displayActivityIndicator(shouldDisplay: true)
        defineLayout()
        view.displayActivityIndicator(shouldDisplay: false)
    }
    
    func defineLayout() {
        guard let card = card else { return }
        view.backgroundColor = .white
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        
        NSLayoutConstraint.activate([
           scrollView.topAnchor.constraint(equalTo: view.topAnchor),
           scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
           scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
           scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
         ])
        
        let heightContent = contentView.heightAnchor.constraint(equalTo: view.heightAnchor)
        heightContent.priority =  UILayoutPriority(250)
        
         NSLayoutConstraint.activate([
           contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
           contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
           contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
           contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
           contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
           contentView.centerYAnchor.constraint(equalTo: scrollView.centerYAnchor),
           contentView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
           heightContent
         ])
        
        if let imgString = card.imgGold {
            imgView.loadImage(withUrl: imgString)
        } else if let imgString = card.img {
            imgView.loadImage(withUrl: imgString)
        } else {
            imgView.image = UIImage(named: "img_available")
        }
        
        nameLabel.text = "Name: " + (card.name ?? "-")
        typeLabel.text =  "Type: " +  (card.type ?? "-")
        factionLabel.text = "Faction: " + (card.faction ?? "-")
        rarityLabel.text =  "Rarity: " + (card.rarity ?? "-")
        attackLabel.text = "Attack: " + (card.attack?.toString() ?? "-")
        healthLabel.text = "Health: " + (card.health?.toString() ?? "-")
        flavorLabel.text = "Flavor: " + (card.flavor ?? "-")
        artistLabel.text = "Artist: " + (card.artist ?? "-")
        
        contentView.addSubview(imgStackView)
        contentView.addSubview(cardDetailStackView)
       
        
        imgStackView.addArrangedSubview(imgView)
        cardDetailStackView.addArrangedSubview(nameLabel)
        cardDetailStackView.addArrangedSubview(typeLabel)
        cardDetailStackView.addArrangedSubview(factionLabel)
        cardDetailStackView.addArrangedSubview(rarityLabel)
        cardDetailStackView.addArrangedSubview(attackLabel)
        cardDetailStackView.addArrangedSubview(healthLabel)
        cardDetailStackView.addArrangedSubview(flavorLabel)
        cardDetailStackView.addArrangedSubview(artistLabel)
        
        NSLayoutConstraint.activate([
            imgStackView.topAnchor.constraint(equalTo: contentView.topAnchor),
            imgStackView.bottomAnchor.constraint(equalTo: cardDetailStackView.topAnchor),
            imgStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            imgStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            
            cardDetailStackView.topAnchor.constraint(equalTo: imgStackView.bottomAnchor, constant: 5),
            cardDetailStackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            cardDetailStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 5),
            cardDetailStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -5),
            imgStackView.heightAnchor.constraint(equalToConstant: 540),
        //    nameLabel.heightAnchor.constraint(equalToConstant: 40)
        ])

    }
    
}
