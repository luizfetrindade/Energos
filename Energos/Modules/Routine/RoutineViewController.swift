import UIKit

class RoutineViewController: UIViewController {
    
    //    TODO: - Remove this
    var titles: [String] = {
        var array = [String]()
        for index in 0...20 {
            array.append("title-\(index)")
        }
        return array
    }()
    
    // MARK: - Private Properties
    
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
        screen.tableView.delegate = self
        screen.tableView.dataSource = self
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

//MARK: - TableView Delegate & Datasource
extension RoutineViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        titles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: RoutineDataCell.identifier, for: indexPath) as? RoutineDataCell else {
            return UITableViewCell()
        }
        
        cell.titleWithImage.setTitle(titles[indexPath.row])
        return cell
    }
}
