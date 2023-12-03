//
//  CustomComment.swift
//  BEUS
//
//  Created by 티모시 킴 on 12/4/23.
//

import Foundation
import UIKit

struct CustomComment {
    let profileImage: UIImage
    let nickname: String
    let content: String
    let time: String
    
    init(profileImage: UIImage, nickname: String, content: String, time: String) {
        self.profileImage = profileImage
        self.nickname = nickname
        self.content = content
        self.time = time
    }
}

var customCommentList: [CustomComment] = [
    .init(profileImage: UIImage(named: "Karim")!, nickname: "카림", content: "내용", time: "07/08 22:17"), .init(profileImage: UIImage(named: "Karim")!, nickname: "카림", content: "내용", time: "07/08 22:17"), .init(profileImage: UIImage(named: "Karim")!, nickname: "카림", content: "내용", time: "07/08 22:17"), .init(profileImage: UIImage(named: "Karim")!, nickname: "카림", content: "내용", time: "07/08 22:17"), .init(profileImage: UIImage(named: "Karim")!, nickname: "카림", content: "내용", time: "07/08 22:17"),
]
