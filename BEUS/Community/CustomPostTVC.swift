//
//  CustomPostTVC.swift
//  BEUS
//
//  Created by 티모시 킴 on 12/3/23.
//

import UIKit

class CustomPostTVC: UITableViewCell {
    
    static let identifier: String = "CustomPostTVC"
    
    var customPost: CustomPost?
    
    private let prevImageButton = UIButton()
    private let nextImageButton = UIButton()
    private let profileImageView = UIImageView()
    private let nicknameLabel = UILabel()
    private let titleLabel = UILabel()
    private let contentLabel = UILabel()
    let postImageView = UIImageView()
    private let timeLabel = UILabel()
    private let likeImageView = UIImageView()
    private let likeLabel = UILabel()
    private let commentImageView = UIImageView()
    private let commentLabel = UILabel()

}

extension CustomPostTVC {
    
    func setUI1() {
        setStyle()
        setLayout1()
    }
    
    func setUI2() {
        setStyle()
        setLayout2()
    }
    
    private func setStyle() {
        prevImageButton.do {
            $0.setImage(UIImage(systemName: "chevron.left"), for: .normal)
            $0.addTarget(self, action: #selector(prevImageButtonTapped(_:)), for: .touchUpInside)
        }
        
        nextImageButton.do {
            $0.setImage(UIImage(systemName: "chevron.right"), for: .normal)
            $0.addTarget(self, action: #selector(prevImageButtonTapped(_:)), for: .touchUpInside)
        }
        
        profileImageView.do {
            $0.contentMode = .scaleAspectFill
            $0.clipsToBounds = true
            $0.layer.cornerRadius = 22
        }
        
        nicknameLabel.do {
            $0.font = .boldSystemFont(ofSize: 15)
            $0.numberOfLines = 1
        }
        
        titleLabel.do {
            $0.font = .boldSystemFont(ofSize: 17)
        }
        
        contentLabel.do {
            $0.font = .systemFont(ofSize: 15)
            $0.numberOfLines = 0
        }
        
        postImageView.do {
            $0.contentMode = .scaleAspectFill
            $0.clipsToBounds = true
        }
        
        timeLabel.do {
            $0.text = "07/08 22:17"
            $0.font = .systemFont(ofSize: 14)
            $0.textColor = #colorLiteral(red: 0.824265182, green: 0.8242650628, blue: 0.8242650628, alpha: 1)
            $0.numberOfLines = 1
        }
        
        likeImageView.do {
            $0.image = UIImage(systemName: "hand.thumbsup.fill")
            $0.contentMode = .scaleAspectFill
            $0.clipsToBounds = true
        }
        
        likeLabel.do {
            $0.text = "10"
            $0.font = .systemFont(ofSize: 14)
        }
        
        commentImageView.do {
            $0.image = UIImage(systemName: "text.bubble.fill")
            $0.contentMode = .scaleAspectFill
            $0.clipsToBounds = true
        }
        
        commentLabel.do {
            $0.text = "4"
            $0.font = .systemFont(ofSize: 14)
        }
    }
    
    private func setLayout1() {
        contentView.addSubviews(profileImageView, nicknameLabel, titleLabel, contentLabel, timeLabel, likeImageView, likeLabel, commentImageView, commentLabel)
        
        profileImageView.snp.makeConstraints {
            $0.top.equalToSuperview().inset(8)
            $0.leading.equalToSuperview().inset(20)
            $0.size.equalTo(40)
        }
        
        nicknameLabel.snp.makeConstraints {
            $0.top.equalTo(profileImageView).offset(3)
            $0.leading.equalTo(profileImageView.snp.trailing).offset(8)
            $0.trailing.equalToSuperview().inset(30)
        }
        
        timeLabel.snp.makeConstraints {
            $0.leading.equalTo(profileImageView.snp.trailing).offset(8)
            $0.bottom.equalTo(profileImageView)
        }
        
        titleLabel.snp.makeConstraints {
            $0.top.equalTo(profileImageView.snp.bottom).offset(10)
            $0.leading.trailing.equalToSuperview().inset(30)
        }
        
        contentLabel.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(10)
            $0.leading.trailing.equalToSuperview().inset(30)
        }
        
        likeImageView.snp.makeConstraints {
            $0.top.equalTo(contentLabel.snp.bottom).offset(10)
            $0.leading.equalToSuperview().inset(30)
            $0.bottom.equalToSuperview().inset(8)
            $0.size.equalTo(20)
        }
        
        likeLabel.snp.makeConstraints {
            $0.top.equalTo(likeImageView)
            $0.bottom.equalTo(likeImageView)
            $0.leading.equalTo(likeImageView.snp.trailing).offset(5)
        }
        
        commentImageView.snp.makeConstraints {
            $0.top.equalTo(likeImageView)
            $0.bottom.equalTo(likeImageView)
            $0.leading.equalTo(likeLabel.snp.trailing).offset(20)
        }
        
        commentLabel.snp.makeConstraints {
            $0.top.equalTo(likeImageView)
            $0.bottom.equalTo(likeImageView)
            $0.leading.equalTo(commentImageView.snp.trailing).offset(5)
        }
    }
    
    private func setLayout2() {
        contentView.addSubviews(profileImageView, nicknameLabel, titleLabel, contentLabel, postImageView, timeLabel, likeImageView, likeLabel, commentImageView, commentLabel)
        postImageView.addSubviews(prevImageButton, nextImageButton)
        
        profileImageView.snp.makeConstraints {
            $0.top.equalToSuperview().inset(8)
            $0.leading.equalToSuperview().inset(30)
            $0.size.equalTo(40)
        }
        
        nicknameLabel.snp.makeConstraints {
            $0.top.equalTo(profileImageView).offset(3)
            $0.leading.equalTo(profileImageView.snp.trailing).offset(8)
            $0.trailing.equalToSuperview().inset(30)
        }
        
        timeLabel.snp.makeConstraints {
            $0.leading.equalTo(profileImageView.snp.trailing).offset(8)
            $0.bottom.equalTo(profileImageView)
        }
        
        titleLabel.snp.makeConstraints {
            $0.top.equalTo(profileImageView.snp.bottom).offset(10)
            $0.leading.trailing.equalToSuperview().inset(30)
        }
        
        contentLabel.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(10)
            $0.leading.trailing.equalToSuperview().inset(30)
        }
        
        postImageView.snp.makeConstraints {
            $0.top.equalTo(contentLabel.snp.bottom).offset(10)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(200)
        }
        
        prevImageButton.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(8)
            $0.centerY.equalToSuperview()
            $0.size.equalTo(30)
        }
        
