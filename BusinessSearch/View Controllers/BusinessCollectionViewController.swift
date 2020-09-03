//
//  ViewController.swift
//  BusinessSearch
//
//  Created by Aaron Peterson on 7/6/20.
//  Copyright © 2020 Aaron Peterson. All rights reserved.
//

import UIKit

private let reuseIdentifier = "BusinessCell"

class BusinessCollectionViewController: UIViewController {
    
    private var collectionView: UICollectionView?
    let businessController = BusinessController()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .orange
        
        configureCollectionView()
        //configureSegmentedControl()
    }
    
    // MARK: - Private
    
    private func configureCollectionView() {
        let collectionViewFlowLayout = UICollectionViewFlowLayout()

        collectionViewFlowLayout.itemSize = CGSize(width: self.view.bounds.size.width, height: self.view.bounds.size.width/3)
        collectionViewFlowLayout.sectionInset = UIEdgeInsets.zero
        collectionViewFlowLayout.scrollDirection = .vertical
        collectionViewFlowLayout.minimumLineSpacing = 1
        collectionViewFlowLayout.minimumInteritemSpacing = 1

        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: collectionViewFlowLayout)
        collectionView.backgroundColor = .red

        view.addSubview(collectionView)

        collectionView.register(BusinessCollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)

        collectionView.dataSource = self
        collectionView.delegate = self

        self.collectionView = collectionView
        
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
    }

}

// MARK: - UICollectionView Data Source & Delegate
extension BusinessCollectionViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return businessController.businesses.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as? BusinessCollectionViewCell else { return UICollectionViewCell() }
        
        cell.backgroundColor = .yellow
        cell.profileImage.image = UIImage(named: businessController.businesses[indexPath.item].profileImageName)
        cell.nameLabel.text = businessController.businesses[indexPath.item].name
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let businessProfileVC = BusinessProfileViewController()
        businessProfileVC.business = businessController.businesses[indexPath.item]
        
        //businessProfileVC.modalPresentationStyle = .fullScreen
        //navigationController?.pushViewController(businessProfileVC, animated: true)
        self.present(businessProfileVC, animated: true)
        
    }
}
