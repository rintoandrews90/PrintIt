
import Foundation
import Alamofire

protocol SessionController {
    var session: Session { get }
    func serviceURL(for serviceName: String) -> String
}

extension URLSessionConfiguration {
    
    static var defaultConfig: URLSessionConfiguration {
        let config = URLSessionConfiguration.default
        config.httpAdditionalHeaders = HTTPHeaders.default.dictionary
        config.httpMaximumConnectionsPerHost = 8
        config.timeoutIntervalForRequest = 60
        return config
    }
}

class DefaultSessionController: SessionController {
    
    static let shared = DefaultSessionController()
    var session: Session
    
    init() {
        session = Session(configuration: .defaultConfig)
    }
    
    func serviceURL(for serviceName: String) -> String {
        return "https://api.printful.com/"
    }
}
