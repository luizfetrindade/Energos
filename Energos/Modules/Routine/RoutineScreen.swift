import UIKit
import SnapKit

class RoutineScreen: UIView {
    
// MARK: Private Properties
    
    weak var delegate: RoutineScreenDelegate?
    
// MARK: Views
    
    lazy var text2: UILabel = {
        $0.text = "localized.sample".localized
        $0.font = UIFont(name: Constants.FontName.bold, size: 30)
        $0.textAlignment = .center
        $0.textColor = Constants.Colors.lightRed
        return $0
    }(UILabel())
    
    lazy var text: UILabel = {
        let day = Date().toString(format: Constants.DateFormat.dayAsNumber)
        let dayName = Date().toString(format: Constants.DateFormat.dayOfTheWeekAbreviated)
        $0.text = "\(day).\(dayName)"
        $0.font = UIFont(name: Constants.FontName.black, size: 40)
        $0.textAlignment = .center
        $0.textColor = Constants.Colors.lightGray
        return $0
    }(UILabel())
    
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
        addSubview(text)
    }
    
    func setupConstraints() {
        text.snp.makeConstraints { (make) -> Void in
            make.width.height.equalTo(200)
            make.center.equalToSuperview()
        }
    }
    
    func setupAditionalConfiguration() {
        backgroundColor = Constants.Colors.darkGray
    }
}
