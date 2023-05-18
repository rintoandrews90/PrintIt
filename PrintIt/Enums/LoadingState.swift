
import Foundation

enum State {
    case idle
    case loading
    case failed(Error)
    case loaded
}
