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
    private lazy var floatingButton = UIButton()
    private lazy var writeButton = UIButton()
    private var isActive: Bool = false {
        didSet {
            showActionButtons()
        }
    }
    private var animation: UIViewPropertyAnimator?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        self.navigationController?.navigationBar.topItem?.title = "게시판"
        setTableViewConfig()
        setUI()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        floatingButton.frame = CGRect(x: view.frame.size.width - 60 - 8 - 20, y: view.frame.size.height - 60 - 8 - 90, width: 60, height: 60)
        writeButton.frame = CGRect(x: view.frame.size.width - 60 - 8 - 20, y: view.frame.size.height - 60 - 80 - 8 - 80, width: 60, height: 60)
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
        
        floatingButton.do {
            var config = UIButton.Configuration.filled()
            config.baseBackgroundColor = #colorLiteral(red: 0.5215686275, green: 0.8392156863, blue: 0.6509803922, alpha: 1)
            config.cornerStyle = .capsule
            config.image = UIImage(systemName: "plus")?.withConfiguration(UIImage.SymbolConfiguration(pointSize: 20, weight: .medium))
            $0.configuration = config
            $0.addTarget(self, action: #selector(didTapFloatingButton), for: .touchUpInside)
        }
        
        writeButton.do {
            var config = UIButton.Configuration.filled()
            config.baseBackgroundColor = #colorLiteral(red: 0.5215686275, green: 0.8392156863, blue: 0.6509803922, alpha: 1)
            config.cornerStyle = .capsule
            config.image = UIImage(systemName: "pencil")?.withConfiguration(UIImage.SymbolConfiguration(pointSize: 20, weight: .medium))
            $0.configuration = config
            $0.alpha = 0.0
            $0.addTarget(self, action: #selector(writeButtonTapped), for: .touchUpInside)
        }
    }
    
    private func setLayout() {
        self.view.addSubviews(tableView, floatingButton, writeButton)
        
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
    
    @objc private func didTapFloatingButton() {
        isActive.toggle()
    }
    
    private func showActionButtons() {
        popButtons()
        rotateFloatingButton()
    }
    
    private func popButtons() {
        if isActive {
            writeButton.layer.transform = CATransform3DMakeScale(0.4, 0.4, 1)
            UIView.animate(withDuration: 0.3, delay: 0.2, usingSpringWithDamping: 0.55, initialSpringVelocity: 0.3, options: [.curveEaseInOut], animations: { [weak self] in
                guard let self = self else { return }
                self.writeButton.layer.transform = CATransform3DIdentity
                self.writeButton.alpha = 1.0
            })
        } else {
            UIView.animate(withDuration: 0.15, delay: 0.2, options: []) { [weak self] in
                guard let self = self else { return }
                self.writeButton.layer.transform = CATransform3DMakeScale(0.4, 0.4, 0.1)
                self.writeButton.alpha = 0.0
            }
        }
    }
    
    private func rotateFloatingButton() {
        let animation = CABasicAnimation(keyPath: "transform.rotation.z")
        let fromValue = isActive ? 0 : CGFloat.pi / 4
        let toValue = isActive ? CGFloat.pi / 4 : 0
        animation.fromValue = fromValue
        animation.toValue = toValue
        animation.duration = 0.3
        animation.fillMode = .forwards
        animation.isRemovedOnCompletion = false
        floatingButton.layer.add(animation, forKey: nil)
    }
    
    @objc func writeButtonTapped() {
        let writeVC = WriteVC()
        writeVC.hidesBottomBarWhenPushed = true
        navigationController?.pushViewController(writeVC, animated: true)
    }
}

extension CommunityVC: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let postVC = PostVC()
        postVC.comments = customCommentList[indexPath.row]
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
