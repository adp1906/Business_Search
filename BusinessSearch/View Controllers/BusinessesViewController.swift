//
//  BusinessesViewController.swift
//  BusinessSearch
//
//  Created by Aaron Peterson on 8/17/20.
//  Copyright © 2020 Aaron Peterson. All rights reserved.
//

import UIKit

class BusinessesViewController: UIViewController {
    
    let listChildVC = BusinessCollectionViewController()
    let mapChildVC = MapChildVC()
    let segmentControl: UISegmentedControl = {
        let items = ["List", "Map"]
        let sc = UISegmentedControl(items: items)
        sc.addTarget(self, action: #selector(segmentedButtonChange(_:)), for: .valueChanged)
        return sc
    }()
    
    let searchTextField: UITextField = {
        let searchField = UITextField()
        searchField.text = "Search"
        searchField.layer.borderColor = UIColor.black.cgColor
        searchField.backgroundColor = .white
        return searchField
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        configureSearchTextField()
        configureSegmentedButton()
        configureListView()
        segmentControl.selectedSegmentIndex = 0
        
    }
    
    func configureSearchTextField() {
        view.addSubview(searchTextField)
        searchTextField.translatesAutoresizingMaskIntoConstraints = false
        searchTextField.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20).isActive = true
        searchTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        searchTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
    }
    
    func configureSegmentedButton() {
        view.addSubview(segmentControl)
        segmentControl.translatesAutoresizingMaskIntoConstraints = false
        segmentControl.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        segmentControl.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -100).isActive = true
    }
    
    @objc func segmentedButtonChange(_ segmentedControl: UISegmentedControl) {
        if segmentedControl.selectedSegmentIndex == 0 {
            configureListView()
        } else {
            configureMapView()
        }
        
    }
    
    func configureListView() {
        addChild(listChildVC)
        view.addSubview(listChildVC.view)
        listChildVC.didMove(toParent: self)
        
        listChildVC.view.translatesAutoresizingMaskIntoConstraints = false
        listChildVC.view.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        listChildVC.view.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        listChildVC.view.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        listChildVC.view.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        self.segmentControl.superview?.bringSubviewToFront(self.segmentControl)
        self.searchTextField.superview?.bringSubviewToFront(self.searchTextField)
    }
    
    func configureMapView() {
        addChild(mapChildVC)
        view.addSubview(mapChildVC.view)
        mapChildVC.didMove(toParent: self)
        
        mapChildVC.view.translatesAutoresizingMaskIntoConstraints = false
        mapChildVC.view.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        mapChildVC.view.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        mapChildVC.view.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        mapChildVC.view.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        self.segmentControl.superview?.bringSubviewToFront(self.segmentControl)
        self.searchTextField.superview?.bringSubviewToFront(self.searchTextField)
    }
    
}
