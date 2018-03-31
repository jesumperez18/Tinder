//
//  CardsViewController.swift
//  Tinder
//
//  Created by Jesus perez on 3/26/18.
//  Copyright © 2018 Jesus perez. All rights reserved.
//

import UIKit

class CardsViewController: UIViewController {
    
    var cardInitialCenter: CGPoint!
    
    var hasFaded: Bool!


    @IBOutlet weak var tImageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        tImageView.image = #imageLiteral(resourceName: "ryan")
        
         self.tImageView.alpha = 1
        hasFaded = false
       
    }
    @IBAction func onPanImage(_ sender: UIPanGestureRecognizer) {
        //print("Hello world")
        
        let location = sender.location(in: view)
        let velocity = sender.velocity(in: view)
        let translation = sender.translation(in: view)
        
        if sender.state == .began {
           // print("Gesture began")
            cardInitialCenter = tImageView.center
        } else if sender.state == .changed {
            //print("Gesture is changing")
            print(translation.x)
            tImageView.center = CGPoint(x: cardInitialCenter.x + translation.x, y: cardInitialCenter.y)
            
            if(location.y > cardInitialCenter.y) {
               // print("lower pan")
                
                // tImageView.transform = tImageView.transform.rotated(by: CGFloat(0.05 * M_PI / 180))
                if(velocity.x > 0)
                {
                    //print("right")
                    tImageView.transform = tImageView.transform.rotated(by: CGFloat(-0.2 * .pi / 180))
                     //checkX(translation)
                    
                    
                }
                else
                {
                    //print("left")
                    tImageView.transform = tImageView.transform.rotated(by: CGFloat(0.2 * .pi / 180))
                     //checkX(translation)
                }
            }
            else {
                //print("upper pan")
                
                // tImageView.transform = tImageView.transform.rotated(by: CGFloat(0.05 * M_PI / 180))
                if(velocity.x > 0)
                {
                   // print("right")
                    tImageView.transform = tImageView.transform.rotated(by: CGFloat(0.2 * .pi / 180))
                   // checkX(translation)
                }
                else
                {
                    //print("left")
                    tImageView.transform = tImageView.transform.rotated(by: CGFloat(-0.2 * .pi / 180))
                     //checkX(translation)
                }
            }
            if(checkX(translation)) {
                UIView.animate(withDuration:0.4, animations: {
                    // This causes first view to fade in and second view to fade out
                    self.tImageView.alpha = 0
                    self.hasFaded = true
                    //self.secondView.alpha = 0
                })
                
            }
           
 
        } else if sender.state == .ended {
            //print("Gesture ended")
            tImageView.transform = CGAffineTransform.identity//tImageView.transform.inverted()//tImageView.transform.rotated(by: CGFloat(0.2 * M_PI / 180))
            if (!hasFaded) {
                tImageView.center = cardInitialCenter
            } else {
                hasFaded = false
            }

        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func checkX(_ translation: CGPoint ) -> Bool
    {
       // print(translation.x)
        
        if(translation.x > 100)
        {
            print("right animation")
            return true
            
            
            
        }
        else if(translation.x < -100)
        {
            print("left animation")
             print(translation.x)
            return true
            
        }
        return false
        
    }
    func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {

        if segue.identifier == "toBrowsePage" {
            let dvc = segue.destination as! ProfileViewController
           dvc.profileViewImage.image = tImageView.image

        }
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
