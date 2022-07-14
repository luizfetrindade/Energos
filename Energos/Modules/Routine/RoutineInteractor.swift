import Foundation

class RoutineInteractor {
    
    // MARK:  Typealias
    
    typealias DateFormatter = CalendarConstants.DateFormat
    
    // MARK: Private Properties
    
    weak var output: RoutineInteractorOutputProtocol?
    
    // MARK:  Private Methods
    
    private func getTitle() -> String {
        "\(Date().toString(format: DateFormatter.dayAsNumber)).\(Date().toString(format: DateFormatter.dayOfTheWeekAbreviated))"
    }
    
    private func getDescription() -> String {
        "\(Date().toString(format: DateFormatter.monthNameShort)) \(Date().toString(format: DateFormatter.yearAsNumber))"
    }
}

// MARK: - Methods of RoutineInteractorProtocol

extension RoutineInteractor: RoutineInteractorProtocol {
    
    func getCalendarData() {
        let description = getDescription()
        let title = getTitle()
        
        output?.didGetCalendarData(title: "\(title)", description: "\(description)")
    }
}
