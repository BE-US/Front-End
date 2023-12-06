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

var customCommentList: [[CustomComment]] = [
    [
        .init(profileImage: UIImage(named: "Cristiano")!, nickname: "크리스티아누", content: "저요!", time: "07/08 22:17")
    ],
    [
        .init(profileImage: UIImage(named: "Toni")!, nickname: "토니", content: "우와", time: "07/08 22:17"),
        .init(profileImage: UIImage(named: "Harry")!, nickname: "해리", content: "부럽다", time: "07/08 22:30")
    ],
    [
        .init(profileImage: UIImage(named: "Sergio")!, nickname: "세르히오", content: "닥시티", time: "07/08 22:17"),
    ],
    [
        .init(profileImage: UIImage(named: "Cristiano")!, nickname: "크리스티아누", content: "ㅇㅇ", time: "07/08 22:17"),
    ],
    [
        .init(profileImage: UIImage(named: "Cristiano")!, nickname: "크리스티아누", content: "나요 ㅋㅋ", time: "07/08 22:17"),
    ],
]
