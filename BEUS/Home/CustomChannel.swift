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

var customChannelList: [CustomChannel] = [.init(channelImage: UIImage(named: "Training1")!, channelName: "신이 될 수 있는 코스", nickname: "크리스티아누", team: "마드리드", grade: 10, videoNumber: 7), .init(channelImage: UIImage(named: "Training2")!, channelName: "스트라이커의 교과서", nickname: "카림", team: "마드리드", grade: 9, videoNumber: 17), .init(channelImage: UIImage(named: "Training3")!, channelName: "대장급 미드필더의 비결", nickname: "토니", team: "마드리드", grade: 8, videoNumber: 14)]
