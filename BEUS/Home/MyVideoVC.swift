//
//  MyVideoVC.swift
//  BEUS
//
//  Created by 티모시 킴 on 12/4/23.
//

import UIKit

import SnapKit
import Then

class MyVideoVC: UIViewController {
    
    var channels: [CustomChannel] = customChannelList
    
    private let tableView = UITableView(frame: .zero, style: .plain)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        setNavigationBar()
        setUI()
        setTableViewConfig()
    }
    
}

extension MyVideoVC {
    
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
    }
    
    private func setLayout() {
        self.view.addSubview(tableView)
        
        tableView.snp.makeConstraints {
            $0.top.bottom.equalTo(self.view.safeAreaLayoutGuide)
            $0.leading.trailing.equalToSuperview()
        }
    }
    
    private func setTableViewConfig() {
        self.tableView.register(ChannelTVC.self,
                                forCellReuseIdentifier: ChannelTVC.identifier)
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.rowHeight = UITableView.automaticDimension
    }
    
}

extension MyVideoVC: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let channelVC = ChannelVC()
        self.navigationController?.pushViewController(channelVC, animated: true)
    }
    
}


extension MyVideoVC: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return channels.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ChannelTVC.identifier,
                                                       for: indexPath) as? ChannelTVC else {return UITableViewCell()}
        let channel = channels[indexPath.row]
        cell.bindData(model: channel)
        cell.backgroundColor = .clear
        cell.selectionStyle = .none
        return cell
    }
    
}
