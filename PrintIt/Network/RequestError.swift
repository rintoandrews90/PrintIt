
import Foundation

enum RequestError: Error, CustomStringConvertible {
    
    case invalidURL
    case invalidRequest
    case unknownError
    case notInternet
    case cannotConnectToHost
    case serverErrorToIgnore
    case unexpectedResponse(code: Int)
    case noResponse
    case faildToPraseJSON
    
    var description: String {
        switch self {
        case .invalidURL:
            return "Unable to create Url"
        case .invalidRequest:
            return "Unable to create request"
        case .unknownError:
            return "Unknown network error occoured"
        case .notInternet:
            return "No internet connection"
        case .cannotConnectToHost:
            return "Can not connect to host address"
        case .serverErrorToIgnore:
            return "Server can be ignored"
        case .unexpectedResponse(code: let code):
            return "Unexptected response code\(code)"
        case .noResponse:
            return "No response"
        case .faildToPraseJSON:
            return "JSON parsing error"
        }
    }
    
}
