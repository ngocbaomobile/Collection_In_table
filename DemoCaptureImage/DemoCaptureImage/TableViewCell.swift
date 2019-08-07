//
//  TableViewCell.swift
//  DemoCaptureImage
//
//  Created by Ngoc on 8/6/19.
//  Copyright © 2019 Ngoc. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell , UICollectionViewDataSource, UICollectionViewDelegate {

    @IBOutlet weak var myCollectionView: UICollectionView!
    
    @IBOutlet weak var flowLayout: UICollectionViewFlowLayout!
    
    var arrImage = [UIImage]()
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        myCollectionView.delegate = self
        myCollectionView.dataSource = self
        
        flowLayout.minimumInteritemSpacing = 1
        flowLayout.minimumLineSpacing = 1
        flowLayout.itemSize = CGSize(width: self.myCollectionView.bounds.height, height: self.myCollectionView.bounds.height)
        NotificationCenter.default.addObserver(self, selector: #selector(getdata(notification:)), name: NSNotification.Name(rawValue: "123"), object: nil)
        // Initialization code
    }
    
    
    @objc func getdata(notification: Notification) {
        let image = notification.object as! UIImage
        arrImage.insert(image, at: 0)
        myCollectionView.reloadData()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }

    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrImage.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "collectionviewCell", for: indexPath) as! CollectionViewCell
        cell.imageView.image = arrImage[indexPath.row]
        return cell
    }
    
    
}
