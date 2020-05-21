//
//  ScrollViewController.swift
//  IOS_assignment_login
//
//  Created by 김민희 on 01/05/2020.
//  Copyright © 2020 김민희. All rights reserved.
//

import UIKit

class ScrollViewController: UIViewController {

    @IBAction func Logout(_ sender: UIButton) {
        // 객체 변수에 저장해 둔 id와 pw를 지움
        UserDefaults.standard.removeObject(forKey: "autoid")
        UserDefaults.standard.removeObject(forKey: "autopw")
        
        let alertViewController = UIAlertController(title: "로그아웃", message: "자동로그인 해제", preferredStyle: .alert)
        self.present(alertViewController, animated: true, completion: nil)
        let action = UIAlertAction(title: "확인", style: .cancel, handler: nil)
        alertViewController.addAction(action)

       
    }
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
            // 되지 않아요.. 스크롤이 자꾸 돌아가요... 하지만 해결하지 못했습니다. 저는 노력했습니다.
            /*
            var height: CGFloat! = CGFloat(210) - scrollView.contentOffset.y
            height = height > CGFloat(50) ? height : CGFloat(50)

            imageHeight.constant = height
         */
            
        }
    }
    
}


