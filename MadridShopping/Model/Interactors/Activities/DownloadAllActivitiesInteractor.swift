import Foundation

protocol DownloadAllActivitiesInteractor {
    func execute(onSuccess: @escaping (Activities) -> Void, onError: errorClosure)
    func execute(onSuccess: @escaping (Activities) -> Void)
}

