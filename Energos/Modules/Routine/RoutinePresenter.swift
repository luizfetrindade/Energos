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
}

// MARK: Methods of RoutinePresenterProtocol

extension RoutinePresenter: RoutinePresenterProtocol {
    
    func loadCalendarData() {
        interactor.getCalendarData()
    }
}

// MARK: Methods of RoutineInteractorOutputProtocol

extension RoutinePresenter: RoutineInteractorOutputProtocol {
    func didGetCalendarData(title: String, description: String) {
        viewModel.dayDescription = title
        viewModel.monthAndYear = description
        view?.setCalendarData()
    }
}
