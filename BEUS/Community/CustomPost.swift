//
//  CustomPost.swift
//  BEUS
//
//  Created by 티모시 킴 on 12/4/23.
//

import Foundation
import UIKit

struct CustomPost {
    let profileImage: UIImage
    let nickname: String
    let title: String
    let content: String
    let postImage: [UIImage?]
    let time: String
    let like: Int
    let comment: Int
    
    init(profileImage: UIImage, nickname: String, title: String, content: String, postImage: [UIImage?], time: String, like: Int, comment: Int) {
        self.profileImage = profileImage
        self.nickname = nickname
        self.title = title
        self.content = content
        self.postImage = postImage
        self.time = time
        self.like = like
        self.comment = comment
    }
}

var customPostList: [CustomPost] = [.init(profileImage: UIImage(named: "Karim")!, nickname: "카림", title: "제목", content: "내용", postImage: [UIImage(named: "Football"), UIImage(named: "Santiago")], time: "07/08 22:17", like: 10, comment: 4), .init(profileImage: UIImage(named: "Karim")!, nickname: "카림", title: "제목", content: "내용", postImage: [UIImage(named: "Santiago")], time: "07/08 22:17", like: 10, comment: 4), .init(profileImage: UIImage(named: "Karim")!, nickname: "카림", title: "제목", content: "내용", postImage: [], time: "07/08 22:17", like: 10, comment: 4), .init(profileImage: UIImage(named: "Karim")!, nickname: "카림", title: "제목", content: "내용", postImage: [UIImage(named: "Football"), UIImage(named: "Santiago")], time: "07/08 22:17", like: 10, comment: 4)]
