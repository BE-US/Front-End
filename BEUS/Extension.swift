//
//  Extension.swift
//  BEUS
//
//  Created by 티모시 킴 on 2023/09/25.
//

import UIKit

extension UITextField {
    
    func addLeftPadding() {
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: self.frame.height))
        self.leftView = paddingView
        self.leftViewMode = ViewMode.always
    }
    
    func addLeftImage(image : UIImage){
        let imageView = UIImageView(frame: CGRect(x: 10, y: 0, width: image.size.width, height: image.size.height))
        let view = UIView(frame: CGRect(x: 0, y: 0, width: image.size.width + 20, height: image.size.height))
        imageView.image = image
        view.addSubview(imageView)
        self.leftView = view
        self.leftViewMode = .always
    }
    
}

extension UIViewController {
    
    func handleEditFunc(){
        let tap : UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(handleTap))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func handleTap() {
        self.view.endEditing(true)
    }
    
}
