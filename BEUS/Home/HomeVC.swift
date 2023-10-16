//
//  HomeVC.swift
//  BEUS
//
//  Created by 티모시 킴 on 10/16/23.
//

import UIKit

class HomeVC: UIViewController {
    
    let backgroundView: UIView = {
        let backgroundView = UIView()
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [UIColor(hex: "#85D6A6").cgColor, UIColor(hex: "#FFE381").cgColor]
        gradientLayer.locations = [0.0, 1.0]
        gradientLayer.startPoint = CGPoint(x: 0.0, y: 0.0)
        gradientLayer.endPoint = CGPoint(x: 0.0, y: 1.0)
        backgroundView.layer.insertSublayer(gradientLayer, at: 0)
        return backgroundView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        let attributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        self.navigationController?.navigationBar.topItem?.title = "홈"
        self.navigationController?.navigationBar.titleTextAttributes = attributes
        setUI()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        backgroundView.layer.sublayers?.first?.frame = backgroundView.bounds
    }
    
}

extension HomeVC {
    
    func setUI() {
        makeSubView()
        makeConstraint()
    }
    
    func makeSubView() {
        [backgroundView].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview($0)
        }
        print(#function)
    }
    
    func makeConstraint() {
        NSLayoutConstraint.activate([
            backgroundView.topAnchor.constraint(equalTo: view.topAnchor),
            backgroundView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backgroundView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            backgroundView.heightAnchor.constraint(equalToConstant: 200)
        ])
    }
    
}
