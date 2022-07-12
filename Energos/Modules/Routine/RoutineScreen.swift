import UIKit
import SnapKit

class RoutineScreen: UIView {
    
//    MARK: - Typealias
    
    typealias Font = Constants.FontName
    typealias Color = Constants.Colors
    typealias View = Constants.View
    
// MARK: Private Properties
    
    weak var delegate: RoutineScreenDelegate?
    
// MARK: Views
    
    lazy var header = HeaderWithUpperDescription(title: "", details: "")
    
    lazy var tableView: UITableView = {
        $0.backgroundColor = .clear
        $0.separatorInset = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
        $0.allowsMultipleSelection = false
        $0.separatorColor = Color.lightGray
        $0.tableFooterView = UIView(frame: .zero)
        return $0
    }(UITableView(frame: .zero, style: .plain))
    
    lazy var roundButton: UIButton = {
        $0.backgroundColor = Color.lightGray
        $0.setTitle("+", for: .normal)
        $0.setTitleColor(Color.darkGray, for: .normal)
        return $0
    }(UIButton())
    
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
        addSubview(roundButton)
    }
    
    func setupConstraints() {
        header.snp.makeConstraints { (make) -> Void in
            make.trailing.leading.equalToSuperview().inset(View.padding08)
            make.top.equalToSuperview().inset(View.padding40)
        }
        
        tableView.snp.makeConstraints { make in
            make.leading.trailing.bottom.equalToSuperview()
            make.top.equalTo(header.snp.bottom).offset(View.padding40)
        }
        
        roundButton.snp.makeConstraints { make in
            make.height.width.equalTo(60)
            make.trailing.equalToSuperview().inset(View.padding40)
            make.bottom.equalToSuperview().inset(View.padding64)
        }
    }
    
    func setupAditionalConfiguration() {
        backgroundColor = Color.darkGray
        roundButton.layer.cornerRadius = 30
        roundButton.layer.masksToBounds = true
    }
}
