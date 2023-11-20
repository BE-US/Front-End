//
//  CommunityVC.swift
//  BEUS
//
//  Created by 티모시 킴 on 10/16/23.
//

import UIKit

import SnapKit
import Then
import Tabman
import Pageboy

class CommunityVC: TabmanViewController {
    
    let barView = UIView()
    let topLineView = UIView()
    let botttomLineView = UIView()
    let bar = TMBar.ButtonBar()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        self.navigationController?.navigationBar.topItem?.title = "게시판"
        setUI()
    }

}

extension CommunityVC {
    
    private func setUI() {
        setStyle()
        setLayout()
        self.dataSource = self
    }
    
    private func setStyle() {
        
        barView.do {
            $0.backgroundColor = .white
        }
        
        topLineView.do {
            $0.backgroundColor = .white
        }
        
        botttomLineView.do {
            $0.backgroundColor = .white
        }
        
        bar.do {
            $0.layout.transitionStyle = .snap
            $0.layout.contentMode = .intrinsic
            $0.backgroundView.style = .blur(style: .light)
            $0.buttons.customize { (button) in
                // 버튼 커스텀
                button.contentInset = UIEdgeInsets(top: 10, left: 16, bottom: 10, right: 16)
                button.tintColor = #colorLiteral(red: 0.787740171, green: 0.787740171, blue: 0.787740171, alpha: 1)
                button.selectedTintColor = #colorLiteral(red: 0.5215686275, green: 0.8392156863, blue: 0.6509803922, alpha: 1)
            }
            $0.indicator.tintColor = #colorLiteral(red: 0.5215686275, green: 0.8392156863, blue: 0.6509803922, alpha: 1)
            $0.indicator.weight = .custom(value: 1.0)
            addBar($0, dataSource: self, at: .top)
        }
        
    }
    
    private func setLayout() {
        
        barView.addSubviews(topLineView, botttomLineView)
        
        topLineView.snp.makeConstraints {
            $0.top.leading.trailing.equalToSuperview()
            $0.height.equalTo(0.1)
        }
        
        botttomLineView.snp.makeConstraints {
            $0.bottom.leading.trailing.equalToSuperview()
            $0.height.equalTo(0.1)
        }
        
    }
    
}

extension CommunityVC: PageboyViewControllerDataSource {
    
    func numberOfViewControllers(in pageboyViewController: PageboyViewController) -> Int {
        return 7
    }
    
    func viewController(for pageboyViewController: PageboyViewController, at index: PageboyViewController.PageIndex) -> UIViewController? {
        
        switch index {
        case 0:
            return CommunitySportsVC()
        case 1:
            return CommunitySportsVC()
        case 2:
            return CommunitySportsVC()
        case 3:
            return CommunitySportsVC()
        case 4:
            return CommunitySportsVC()
        case 5:
            return CommunitySportsVC()
        case 6:
            return CommunitySportsVC()
        default:
            return nil
        }
        
    }
    
    func defaultPage(for pageboyViewController: PageboyViewController) -> PageboyViewController.Page? {
        return nil
    }
    
}

extension CommunityVC: TMBarDataSource {
    
    func barItem(for bar: TMBar, at index: Int) -> TMBarItemable {
        switch index {
        case 0:
            return TMBarItem(title: "전체")
        case 1:
            return TMBarItem(title: "축구")
        case 2:
            return TMBarItem(title: "야구")
        case 3:
            return TMBarItem(title: "농구")
        case 4:
            return TMBarItem(title: "골프")
        case 5:
            return TMBarItem(title: "테니스")
        default:
            return TMBarItem(title: "수영")
        }
    }
    
}
