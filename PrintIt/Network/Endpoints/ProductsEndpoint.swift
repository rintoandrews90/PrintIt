
import Foundation

enum ProductsEndpoint {
    case categories
    case productsByCategoryId(_ : String)
}

extension ProductsEndpoint: Endpoint {
    
    var sessionController: SessionController {
        DefaultSessionController.shared
    }
    
    var queryItems: [URLQueryItem]? {
        switch self {
        case .categories:
            return nil
        case .productsByCategoryId(id: let id):
            return [URLQueryItem(name: "category_id", value: id)]
        }
    }
    
    var serviceName: String {
         "categories"
    }
    
    var path: String {
        switch self {
        case .categories:
            return "/categories"
        case .productsByCategoryId(_):
            return "/products"
        }
    }
    
    var headers: [String : String]? {
        switch self {
        case .categories:
            return nil
        case .productsByCategoryId(gender: _):
            return nil
        }
    }
    
    var httpMethod: HTTPMethod {
        switch self {
        case .categories:
            return .get
        case .productsByCategoryId(_):
            return .get
        }
    }
    
    var body: Data? {
        switch self {
        case .categories:
            return nil
        case .productsByCategoryId(_):
            return nil
        }
    }
}

