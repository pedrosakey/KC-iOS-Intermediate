import Foundation

protocol ExecuteOnceInteractor {
    func execute(id: String, closure: () -> Void)
}
