//
//  PostVC.swift
//  BEUS
//
//  Created by 티모시 킴 on 12/3/23.
//

import UIKit

class PostVC: UIViewController {
    
    var customPost: CustomPost?
    var comments: [CustomComment] = customCommentList
    
    private let tableView = UITableView(frame: .zero, style: .plain)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .white
        setRightBarButton()
        setUI()
        setTableViewConfig()
    }
    
}

extension PostVC {
    private func setUI() {
        self.setStyle()
        self.setLayout()
    }
    
    private func setStyle() {
        tableView.do {
            $0.delegate = self
            $0.dataSource = self
            $0.register(CustomPostTVC.self, forCellReuseIdentifier: "CustomPostTVC")
            $0.register(CustomCommentTVC.self, forCellReuseIdentifier: "CustomCommentTVC")
            $0.rowHeight = UITableView.automaticDimension
        }
    }
    
    private func setLayout() {
        self.view.addSubview(tableView)
        
        tableView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    
    private func setRightBarButton() {
        let rightBarButton = UIBarButtonItem(image: UIImage(named: "Ellipsis"), style: .plain, target: self, action: nil)
        rightBarButton.tintColor = .black
        navigationItem.rightBarButtonItem = rightBarButton
    }
    
    private func setTableViewConfig() {
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.register(CustomPostTVC.self, forCellReuseIdentifier: "CustomPostTVC")
        self.tableView.register(CustomCommentTVC.self, forCellReuseIdentifier: "CustomCommentTVC")
        self.tableView.rowHeight = UITableView.automaticDimension
    }
}

extension PostVC: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return comments.count + 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: CustomPostTVC.identifier, for: indexPath) as! CustomPostTVC
            cell.bindData(model: customPost!)
            if customPost!.postImage.count != 0 {
                cell.postImageView.image = customPost!.postImage[0]
                cell.setUI2()
            } else {
                cell.setUI1()
            }
            cell.selectionStyle = .none
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: CustomCommentTVC.identifier, for: indexPath) as! CustomCommentTVC
            let comment = comments[indexPath.row - 1]
            cell.bindData(model: comment)
            cell.selectionStyle = .none
            return cell
        }
    }
}
