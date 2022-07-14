import UIKit

final class RoutineDataCell: UITableViewCell {
    
//    MARK: - Typealias
    typealias Font = CoreConstants.FontName
    typealias Color = CoreConstants.Colors
    typealias View = CoreConstants.View

// MARK: - Views
    
    lazy var titleWithImage = TitleWithImage()
    lazy var hourLabel = HourLabel()
    
//    TODO: remove this
    let mockLabel: UILabel = {
        $0.textColor = Color.lightRed
        $0.text = "S"
        return $0
    }(UILabel())
    
    lazy var daysOfTheWeekIconStack: UIStackView = {
        $0.axis = .horizontal
        $0.distribution = .fill
        $0.alignment = .leading
        $0.addArrangedSubview(mockLabel)
        return $0
    }(UIStackView())
    
    let containerView: UIView = {
        return $0
    }(UIView())
    
    lazy var verticalStack: UIStackView = {
        $0.distribution = .fill
        $0.axis = .vertical
        return $0
    }(UIStackView())
    
// MARK: - Static Properties
        
    static let identifier = "RoutineDataCell"

// MARK: - Inicialization
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = .clear
        selectionStyle = .none
        self.setupView()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//MARK: - View Code Extension
extension RoutineDataCell: ViewCode {
    func buildViewHierarchy() {
        
        roundView.addSubview(mockLabel)
        
        addSubview(verticalStack)
        verticalStack.addArrangedSubview(titleWithImage)
        verticalStack.addArrangedSubview(daysOfTheWeekIconStack)
        verticalStack.addArrangedSubview(hourLabel)
    }
    
    func setupConstraints() {
        
        roundView.snp.makeConstraints { make in
            make.height.width.equalTo(15)
        }
        verticalStack.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(View.padding16)
            make.top.bottom.equalToSuperview().inset(View.padding16)
        }
    }
    
    func setupAditionalConfiguration() {
        verticalStack.setCustomSpacing(View.padding16, after: titleWithImage)
        verticalStack.setCustomSpacing(View.padding08, after: daysOfTheWeekIconStack)
    }
}
