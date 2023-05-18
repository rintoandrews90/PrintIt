
import Foundation

struct CategoryRepository {
    
    var apiClient: CategoryServiceable
    
    init(apiClient: CategoryServiceable) {
        self.apiClient = apiClient
    }
    
    func getUser() async -> Result<CateoryList, RequestError> {
        await apiClient.getCategories()
    }
}
