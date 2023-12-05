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

var customPostList: [CustomPost] = [.init(profileImage: UIImage(named: "Karim")!, nickname: "카림", title: "주말에 야탑에서 플랩할 사람~~~", content: "즐겁게 찰 사람 찾습니다~", postImage: [UIImage(named: "Football")], time: "07/08 22:17", like: 10, comment: 4), .init(profileImage: UIImage(named: "Cristiano")!, nickname: "크리스티아누", title: "산티아고 베르나베우 직관 왔어요~!", content: "할라 마드리드~~@!#$%~~@#!@#$~@@#!@#@!#!@#!#@#!@#@!#!!#@#!#!@#!@#!@#@!#!@#@!#@!#!#!할라 마드리드~~@!#$%~~@#!@#$~@@#!@#@!#!@#!#@#!@#@!#!!#@#!#!@#!@#!@#@!#!@#@!#@!#!#!할라 마드리드~~@!#$%~~@#!@#$~@@#!@#@!#!@#!#@#!@#@!#!!#@#!#!@#!@#!@#@!#!@#@!#@!#!#!", postImage: [UIImage(named: "Santiago"), UIImage(named: "Trophies")], time: "07/08 22:17", like: 10, comment: 4), .init(profileImage: UIImage(named: "Sergio")!, nickname: "세르히오", title: "토트넘 맨시티", content: "누가 이길 것 같냐 ㅋㅋ", postImage: [], time: "07/08 22:17", like: 10, comment: 4), .init(profileImage: UIImage(named: "Toni")!, nickname: "토니", title: "크로스 평가좀", content: "발을 좀더 눕혀야 되나?", postImage: [UIImage(named: "Passing")], time: "07/08 22:17", like: 10, comment: 4), .init(profileImage: UIImage(named: "Harry")!, nickname: "해리", title: "나보다 골 잘 넣는 사람 ㅋ", content: "ㅋ", postImage: [UIImage(named: "Shooting"), UIImage(named: "Santiago")], time: "07/08 22:17", like: 10, comment: 4)]
