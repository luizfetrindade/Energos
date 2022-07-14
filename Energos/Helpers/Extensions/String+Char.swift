import Foundation
import UIKit

extension String {
    
    var firstChar: String {
        String(self.prefix(1)).uppercased()
    }
}
