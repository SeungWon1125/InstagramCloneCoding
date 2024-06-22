//
//  MainTabController.swift
//  InstagramCloneCoding
//
//  Created by 김승원 on 6/22/24.
//

import UIKit

class MainTabController: UITabBarController {
    
    // MARK: - Life Cycle ⭐️
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        configureViewControllers()
    }
    
    // MARK: - Configure ViewControllers
    func configureViewControllers() {
        
        // 뷰컨트롤러 인스턴스 생성
        let feedVC = FeedController()
        let searchVC = SearchController()
        let imageVC = ImageSelectController()
        let notificationVC = NotificationController()
        let profileVC = ProfileController()
        
        // 설명 : An array of the root view controllers displayed by the tab bar interface.
        viewControllers = [feedVC, searchVC, imageVC, notificationVC, profileVC]
        
        self.setViewControllers(viewControllers, animated: true)
        self.modalPresentationStyle = .fullScreen
        self.tabBar.backgroundColor = .white
    }
}
