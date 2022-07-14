import UIKit

final class TitleWithImage: UIView {
    
    //    MARK: - Typealias
    typealias Font = CoreConstants.FontName
    typealias Color = CoreConstants.Colors
    typealias View = CoreConstants.View
    
    //    MARK: - Life cycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        setImage(UIImage(imageLiteralResourceName: "book"), size: CGSize(width: 18, height: 18))
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //    MARK: - Views
    lazy var imageView: UIImageView = {
        $0.contentMode = .scaleAspectFill
        $0.clipsToBounds = true
        return $0
    }(UIImageView())
    
    lazy var titleLabel: UILabel = {
        $0.font = UIFont(name: Font.bold, size: 20)
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
    
    public func setImage(_ image: UIImage, size: CGSize) {
        imageView.image = image
        imageView.snp.remakeConstraints { make in
            make.centerY.equalToSuperview()
            make.width.equalTo(size.width)
            make.height.equalTo(size.height)
        }
    }
}

//    MARK: - View Code Extension
extension TitleWithImage: ViewCode {
    func buildViewHierarchy() {
        addSubview(horizontalStackView)
        horizontalStackView.addArrangedSubview(imageView)
        horizontalStackView.addArrangedSubview(titleLabel)
    }
    
    func setupConstraints() {
        horizontalStackView.snp.makeConstraints { make in
            make.leading.top.trailing.bottom.equalToSuperview()
        }
    }
    
    func setupAditionalConfiguration() {
        horizontalStackView.setCustomSpacing(View.padding08, after: imageView)
    }
}
