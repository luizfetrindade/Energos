import Foundation

class RoutinePresenter {

// MARK: Private Properties

  weak var view: RoutineViewProtocol?
  private var interactor: RoutineInteractorProtocol
  private var router: RoutineRouterProtocol

// MARK: Public Properties

  private(set) var viewModel = RoutineViewModel()

// MARK: Inicialization

  init(interactor: RoutineInteractorProtocol, router: RoutineRouterProtocol) {
    self.interactor = interactor
    self.router = router
  }

// MARK: Private Methods

}

// MARK: Methods of RoutinePresenterProtocol

extension RoutinePresenter: RoutinePresenterProtocol {
}

// MARK: Methods of RoutineInteractorOutputProtocol

extension RoutinePresenter: RoutineInteractorOutputProtocol {
}
