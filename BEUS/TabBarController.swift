//
//  TabBarController.swift
//  BEUS
//
//  Created by 티모시 킴 on 10/16/23.
//

import UIKit

class TabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let homeVC = UINavigationController(rootViewController: HomeVC())
        let myVideosVC = UINavigationController(rootViewController: MyVideosVC())
        let communityVC = UINavigationController(rootViewController: CommunityVC())
        let myPageVC = UINavigationController(rootViewController: MyPageVC())
        
        self.viewControllers = [homeVC, myVideosVC, communityVC, myPageVC]
        
        if let items = self.tabBar.items {
            items[0].image = UIImage(named: "Home")?.resizeImageTo(size: CGSize(width: 35, height: 35))
            items[1].image = UIImage(named: "MyVideos")?.resizeImageTo(size: CGSize(width: 35, height: 35))
            items[2].image = UIImage(named: "Community")?.resizeImageTo(size: CGSize(width: 35, height: 35))
            items[3].image = UIImage(named: "MyPage")?.resizeImageTo(size: CGSize(width: 35, height: 35))
            
            items[0].title = "홈"
            items[1].title = "내 영상"
            items[2].title = "게시판"
            items[3].title = "내 페이지"
        }
        
        self.tabBar.unselectedItemTintColor = .systemGray4
        self.tabBar.tintColor = #colorLiteral(red: 0.582869947, green: 0.8610628247, blue: 0.7095094323, alpha: 1)
    }
    
}
