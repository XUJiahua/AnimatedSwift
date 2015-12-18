//
//  ASReboundViewController.swift
//  AnimatedSwift
//
//  Created by XuJiahua on 15/12/18.
//  Copyright © 2015年 hellojohn. All rights reserved.
//

import UIKit

class ASReboundViewController: UIViewController {
    var viewTopSpaceLayoutConstant: CGFloat!
    var viewOriginY:CGFloat!
    
    @IBOutlet weak var viewTopSpaceLayout: NSLayoutConstraint!
    @IBOutlet var panGesture: UIPanGestureRecognizer!
    @IBOutlet weak var reboundView: UIView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        panGesture.addTarget(self, action: Selector("pan"))
        //记录初始状态，用于之后的恢复
        viewTopSpaceLayoutConstant = viewTopSpaceLayout.constant
        viewOriginY = reboundView.frame.origin.y
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //pan手势在reboundview内，只有reboundview内可拖动
    func pan(){
        //拖动手势放松的时候，恢复原状
        if panGesture.state == UIGestureRecognizerState.Ended{
            UIView.animateWithDuration(0.4, delay: 0, options: UIViewAnimationOptions.CurveEaseInOut, animations: { () -> Void in
                self.reboundView.frame.origin.y = self.viewOriginY
            
                }, completion: { (success) -> Void in
                    if success {
                        self.viewTopSpaceLayout.constant = self.viewTopSpaceLayoutConstant
                    }
            })
            return
        }
        
        //拖动状态下，在view的坐标系下计算y
        let y = panGesture.translationInView(self.view).y
        print(y)
        //更新autolayout，自动刷新显示
        viewTopSpaceLayout.constant = viewTopSpaceLayoutConstant + y
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
