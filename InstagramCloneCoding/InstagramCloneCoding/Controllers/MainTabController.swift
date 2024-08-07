//
//  MainTabController.swift
//  InstagramCloneCoding
//
//  Created by 김승원 on 6/22/24.
//

import UIKit
import Firebase

class MainTabController: UITabBarController {
    
    // MARK: - Life Cycle ⭐️
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        configureViewControllers()
        checkIfUserIsLoggedIn()

    }
    
    // MARK: - API
    func checkIfUserIsLoggedIn() {
        if Auth.auth().currentUser == nil { // api호출이기 때문에
            DispatchQueue.main.async { // 이거는 메인쓰레드로 보내야 한다.
                let controller = LoginController()
                controller.delegate = self
                let nav = UINavigationController(rootViewController: controller)
                nav.modalPresentationStyle = .fullScreen
                self.present(nav, animated: true, completion: nil)
            }
        }
    }
    
    // MARK: - Configure ViewControllers
    func configureViewControllers() {
        
        // 뷰컨트롤러 인스턴스 생성
        let layout = UICollectionViewFlowLayout()
        let feedVC = templateNavigationController(unselectedImage: UIImage(named: "home_unselected")!,
                                                  selectedImage: UIImage(named: "home_selected")!,
                                                  rootViewController: FeedController(collectionViewLayout: layout))
        
        let searchVC = templateNavigationController(unselectedImage: UIImage(named: "search_unselected")!,
                                                    selectedImage: UIImage(named: "search_selected")!,
                                                    rootViewController: SearchController())
        
        let imageVC = templateNavigationController(unselectedImage: UIImage(named: "plus_unselected")!,
                                                   selectedImage: UIImage(named: "plus_unselected")!,
                                                   rootViewController: ImageSelectController())
        
        let notificationVC = templateNavigationController(unselectedImage: UIImage(named: "like_unselected")!,
                                                          selectedImage: UIImage(named: "like_selected")!,
                                                          rootViewController: NotificationController())
        
        let profileVC = templateNavigationController(unselectedImage: UIImage(named: "profile_unselected")!,
                                                     selectedImage: UIImage(named: "profile_selected")!,
                                                     rootViewController: ProfileController())
        
        // 설명 : An array of the root view controllers displayed by the tab bar interface.
        viewControllers = [feedVC, searchVC, imageVC, notificationVC, profileVC]
        
        tabBar.tintColor = .black
        
        self.setViewControllers(viewControllers, animated: true)
        self.modalPresentationStyle = .fullScreen
        self.tabBar.backgroundColor = .white
    }
    
    func templateNavigationController(unselectedImage: UIImage, selectedImage: UIImage, rootViewController: UIViewController) -> UINavigationController {
        let nav = UINavigationController(rootViewController: rootViewController)
        nav.tabBarItem.image = unselectedImage
        nav.tabBarItem.selectedImage = selectedImage
        nav.navigationBar.tintColor = .black
        return nav
    }
}

extension MainTabController: AuthenticationDelegate {
    func authenticationDidComplete() {
        print("DEBUG: Auth did complete.")
        self.dismiss(animated: true, completion: nil)
    }
    
    
}
