import UIKit
import SnapKit

class RoutineScreen: UIView {
    
// MARK: Private Properties
    
    weak var delegate: RoutineScreenDelegate?
    
// MARK: Views
    
    lazy var header = DateHeader()
    
    lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .plain)
        tableView.separatorInset = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
        tableView.allowsMultipleSelection = false
        tableView.tableFooterView = UIView(frame: .zero)
        return tableView
    }()
    
// MARK: Inicialization
    
    override init(frame: CGRect = .zero) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: Methods of View Code Protocol

extension RoutineScreen: ViewCode {
    
    func buildViewHierarchy() {
        addSubview(header)
        addSubview(tableView)
    }
    
    func setupConstraints() {
        header.snp.makeConstraints { (make) -> Void in
            make.trailing.leading.equalToSuperview().inset(Constants.View.padding08)
            make.top.equalToSuperview().inset(Constants.View.padding40)
        }
        
        tableView.snp.makeConstraints { make in
            make.leading.trailing.bottom.equalToSuperview()
            make.top.equalTo(header.snp.bottom).offset(Constants.View.padding40)
        }
    }
    
    func setupAditionalConfiguration() {
        backgroundColor = Constants.Colors.darkGray
    }
}
