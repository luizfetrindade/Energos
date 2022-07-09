import UIKit

class RoutineRouter {

  // MARK: Private Properties

  private weak var viewController: UIViewController?

  // MARK: Static methods

  static func configuredViewController() -> UIViewController {

    let router = RoutineRouter()
    let interactor = RoutineInteractor()

    let presenter = RoutinePresenter(
      interactor: interactor,
      router: router
    )

    let viewController = RoutineViewController(
      presenter: presenter
    )

    router.viewController = viewController
    presenter.view = viewController
    interactor.output = presenter

    return viewController

  }

}

// MARK: Methods of RoutineRouterProtocol

extension RoutineRouter: RoutineRouterProtocol {
}
