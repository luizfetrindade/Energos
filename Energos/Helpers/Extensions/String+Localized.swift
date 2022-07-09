import Foundation

extension String {

  var localized: String {
    return NSLocalizedString(self, comment: "\(self)_comment")
  }
  
    func localized(_ arguments: CVarArg...) -> String {
        withVaList(arguments) {
            NSString(format: localized, arguments: $0)
        } as String
    }
}
