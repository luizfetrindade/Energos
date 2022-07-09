import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    
            let viewController = RoutineRouter.configuredViewController()
            let navController = UINavigationController(rootViewController: viewController)
            navController.navigationBar.isHidden = true
    
            window = UIWindow(frame: UIScreen.main.bounds)
            window?.rootViewController = navController
            window?.makeKeyAndVisible()
    
            return true
    }
}
