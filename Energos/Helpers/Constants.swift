import UIKit

public enum Constants {
    
    enum FontName {
        static let black = "PlayfairDisplay-Black"
        static let bold = "PlayfairDisplay-Bold"
        static let extraBold = "PlayfairDisplay-ExtraBold"
        static let medium = "PlayfairDisplay-Medium"
        static let regular = "PlayfairDisplay-Regular"
        static let semiBold = "PlayfairDisplay-SemiBold"
    }
    
    public enum Colors {
        static let darkBlue = UIColor(named: "darkBlue")
        static let lightBlue = UIColor(named: "lightBlue")
        static let darkGreen = UIColor(named: "darkGreen")
        static let lightGreen = UIColor(named: "lightGreen")
        static let darkOrange = UIColor(named: "darkOrange")
        static let lightOrange = UIColor(named: "lightOrange")
        static let darkRed = UIColor(named: "darkRed")
        static let lightRed = UIColor(named: "lightRed")
        static let darkGray = UIColor(named: "darkGray")
        static let mediumGray = UIColor(named: "mediumGray")
        static let lightGray = UIColor(named: "lightGray")
    }
    
    public enum DateFormat {
        static let timeIn24Hours = "HH:mm"
        static let dateAsCalendar = "dd/MM/yyyy"
        static let dateFull = "dd/MM/yyyy HH:mm"
        static let dayAsNumber = "dd"
        static let yearAsNumber = "YYYY"
        static let dayOfTheWeekAbreviated = "EEE"
        static let dayOfTheWeekFull = "EEEE"
        static let monthNameFull = "LLLL"
        static let monthNameShort = "LLL"
    }
    
    public enum View {
        public static let padding00: CGFloat = 00
        public static let padding04: CGFloat = 04
        public static let padding08: CGFloat = 08
        public static let padding12: CGFloat = 12
        public static let padding16: CGFloat = 16
        public static let padding24: CGFloat = 24
        public static let padding32: CGFloat = 32
        public static let padding40: CGFloat = 40
        public static let padding64: CGFloat = 64
        public static let padding86: CGFloat = 86
        public static let bottomAnchor: CGFloat = -180
    }
}
