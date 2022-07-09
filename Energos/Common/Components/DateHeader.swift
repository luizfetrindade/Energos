import UIKit
import SnapKit

public class DateHeader: UIView {
    
    // MARK: - Layout components
    
    lazy var monthYearLabel: UILabel = {
        let shortMonth = Date().toString(format: Constants.DateFormat.monthNameShort)
        let year = Date().toString(format: Constants.DateFormat.yearAsNumber)
        $0.text = "\(shortMonth) \(year)"
        $0.font = UIFont(name: Constants.FontName.black, size: 18)
        $0.textAlignment = .left
        $0.textColor = Constants.Colors.lightGray
        return $0
    }(UILabel())
    
    lazy var dayLabel: UILabel = {
        let day = Date().toString(format: Constants.DateFormat.dayAsNumber)
        let dayName = Date().toString(format: Constants.DateFormat.dayOfTheWeekAbreviated)
        $0.text = "\(day).\(dayName)"
        $0.font = UIFont(name: Constants.FontName.black, size: 40)
        $0.textAlignment = .left
        $0.textColor = Constants.Colors.lightGray
        return $0
    }(UILabel())
    
    lazy var stackViewVertical: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .leading
        stackView.distribution = .fill
        return stackView
    }()
    
    lazy var lineView: UIView = {
        $0.backgroundColor = Constants.Colors.lightGray
        return $0
    }(UIView())
    
    // MARK: - Life Cycle
    
    public init() {
        super.init(frame: .zero)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension DateHeader: ViewCode {
    public func buildViewHierarchy() {
        addSubview(stackViewVertical)
        stackViewVertical.addArrangedSubview(monthYearLabel)
        stackViewVertical.addArrangedSubview(dayLabel)
//        stackViewVertical.addArrangedSubview(lineView)
        addSubview(lineView)
    }
    
    public func setupConstraints() {
        stackViewVertical.snp.makeConstraints { make in
            make.trailing.bottom.leading.top.equalToSuperview().inset(Constants.View.padding16)
        }
        
        lineView.snp.makeConstraints { make in
            make.height.equalTo(1)
            make.leading.trailing.equalToSuperview().inset(Constants.View.padding08)
            make.top.equalTo(stackViewVertical.snp.bottom).offset(Constants.View.padding16)
        }
    }
    
    public func setupAditionalConfiguration() {
        stackViewVertical.setCustomSpacing(Constants.View.padding04, after: monthYearLabel)
        stackViewVertical.setCustomSpacing(Constants.View.padding04, after: dayLabel)
    }
}
