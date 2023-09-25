//
//  Extension.swift
//  BEUS
//
//  Created by 티모시 킴 on 2023/09/25.
//

import UIKit

extension UIButton {
    
    func setUnderLine(){
        guard let title = title(for: .normal) else { return }
        let attributedString = NSMutableAttributedString(string: title)
        attributedString.addAttribute(.underlineStyle, value: NSUnderlineStyle.single.rawValue, range: NSRange(location: 0, length: title.count))
        setAttributedTitle(attributedString, for: .normal)
    }
    
}

extension UIColor {
    convenience init(hex: String, alpha: CGFloat = 1.0) {
        var hexSanitized = hex.trimmingCharacters(in: .whitespacesAndNewlines)
        hexSanitized = hexSanitized.replacingOccurrences(of: "#", with: "")

        var rgb: UInt64 = 0

        Scanner(string: hexSanitized).scanHexInt64(&rgb)

        let red = CGFloat((rgb & 0xFF0000) >> 16) / 255.0
        let green = CGFloat((rgb & 0x00FF00) >> 8) / 255.0
        let blue = CGFloat(rgb & 0x0000FF) / 255.0

        self.init(red: red, green: green, blue: blue, alpha: alpha)
    }
}

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

extension UIImage {
    
    func resizeImageTo(size: CGSize) -> UIImage? {
        UIGraphicsBeginImageContextWithOptions(size, false, 0.0)
        self.draw(in: CGRect(origin: CGPoint.zero, size: size))
        guard let resizedImage = UIGraphicsGetImageFromCurrentImageContext() else {
            return nil
        }
        UIGraphicsEndImageContext()
        return resizedImage
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
