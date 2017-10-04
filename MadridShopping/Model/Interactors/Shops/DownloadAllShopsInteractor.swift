import Foundation

protocol DownloadAllShopsInteractor {
    func execute(onSuccess: @escaping (Shops) -> Void, onError: errorClosure)
    func execute(onSuccess: @escaping (Shops) -> Void)
}