        nextImageButton.snp.makeConstraints {
            $0.trailing.equalToSuperview().inset(8)
            $0.centerY.equalToSuperview()
            $0.size.equalTo(30)
        }
        
        likeImageView.snp.makeConstraints {
            $0.top.equalTo(postImageView.snp.bottom).offset(10)
            $0.leading.equalToSuperview().inset(30)
            $0.bottom.equalToSuperview().inset(8)
            $0.size.equalTo(20)
        }
        
        likeLabel.snp.makeConstraints {
            $0.top.equalTo(likeImageView)
            $0.bottom.equalTo(likeImageView)
            $0.leading.equalTo(likeImageView.snp.trailing).offset(5)
        }
        
        commentImageView.snp.makeConstraints {
            $0.top.equalTo(likeImageView)
            $0.bottom.equalTo(likeImageView)
            $0.leading.equalTo(likeLabel.snp.trailing).offset(20)
        }
        
        commentLabel.snp.makeConstraints {
            $0.top.equalTo(likeImageView)
            $0.bottom.equalTo(likeImageView)
            $0.leading.equalTo(commentImageView.snp.trailing).offset(5)
        }
    }
    
    override func hitTest(_ point: CGPoint, with event: UIEvent?) -> UIView? {
        if let view = prevImageButton.hitTest(convert(point, to: prevImageButton), with: event) {
            return view
        }
        
        if let view = nextImageButton.hitTest(convert(point, to: nextImageButton), with: event) {
            return view
        }
        
        return super.hitTest(point, with: event)
    }
    
    @objc func prevImageButtonTapped(_ sender: UIButton) {
        guard let images = customPost?.postImage, !images.isEmpty else { return }
        if let currentImageIndex = images.firstIndex(of: postImageView.image!) {
            let prevIndex = (currentImageIndex - 1 + images.count) % images.count
            postImageView.image = images[prevIndex]
        }
    }
    
    @objc func nextImageButtonTapped(_ sender: UIButton) {
        guard let images = customPost?.postImage, !images.isEmpty else { return }
        if let currentImageIndex = images.firstIndex(of: postImageView.image!) {
            let nextIndex = (currentImageIndex + 1) % images.count
            postImageView.image = images[nextIndex]
        }
    }
    
    func bindData(model: CustomPost) {
        self.customPost = model
        
        profileImageView.image = model.profileImage
        nicknameLabel.text = model.nickname
        titleLabel.text = model.title
        contentLabel.text = model.content
        timeLabel.text = model.time
        likeLabel.text = "\(model.like)"
        commentLabel.text = "\(model.comment)"
    }
}
