import UIKit
import SnapKit

class ViewController: UIViewController {

    lazy var box = UIView()
    
    lazy var text: UILabel = {
        $0.text = "localized.sample".localized
        $0.font = UIFont(name: "PlayfairDisplay-Medium", size: 16)
        return $0
    }(UILabel())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
}

extension ViewController: ViewCode {
    func buildViewHierarchy() {
        self.view.addSubview(text)
    }
    
    func setupConstraints() {
        text.snp.makeConstraints { (make) -> Void in
           make.width.height.equalTo(200)
           make.center.equalTo(self.view)
        }
    }
}
