//
//  PhotosCollectionViewController.swift
//  Photos
//
//  Created by Gene Yoo on 11/3/15.
//  Copyright © 2015 iOS DeCal. All rights reserved.
//

import UIKit

class PhotosCollectionViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout, UIViewControllerTransitioningDelegate {
    private let sectionInsets = UIEdgeInsets(top: 50.0, left: 20.0, bottom: 50.0, right: 20.0)
    private let reuseIdentifier = "InstagramPhoto"
    var photos: [Photo]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let api = InstagramAPI()
        api.loadPhotos(didLoadPhotos)
        // FILL ME IN
        
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if let id = segue.identifier {
            if id == "showPhoto" {
                let taskDetailViewController = segue.destinationViewController as! PhotoViewController
                if let selectedPhoto = sender as? PhotoCollectionViewCell {
                    let indexPath = collectionView?.indexPathForCell(selectedPhoto)!
                    let photo = photoForIndexPath(indexPath!)
                    taskDetailViewController.view.backgroundColor = UIColor.whiteColor()
                    loadViewForPreview(photo!, imageView: taskDetailViewController.imageView, poster: taskDetailViewController.posterLabel, datePosted: taskDetailViewController.datePosted, numberOfLikes: taskDetailViewController.numberOfLikes)
                    taskDetailViewController.imageView.sizeToFit()
                }
            }
        }
    }
    
    func photoForIndexPath(indexPath: NSIndexPath) -> Photo? {
        if let tempPhoto: Photo? = photos[indexPath.row] {
            return tempPhoto
        }
        return nil
    }

    /* 
     * IMPLEMENT ANY COLLECTION VIEW DELEGATE METHODS YOU FIND NECESSARY
     * Examples include cellForItemAtIndexPath, numberOfSections, etc.
     */
    
    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if photos == nil {
            return 0
        }
        return photos.count
    }
    
    
    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(reuseIdentifier, forIndexPath: indexPath) as! PhotoCollectionViewCell
        if let photo = photoForIndexPath(indexPath) {
            loadImageForCell(photo, imageView: cell.imageContained)
        }
        return cell
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        let photo = photoForIndexPath(indexPath)
        if var size = photo?.size {
            size.height /= 10
            size.width /= 10
            size.height += 10
            size.width += 10
            return size
        }
        return CGSize(width: 100, height: 100)
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAtIndex section: Int) -> UIEdgeInsets {
        return sectionInsets
    }
    
    override func collectionView(collectionView: UICollectionView, didDeselectItemAtIndexPath indexPath: NSIndexPath) {
        print("You selected cell #\(indexPath.row)!")
    }
    
    /* Creates a session from a photo's url to download data to instantiate a UIImage. 
       It then sets this as the imageView's image. */
    func loadImageForCell(photo: Photo, imageView: UIImageView) {
        let url = NSURL(string: photo.url)!
        let data = NSData(contentsOfURL: url)
        imageView.image = UIImage(data: data!)
    }
    
    func loadViewForPreview(photo: Photo, imageView: UIImageView, poster: UILabel, datePosted: UILabel, numberOfLikes: UILabel) {
        let url = NSURL(string: photo.url)!
        let data = NSData(contentsOfURL: url)
        imageView.image = UIImage(data: data!)
        poster.text = photo.username
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "dd-MM-yyyy"
        datePosted.text = dateFormatter.stringFromDate(photo.date)
        numberOfLikes.text = String(photo.likes)
    }
    
    /* Completion handler for API call. DO NOT CHANGE */
    func didLoadPhotos(photos: [Photo]) {
        self.photos = photos
        self.collectionView!.reloadData()
    }
}
