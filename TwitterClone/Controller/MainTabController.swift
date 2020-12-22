//
//  MainTabController.swift
//  TwitterClone
//
//  Created by 罗帅卿 on 12/18/20.
//

import UIKit
import Firebase

class MainTabController: UITabBarController {

    // MARK: - Properties
    
    var user: User? {
        // do something whenever this property is set
        didSet {
            guard let nav = viewControllers?[0] as? UINavigationController else { return }
            guard let feed = nav.viewControllers.first as? FeedController else { return }
            
            feed.user = user
        }
    }
    
    // set up the button here so that it will appear on all tab bar
    let actionButton: UIButton = {
        let button = UIButton(type: .system)
        button.tintColor = .white
        button.backgroundColor = .twitterBlue
        button.setImage(UIImage(named: "new_tweet"), for: .normal)
        button.addTarget(self, action: #selector(actionButtonTapped), for: .touchUpInside)
        return button
    }()
    
    // MARK: - Lifecycles
    
    override func viewDidLoad() {
        super.viewDidLoad()

//        logUserOut()
        view.backgroundColor = .twitterBlue
        authenticateUserAndConfigureUI()
    }
    
    // MARK: - API

    func fetchUser() {
        UserService.shared.fetchUser { user in
            self.user = user
        }
    }
    
    func authenticateUserAndConfigureUI() {
        if Auth.auth().currentUser == nil {
            print("DEBUG: User is NOT logged in..")
            DispatchQueue.main.async {
                let nav = UINavigationController(rootViewController: LoginController())
                nav.modalPresentationStyle = .fullScreen
                self.present(nav, animated: true, completion: nil)
            }
        } else {
            print("DEBUG: User is logged in..")
            configureViewControllers()
            configureUI()
            fetchUser()
        }
    }
    
    func logUserOut() {
        do {
            try Auth.auth().signOut()
        } catch let error {
            print("DEBUG: Failed to sign out with error: \(error.localizedDescription)")
        }
    }
    
    // MARK: - Selectors
    
    @objc func actionButtonTapped() {
        print("123")
    }
    
    // MARK: - Helpers
    
    func configureUI() {
        view.addSubview(actionButton)
        actionButton.anchor(bottom: view.safeAreaLayoutGuide.bottomAnchor, trailing: view.trailingAnchor, paddingBottom: 64, paddingRight: 16, width: 56, height: 56)
        actionButton.layer.cornerRadius = 56 / 2
    }
    
    func configureViewControllers() {
        
        let nav1 = templateNavigationController(image: UIImage(named: "home_unselected"), rootViewController: FeedController())
        
        let nav2 = templateNavigationController(image: UIImage(named: "search_unselected"), rootViewController: ExploreController())
        
        let nav3 = templateNavigationController(image: UIImage(named: "like_unselected"), rootViewController: NotificationsController())
        
        let nav4 = templateNavigationController(image: UIImage(named: "ic_mail_outline_white_2x-1"), rootViewController: ConversationsController())
        
        // set up the navigation controllers with their tab bar controllers
        viewControllers = [nav1, nav2, nav3, nav4]
    }

    func templateNavigationController(image: UIImage?, rootViewController: UIViewController) -> UINavigationController {
        
        // the rootviewcontroller is actually embedded inside the navigation controller
        let nav = UINavigationController(rootViewController: rootViewController)
        nav.tabBarItem.image = image
        nav.navigationBar.barTintColor = .white
        return nav
    }
}
