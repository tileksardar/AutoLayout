//
//  ViewController.swift
//  AutoLayoutProj
//
//  Created by Tilek on 23/1/22.
//

import UIKit

extension UIColor {
    static var mainPink = UIColor(red: 232/255, green: 68/255, blue: 133/255, alpha: 1)
        
    }


class ViewController: UIViewController {
    
    let sceneImageView: UIImageView = {
        let imageName = "kyyrt.jpeg"
        let image = UIImage(named: imageName)
        let imageView = UIImageView(image: image!)
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
        
    }()
    
    let descriptionTextView: UITextView = {
        
        
        let attributedText = NSMutableAttributedString(string: "Join us today in our fun and games!", attributes: [NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 18)])
        attributedText.append(NSAttributedString(string: "\n\nAre you ready for lots of lots fun Don't wait any longoer! We hope to see you in our stores soon.", attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 13), NSAttributedString.Key.foregroundColor: UIColor.gray]))
        
            let textView = UITextView()
        textView.attributedText = attributedText
        textView.translatesAutoresizingMaskIntoConstraints = false
     
        textView.textAlignment = .center
        textView.isEditable = false
        textView.isScrollEnabled = false
        return textView
        
    }()
    
    
    
   private let previousButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("PREV", for: .normal)
    button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
    button.setTitleColor(.gray, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
        
    }()
    
    let nextButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("NEXT", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
       
        button.setTitleColor(.mainPink, for: .normal)

        button.translatesAutoresizingMaskIntoConstraints = false
        return button
        
    }()
    

    private let pageControl: UIPageControl = {
    let pc = UIPageControl()
        pc.currentPage = 0
        pc.numberOfPages = 4
        pc.currentPageIndicatorTintColor = .mainPink
        pc.pageIndicatorTintColor = UIColor(red: 249/255, green: 207/255, blue: 224/255, alpha: 1)

        
        return pc
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(sceneImageView)
        view.addSubview(descriptionTextView)
        setupBottomControls()

        setupLayout()
        
        
        
    }
    
    
   fileprivate func setupBottomControls(){
    view.addSubview(previousButton)
    view.addSubview(nextButton)

    
    
    
    

    let bottomControllsStackView = UIStackView(arrangedSubviews: [previousButton, pageControl, nextButton])
    bottomControllsStackView.translatesAutoresizingMaskIntoConstraints = false
    bottomControllsStackView.distribution = .fillEqually
    view.addSubview(bottomControllsStackView)
    
    
    
    NSLayoutConstraint.activate([

        
        bottomControllsStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
        
        
        bottomControllsStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
        bottomControllsStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
        bottomControllsStackView.heightAnchor.constraint(equalToConstant: 50)
        ])
   
   }
    
    
       private func setupLayout(){
        //Image
        
        
        
        
        
        
       sceneImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
       sceneImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 60).isActive = true
       sceneImageView.widthAnchor.constraint(equalToConstant: 200).isActive = true
       sceneImageView.heightAnchor.constraint(equalToConstant: 200).isActive = true
       
        
        //Text
        descriptionTextView.topAnchor.constraint(equalTo: sceneImageView.bottomAnchor, constant: 10).isActive = true
        
        descriptionTextView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 24).isActive = true
        
        descriptionTextView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -24).isActive = true
        
        descriptionTextView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 10).isActive = true

        

        
        
    }
}


