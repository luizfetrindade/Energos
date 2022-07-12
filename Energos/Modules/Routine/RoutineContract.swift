import Foundation

// MARK: View Output (Screen -> View)
protocol RoutineScreenDelegate: AnyObject {
}

// MARK: View Output (Presenter -> View)
protocol RoutineViewProtocol: AnyObject {
    
    func setCalendarData()
}

// MARK: View Input (View -> Presenter)
protocol RoutinePresenterProtocol: AnyObject {
  var viewModel: RoutineViewModel { get }
    
    func loadCalendarData()
}

// MARK: Interactor Input (Presenter -> Interactor)
protocol RoutineInteractorProtocol: AnyObject {
    func getCalendarData()
}

// MARK: Interactor Output (Interactor -> Presenter)
protocol RoutineInteractorOutputProtocol: AnyObject {
    
    func didGetCalendarData(title: String, description: String)
}

// MARK: Router Input (Presenter -> Router)
protocol RoutineRouterProtocol: AnyObject {
}
