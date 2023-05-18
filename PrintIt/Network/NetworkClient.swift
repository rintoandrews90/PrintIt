
import Foundation
import Alamofire

protocol NetworkManager: RequestInterceptor {
    func request<T: Decodable>(endpoint: Requestable, reponse: T.Type) async -> Result<T, RequestError>
}

extension NetworkManager {
    
    func request<T: Decodable>(endpoint: Requestable, reponse: T.Type) async -> Result<T, RequestError> {
        do {
            let urlRequest = try endpoint.urlRequest()
            let dataTask = AF.request(urlRequest).serializingDecodable(T.self)
            
            let response = await dataTask.result
            switch response {
            case .success(let success):
                return .success(success)
            case .failure(_):
                return .failure(.noResponse)
            }
        } catch {
            return .failure(.unknownError)
        }
    }
}
