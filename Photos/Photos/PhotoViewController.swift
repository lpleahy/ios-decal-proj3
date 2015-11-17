//
//  PhotoViewController.swift
//  Photos
//
//  Created by Liam Leahy on 11/16/15.
//  Copyright © 2015 iOS DeCal. All rights reserved.
//

import UIKit

class PhotoViewController: UIViewController {
    var color: Int = 0
    @IBAction func like(sender: UIButton) {
        if color == 0 {
            likeButton.backgroundColor = UIColor.redColor()
            color = (color + 1) % 2
        }
        else {
            likeButton.backgroundColor = UIColor.whiteColor()
            color = (color + 1) % 2
        }
    }
    @IBOutlet weak var likeButton: UIButton!
    @IBOutlet weak var posterLabel: UILabel!
    @IBOutlet weak var numberOfLikes: UILabel!
    @IBOutlet weak var datePosted: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBAction func cancel(sender: AnyObject) {
        navigationController?.popViewControllerAnimated(true)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
