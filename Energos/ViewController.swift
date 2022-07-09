import UIKit
import SnapKit

class ViewController: UIViewController {

    lazy var box = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
}

extension ViewController: ViewCode {
    func buildViewHierarchy() {
        self.view.addSubview(box)
    }
    
    func setupConstraints() {
        box.snp.makeConstraints { (make) -> Void in
           make.width.height.equalTo(50)
           make.center.equalTo(self.view)
        }
    }
    
    func setupAditionalConfiguration() {
        box.backgroundColor = .green
    }
}
