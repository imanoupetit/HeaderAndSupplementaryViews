//
//  ViewController.swift
//  HeaderAndSupplementaryViews
//
//  Created by Imanou on 28/01/2018.
//  Copyright © 2018 Imanou. All rights reserved.
//

import UIKit

class CollectionViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    let array = [["A", "B"], ["C", "D", "E"], ["F", "G", "H", "I", "J", "K"], ["L", "M", "N"]]
    
    let idealCellWidth: CGFloat = 100
    let margin: CGFloat = 5
    
    override func viewDidLoad() {
        collectionView?.backgroundColor = .groupTableViewBackground
        collectionView?.contentInsetAdjustmentBehavior = .always
        
        guard let flowLayout = collectionView?.collectionViewLayout as? UICollectionViewFlowLayout else { return }
        //flowLayout.headerReferenceSize = CGSize(width: 0, height: 100)
        flowLayout.minimumInteritemSpacing = margin
        flowLayout.minimumLineSpacing = margin
        flowLayout.sectionInset = UIEdgeInsets(top: margin, left: margin, bottom: margin, right: margin)
        flowLayout.sectionHeadersPinToVisibleBounds = true
        
        collectionView?.register(HeaderReusableView.self, forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: "HeaderView")
        collectionView?.register(CyanCollectionViewCell.self, forCellWithReuseIdentifier: "Cell")
    }
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return array.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return array[section].count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! CyanCollectionViewCell
        cell.label.text = array[indexPath.section][indexPath.row]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        guard let flowLayout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout else { return .zero }
        let availableWidth = collectionView.frame.width - collectionView.safeAreaInsets.left - collectionView.safeAreaInsets.right - flowLayout.sectionInset.left - flowLayout.sectionInset.right
        let idealNumberOfCells = (availableWidth + flowLayout.minimumInteritemSpacing) / (idealCellWidth + flowLayout.minimumInteritemSpacing)
        let numberOfCells = idealNumberOfCells.rounded(.down)
        let cellWidth = (availableWidth + flowLayout.minimumInteritemSpacing) / numberOfCells - flowLayout.minimumInteritemSpacing
        return CGSize(width: cellWidth, height: cellWidth)
    }
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionElementKindSectionHeader, withReuseIdentifier: "HeaderView", for: indexPath) as! HeaderReusableView
        guard let text = array[indexPath.section].first else { return headerView }
        headerView.label.text = text
        return headerView
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: 0, height: 40)
    }
    
    // For some reason, this method is never called
    override func indexTitles(for collectionView: UICollectionView) -> [String]? {
        return array.flatMap({ (subArray) -> String? in
            return subArray.first
        })
    }
    
    // For some reason, this method is never called
    override func collectionView(_ collectionView: UICollectionView, indexPathForIndexTitle title: String, at index: Int) -> IndexPath {
        guard let indexRow = array[index].index(of: title) else { return IndexPath() }
        return IndexPath(item: indexRow, section: index)
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        collectionView?.collectionViewLayout.invalidateLayout()
        super.viewWillTransition(to: size, with: coordinator)
    }
    
}
