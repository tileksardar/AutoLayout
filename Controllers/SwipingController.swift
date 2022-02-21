//
//  SwipingController.swift
//  AutoLayoutProj
//
//  Created by Tilek on 6/2/22.
//
import UIKit
class SwipingController: UICollectionViewController, UICollectionViewDelegateFlowLayout{
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        collectionViewLayout.invalidateLayout()
        coordinator.animate { (_) in
            self.collectionViewLayout.invalidateLayout()
            let indexPath = IndexPath(item: self.pageControl.currentPage, section: 0)
            self.collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)

        } completion: { (_) in
            
        }

    }
    
   let pages = [
   Page(imageName: "kyyrt", headerText: "Join use today in our fun and games!",bodyText: "Are you ready for loads of loads fun? Don't wait any longer! We hope to see you in our stores soon"),
    Page(imageName: "insPics", headerText: "Subscribe and get coupons on our daily events", bodyText: "Get notify of the savings immediately when we announce them on our website. Make sure to also give us any feedbak you have. "),
    Page(imageName: "diamond2", headerText: "JVIP members special services", bodyText: "")

   ]
    
    
    
   private let previousButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("PREV", for: .normal)
    button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
    button.setTitleColor(.gray, for: .normal)
    button.addTarget(self, action: #selector (handlePrev), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
        
    }()
    
    @objc private func handlePrev(){
        
        let nextIndex = min(pageControl.currentPage  - 1, pages.count + 1)
        let indexPath = IndexPath(item: nextIndex, section: 0)
        pageControl.currentPage = nextIndex
        collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
    }
    
    let nextButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("NEXT", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
       
        button.setTitleColor(.mainPink, for: .normal)

        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(handleNext), for: .touchUpInside)
        return button
        
    }()
    @objc private func handleNext(){
        
        let nextIndex = min(pageControl.currentPage  + 1, pages.count - 1)
        let indexPath = IndexPath(item: nextIndex, section: 0)
        pageControl.currentPage = nextIndex
        collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
    }
    

    private lazy var pageControl: UIPageControl = {
    let pc = UIPageControl()
        pc.currentPage = 0
        pc.numberOfPages = pages.count
        pc.currentPageIndicatorTintColor = .mainPink
        pc.pageIndicatorTintColor = UIColor(red: 249/255, green: 207/255, blue: 224/255, alpha: 1)

        
        return pc
    }()
    
    
    
    
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
     
    
//    override func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
//        let x = targetContentOffset.pointee.x
//         pageControl.currentPage = Int(x / view.frame.width)
//
//    }
    
    
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupBottomControls()
        collectionView.backgroundColor = .white
        collectionView.register(PageCell.self, forCellWithReuseIdentifier: "cellId")
        collectionView.isPagingEnabled = true
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return pages.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellId", for: indexPath) as! PageCell
        
        
        let page = pages[indexPath.item]
       cell.page = page
        

        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: view.frame.height)
    }
}
    



