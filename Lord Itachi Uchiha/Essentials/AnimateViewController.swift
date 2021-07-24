//
//  AnimateViewController.swift
//  Lord Itachi Uchiha
//
//  Created by Chiranjeev Mishra on 24/07/21.
//

import UIKit

class AnimateViewController: UIViewController {

    private let imageView: UIImageView = {
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 400, height: 400))
        imageView.image = UIImage(named:"company logo")
        return imageView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = true
        view.addSubview(imageView)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        imageView.center = view.center
        
        DispatchQueue.main.asyncAfter(deadline: .now()+0.5, execute: {
            self.animate()
        })
        animate()
    }
    
    private func animate(){
        UIView.animate(withDuration: 1.5, animations: {
            
            let size = self.view.frame.size.width * 3
            let diffX = size - self.view.frame.size.width
            let diffY = self.view.frame.size.height - size
            
            self.imageView.frame = CGRect(x: -(diffX/2), y: diffY/2, width: size, height: size)
            
            self.imageView.alpha = 0
        }, completion: { done in
            if done {
                let viewController = ViewController()
                viewController.modalTransitionStyle = .crossDissolve
                self.present(viewController, animated: true)
            }
        })
    }

}
