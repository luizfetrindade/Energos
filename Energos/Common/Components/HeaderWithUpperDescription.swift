import UIKit
import SnapKit

public class HeaderWithUpperDescription: UIView {
    
//    MARK: - Typealias
    
    typealias Font = Constants.FontName
    typealias Color = Constants.Colors
    typealias View = Constants.View
    
    // MARK: - Layout components
    
    lazy var detailsLabel: UILabel = {
        $0.text = details
        $0.font = UIFont(name: Font.regular, size: 18)
        $0.textAlignment = .left
        $0.textColor = Color.lightGray
        return $0
    }(UILabel())
    
    lazy var titleLabel: UILabel = {
        $0.text = title
        $0.font = UIFont(name: Font.medium, size: 45)
        $0.textAlignment = .left
        $0.textColor = Color.lightGray
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
        $0.backgroundColor = Color.lightGray
        return $0
    }(UIView())
    
//    MARK: - Variables
    
    var title: String?
    var details: String?
    
    // MARK: - Life Cycle
    
    public init(title: String, details: String) {
        super.init(frame: .zero)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func setupTextLabel() {
        titleLabel.text = title
        detailsLabel.text = details
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
            make.trailing.bottom.leading.top.equalToSuperview().inset(View.padding16)
        }
        
        lineView.snp.makeConstraints { make in
            make.height.equalTo(1)
            make.leading.trailing.equalToSuperview().inset(View.padding08)
            make.top.equalTo(stackViewVertical.snp.bottom).offset(View.padding16)
        }
    }
    
    public func setupAditionalConfiguration() {
        stackViewVertical.setCustomSpacing(View.padding04, after: detailsLabel)
        stackViewVertical.setCustomSpacing(View.padding04, after: titleLabel)
    }
}
