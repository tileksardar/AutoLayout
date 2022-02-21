//
//  PageCell.swift
//  AutoLayoutProj
//
//  Created by Tilek on 9/2/22.
//

import UIKit

class PageCell: UICollectionViewCell {
    
    
    var page: Page? {
        didSet{
            
            guard let unwrappedPage = page else {
                return
            }
            sceneImageView.image = UIImage(named: unwrappedPage.imageName)
            
            
            let attributedText = NSMutableAttributedString(string: unwrappedPage.headerText, attributes: [NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 18)])
            attributedText.append(NSAttributedString(string:"\n\n\n\(unwrappedPage.bodyText)", attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 13), NSAttributedString.Key.foregroundColor: UIColor.gray]))
            descriptionTextView.attributedText = attributedText
            descriptionTextView.textAlignment = .center
        }
    }
    
    private let sceneImageView: UIImageView = {
        let imageName = "kyyrt.jpeg"
        let image = UIImage(named: imageName)
        let imageView = UIImageView(image: image!)
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
        
    }()
    
    
    
  private let descriptionTextView: UITextView = {
        
        
        let attributedText = NSMutableAttributedString(string: "Join us today in our fun and games!", attributes: [NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 18)])
        attributedText.append(NSAttributedString(string: "\n\nAre you ready for lots of lots fun Don't wait any longoer! We hope to see you in our stores soon.", attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 13), NSAttributedString.Key.foregroundColor: UIColor.gray]))
        
            let textView = UITextView()
        textView.attributedText = attributedText
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.textColor = .black
        textView.textAlignment = .center
        textView.isEditable = false
        textView.isScrollEnabled = false
        return textView
        
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLayout()
        
    }
    
    
    private func setupLayout(){
     //Image
        let topImageContainerView = UIView()
        addSubview(topImageContainerView)
        topImageContainerView.translatesAutoresizingMaskIntoConstraints = false
        topImageContainerView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        topImageContainerView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        topImageContainerView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        
        topImageContainerView.addSubview(sceneImageView)
        
        
    sceneImageView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
    sceneImageView.topAnchor.constraint(equalTo: topAnchor, constant: 60).isActive = true
    sceneImageView.widthAnchor.constraint(equalToConstant: 200).isActive = true
        sceneImageView.heightAnchor.constraint(equalTo: topImageContainerView.heightAnchor, multiplier: 0.5).isActive = true
        
        topImageContainerView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.5).isActive = true
    
     
     //Text
        addSubview(descriptionTextView)
     descriptionTextView.topAnchor.constraint(equalTo: topImageContainerView.bottomAnchor, constant: 10).isActive = true
     
     descriptionTextView.leftAnchor.constraint(equalTo: leftAnchor, constant: 24).isActive = true
     
     descriptionTextView.rightAnchor.constraint(equalTo: rightAnchor, constant: -24).isActive = true
     
     descriptionTextView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 10).isActive = true

 }
    
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
