//
//  TeamCollectionViewCell.swift
//  MaTeam
//
//  Created by Derouiche Elyes on 05/01/2023.
//

import UIKit

class TeamCollectionViewCell: UICollectionViewCell {
    
    // MARK: - Properties
    
    static let reuseIdentifier = "TeamCollectionViewCell"
    
    let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    // MARK: - Initialization
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
        setupConstraint()
    }
    
    fileprivate func setupViews() {
        contentView.addSubview(imageView)
    }
    
    fileprivate func setupConstraint() {
        imageView.fillSuperview()
    }
    
    public func setup(model: Team) {
        imageView.image = .init(systemName: "pin")
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
