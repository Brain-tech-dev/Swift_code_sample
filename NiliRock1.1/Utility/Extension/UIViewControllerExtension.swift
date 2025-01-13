//
//  UIViewControllerExtension.swift
//  NiliRock1.1
//
//  Created by Sazid Saifi on 30/01/24.
//

import Foundation
import UIKit


extension UIViewController {
    //MARK: -> showToast
    func showToast(message : String, errorType: ToastType ) {
        let toastLabel = UILabel(frame: CGRect(x: self.view.frame.size.width/2 - 120, y: 100, width: 250, height: 50))
        if errorType == .error {
            toastLabel.backgroundColor = UIColor.redColor
        } else {
            toastLabel.backgroundColor = UIColor.greenTostColor
        }
        toastLabel.textColor = UIColor.white
        toastLabel.font = .systemFont(ofSize: 15.0)
        toastLabel.textAlignment = .center;
        toastLabel.text = message
        toastLabel.alpha = 1.0
        toastLabel.numberOfLines = 0
        toastLabel.layer.cornerRadius = 10;
        toastLabel.clipsToBounds  =  true
        self.view.addSubview(toastLabel)
        UIView.animate(withDuration: 4.0, delay: 0.1, options: .curveEaseOut, animations: {
             toastLabel.alpha = 0.0
        }, completion: {(isCompleted) in
            toastLabel.removeFromSuperview()
        })
    }
}

