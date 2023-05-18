
import Foundation

class CategoriesListViewModel: ObservableObject {
    
    let repository: CategoryRepository
    @Published var categories = [Category]()

    init(with repository: CategoryRepository = CategoryRepository(apiClient: CategoryService())) {
        self.repository = repository
    }
    
    @MainActor
    func getCategories() async {
        let result = await repository.getUser()
        switch result {
        case .success(let categories):
            self.categories = categories.result.categories
            print(self.categories)
        case .failure(let failure):
            print(failure.localizedDescription)
        }
    }
    
}
