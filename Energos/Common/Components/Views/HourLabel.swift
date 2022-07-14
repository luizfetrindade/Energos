import UIKit

final class HourLabel: UIView {
    
    //    MARK: - Typealias
    typealias Font = CoreConstants.FontName
    typealias Color = CoreConstants.Colors
    typealias View = CoreConstants.View
    
    //    MARK: - Life cycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //    MARK: - Views
    lazy var imageView: UIImageView = {
        $0.image = UIImage(imageLiteralResourceName: "clock")
        $0.contentMode = .scaleAspectFill
        $0.clipsToBounds = true
        return $0
    }(UIImageView())
    
    lazy var titleLabel: UILabel = {
        $0.text = "24:00"
        $0.font = UIFont(name: Font.regular, size: 20)
        $0.textAlignment = .left
        $0.textColor = Color.lightGray
        return $0
    }(UILabel())
    
    lazy var horizontalStackView: UIStackView = {
        $0.alignment = .leading
        $0.axis = .horizontal
        $0.distribution = .fill
        return $0
    }(UIStackView())
    
//    MARK: - Methods
    public func setTitle(_ title: String) {
        titleLabel.text = title
    }
}

//    MARK: - View Code Extension
extension HourLabel: ViewCode {
    func buildViewHierarchy() {
        addSubview(horizontalStackView)
        horizontalStackView.addArrangedSubview(imageView)
        horizontalStackView.addArrangedSubview(titleLabel)
    }
    
    func setupConstraints() {
        horizontalStackView.snp.makeConstraints { make in
            make.leading.top.bottom.trailing.equalToSuperview()
        }
        
        imageView.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview().inset(View.padding08)
            make.width.equalTo(View.padding16)
            make.height.equalTo(View.padding16)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.bottom.equalToSuperview().offset(-5)
        }
    }
    
    func setupAditionalConfiguration() {
        horizontalStackView.setCustomSpacing(View.padding08, after: imageView)
    }
}
