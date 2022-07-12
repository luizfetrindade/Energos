import UIKit
import SnapKit

public class HeaderWithUpperDescription: UIView {
    
    // MARK: - Layout components
    
    var title: String?
    var details: String?
    
    lazy var detailsLabel: UILabel = {
        $0.text = details
        $0.font = UIFont(name: Constants.FontName.black, size: 18)
        $0.textAlignment = .left
        $0.textColor = Constants.Colors.lightGray
        return $0
    }(UILabel())
    
    lazy var titleLabel: UILabel = {
        $0.text = title
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
    
    public init(title: String, details: String) {
        super.init(frame: .zero)
        self.title = title
        self.details = details
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Date Header
extension HeaderWithUpperDescription: ViewCode {
    public func buildViewHierarchy() {
        addSubview(stackViewVertical)
        stackViewVertical.addArrangedSubview(detailsLabel)
        stackViewVertical.addArrangedSubview(titleLabel)
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
        stackViewVertical.setCustomSpacing(Constants.View.padding04, after: detailsLabel)
        stackViewVertical.setCustomSpacing(Constants.View.padding04, after: titleLabel)
    }
}
