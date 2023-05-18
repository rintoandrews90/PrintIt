
import Foundation

protocol Endpoint: Requestable, CustomStringConvertible {}

extension Endpoint {
    
    var httpMethod: HTTPMethod {
        return .get
    }
    
    var body: Data? {
        return nil
    }
    
    var queryItems: [URLQueryItem]? {
        nil
    }
    
    var headers: [String : String]? {
        return nil
    }
    
    var description: String {
        return """
            httpMetho: \(httpMethod),
            headers: \(String(describing: headers))
        """
    }
}
