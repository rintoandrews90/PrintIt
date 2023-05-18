
import Foundation

protocol CategoryServiceable {
    
    func getCategories() async -> Result<CateoryList, RequestError>
}

struct CategoryService: NetworkManager, CategoryServiceable {
    
    func getCategories() async -> Result<CateoryList, RequestError> {
        return await request(endpoint: ProductsEndpoint.categories, reponse: CateoryList.self)
    }
}
