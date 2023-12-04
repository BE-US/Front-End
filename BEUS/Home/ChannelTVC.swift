//
//  ChannelTVC.swift
//  BEUS
//
//  Created by 티모시 킴 on 12/4/23.
//

import UIKit

import UIKit

class ChannelTVC: UITableViewCell {
    
    static let identifier: String = "ChannelTVC"
    
    private let channelImageView = UIImageView()
    private let channelNameLabel = UILabel()
    private let nicknameLabel = UILabel()
    private let teamLabel = UILabel()
    private let likeImageView = UIImageView()
    private let gradeLabel = UILabel()
    private let videoNumberLabel = UILabel()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.setUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

extension ChannelTVC {
    
    private func setUI() {
        setStyle()
        setLayout()
    }
    
    private func setStyle() {
        channelImageView.do {
            $0.contentMode = .scaleAspectFill
            $0.clipsToBounds = true
        }
        
        channelNameLabel.do {
            $0.font = .boldSystemFont(ofSize: 15)
        }
        
        nicknameLabel.do {
            $0.font = .boldSystemFont(ofSize: 13)
        }
        
        teamLabel.do {
            $0.font = .boldSystemFont(ofSize: 12)
            $0.textColor = .systemGray2
        }
        
        likeImageView.do {
            $0.image = UIImage(systemName: "heart.fill")
            $0.contentMode = .scaleAspectFill
            $0.clipsToBounds = true
        }
        
        gradeLabel.do {
            $0.font = .boldSystemFont(ofSize: 12)
            $0.textColor = .systemGray2
        }
        
        videoNumberLabel.do {
            $0.font = .boldSystemFont(ofSize: 12)
            $0.textColor = .systemGray2
        }
    }
    
    private func setLayout() {
        contentView.addSubviews(channelImageView, channelNameLabel, nicknameLabel, teamLabel, likeImageView, gradeLabel, videoNumberLabel)
        
        channelImageView.snp.makeConstraints {
            $0.top.equalToSuperview().inset(15)
            $0.leading.trailing.equalToSuperview().inset(30)
            $0.height.equalTo(170)
        }
        
        channelNameLabel.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(30)
            $0.top.equalTo(channelImageView.snp.bottom).offset(3)
        }
        
        nicknameLabel.snp.makeConstraints {
            $0.trailing.equalToSuperview().inset(30)
            $0.top.equalTo(channelNameLabel)
        }
        
        teamLabel.snp.makeConstraints {
            $0.top.equalTo(nicknameLabel.snp.bottom).offset(1)
            $0.centerX.equalTo(nicknameLabel)
        }
        
        likeImageView.snp.makeConstraints {
            $0.top.equalTo(channelNameLabel.snp.bottom).offset(1)
            $0.bottom.equalToSuperview().inset(3)
            $0.leading.equalTo(channelNameLabel)
            $0.size.equalTo(12)
        }
        
        gradeLabel.snp.makeConstraints {
            $0.bottom.equalTo(likeImageView)
            $0.leading.equalTo(likeImageView.snp.trailing).offset(5)
        }
        
        videoNumberLabel.snp.makeConstraints {
            $0.bottom.equalTo(likeImageView)
            $0.leading.equalTo(gradeLabel.snp.trailing).offset(2)
            $0.bottom.equalToSuperview().inset(3)
        }
    }
    
    func bindData(model: CustomChannel) {
        channelImageView.image = model.channelImage
        channelNameLabel.text = model.channelName
        nicknameLabel.text = model.nickname
        teamLabel.text = model.team
        gradeLabel.text = "\(model.grade)/10"
        videoNumberLabel.text = "강의 수 \(model.videoNumber)개"
    }
    
}
