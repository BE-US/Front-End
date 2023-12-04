//
//  CustomChannel.swift
//  BEUS
//
//  Created by 티모시 킴 on 12/4/23.
//

import Foundation
import UIKit

struct CustomChannel {
    let channelImage: UIImage
    let channelName: String
    let nickname: String
    let team: String
    let grade: Int
    let videoNumber: Int
    
    init(channelImage: UIImage, channelName: String, nickname: String, team: String, grade: Int, videoNumber: Int) {
        self.channelImage = channelImage
        self.channelName = channelName
        self.nickname = nickname
        self.team = team
        self.grade = grade
        self.videoNumber = videoNumber
    }
}

var customChannelList: [CustomChannel] = [.init(channelImage: UIImage(named: "Football")!, channelName: "채널 이름", nickname: "닉네임", team: "소속팀", grade: 9, videoNumber: 17), .init(channelImage: UIImage(named: "Football")!, channelName: "채널 이름", nickname: "닉네임", team: "소속팀", grade: 9, videoNumber: 17), .init(channelImage: UIImage(named: "Football")!, channelName: "채널 이름", nickname: "닉네임", team: "소속팀", grade: 9, videoNumber: 17)]
