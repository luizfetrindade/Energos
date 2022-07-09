import UIKit

class RoutineScreen: UIView {

  // MARK: Private Properties

  weak var delegate: RoutineScreenDelegate?

  // MARK: Views

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
  }

  func setupConstraints() {
  }

  func setupAditionalConfiguration() {
  }

}
