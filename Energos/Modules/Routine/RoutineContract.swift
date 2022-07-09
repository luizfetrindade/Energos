import Foundation

// MARK: View Output (Screen -> View)
protocol RoutineScreenDelegate: AnyObject {
}

// MARK: View Output (Presenter -> View)
protocol RoutineViewProtocol: AnyObject {
}

// MARK: View Input (View -> Presenter)
protocol RoutinePresenterProtocol: AnyObject {
  var viewModel: RoutineViewModel { get }
}

// MARK: Interactor Input (Presenter -> Interactor)
protocol RoutineInteractorProtocol: AnyObject {
}

// MARK: Interactor Output (Interactor -> Presenter)
protocol RoutineInteractorOutputProtocol: AnyObject {
}

// MARK: Router Input (Presenter -> Router)
protocol RoutineRouterProtocol: AnyObject {
}
