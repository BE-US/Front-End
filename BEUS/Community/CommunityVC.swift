//
//  CommunityVC.swift
//  BEUS
//
//  Created by 티모시 킴 on 10/16/23.
//

import UIKit

import SnapKit
import Then

class CommunityVC: UIViewController {
    
    var posts: [CustomPost] = customPostList
    
    private let tableView = UITableView(frame: .zero, style: .plain)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        self.navigationController?.navigationBar.topItem?.title = "게시판"
        setUI()
        setTableViewConfig()
    }
    
}

extension CommunityVC {
    
    private func setUI() {
        setStyle()
        setLayout()
    }
    
    private func setStyle() {
        tableView.do {
            $0.backgroundColor = .white
            $0.separatorStyle = .none
            $0.showsVerticalScrollIndicator = false
        }
    }
    
    private func setLayout() {
        self.view.addSubview(tableView)
        
        tableView.snp.makeConstraints {
            $0.top.bottom.equalTo(self.view.safeAreaLayoutGuide)
            $0.leading.trailing.equalToSuperview()
        }
    }
    
    private func setTableViewConfig() {
        self.tableView.register(PostTVC.self,
                                forCellReuseIdentifier: PostTVC.identifier)
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.rowHeight = UITableView.automaticDimension
    }
    
}

extension CommunityVC: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let postVC = PostVC()
        postVC.customPost = posts[indexPath.row]
        self.navigationController?.pushViewController(postVC, animated: true)
    }
    
}


extension CommunityVC: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: PostTVC.identifier,
                                                       for: indexPath) as? PostTVC else {return UITableViewCell()}
        let post = posts[indexPath.row]
        
        if post.postImage.count != 0 {
            cell.bindData(model: post)
            cell.setUI2()
            cell.postImageView.image = post.postImage[0]
        } else {
            cell.bindData(model: post)
            cell.setUI1()
        }
        
        cell.backgroundColor = .clear
        cell.selectionStyle = .none
        return cell
    }
    
}
