//
//  ScrollViewController.swift
//  IOS_assignment_login
//
//  Created by 김민희 on 01/05/2020.
//  Copyright © 2020 김민희. All rights reserved.
//

import UIKit

class ScrollViewController: UIViewController {

    override func viewDidLoad() {
        self.scroll.delegate = self
        self.scroll.contentInsetAdjustmentBehavior = .never
        super.viewDidLoad()
    }

    @IBOutlet weak var scroll: UIScrollView!
    @IBOutlet weak var image: UIImageView!

    @IBOutlet weak var imageHeight: NSLayoutConstraint!
    //let originHeaderImageHeight = imageHeight
}
   
extension ScrollViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let yPosition = scrollView.contentOffset.y
        if yPosition < 0 {

            let scale  = 1 + ((-yPosition) * 2 / image.frame.height)
            image.transform = CGAffineTransform(scaleX: scale, y: scale)
            var imageViewFrame = image.frame
            imageViewFrame.origin.y = yPosition
            image.frame = imageViewFrame
            
        } else {
         
            
        }
    }
    
}


