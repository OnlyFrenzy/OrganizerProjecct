//
//  SceneDelegate.swift
//  adaptCalculator
//
//  Created by OnlyFrenzy on 03.10.2020.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        let navigationController = UINavigationController()
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
        
        let calculatorStoryboard = UIStoryboard(name: "CalculatorViewController", bundle: nil)
        guard let calculatorViewController = calculatorStoryboard.instantiateInitialViewController()
                as? CalculatorViewController else { return }
        navigationController.viewControllers = [calculatorViewController]
        guard let _ = (scene as? UIWindowScene) else { return }
    }
}

