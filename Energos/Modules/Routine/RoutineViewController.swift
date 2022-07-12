import UIKit

class RoutineViewController: UIViewController {

// MARK: Private Properties

  private let presenter: RoutinePresenterProtocol
  private let screen = RoutineScreen()

// MARK: Inicialization

  init(presenter: RoutinePresenterProtocol) {
    self.presenter = presenter
    super.init(nibName: nil, bundle: nil)
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

// MARK: Lifecycle Methods

  override func loadView() {
    view = screen
    screen.delegate = self
  }

  override func viewDidLoad() {
    super.viewDidLoad()
    presenter.loadCalendarData()
  }

}

// MARK: Methods of RoutineScreenDelegate

extension RoutineViewController: RoutineScreenDelegate {
}

// MARK: Methods of RoutineViewProtocol

extension RoutineViewController: RoutineViewProtocol {
        
    func setCalendarData() {
        screen.header.details = presenter.viewModel.monthAndYear
        screen.header.title = presenter.viewModel.dayDescription
        screen.header.setupTextLabel()
    }
}
