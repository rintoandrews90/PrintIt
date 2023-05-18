
import Foundation

class CategoriesListViewModel: ObservableObject {
    
    let repository: CategoryRepository
    @Published var categories = [Category]()
    @Published private(set) var state = State.idle

    init(with repository: CategoryRepository = CategoryRepository(apiClient: CategoryService())) {
        self.repository = repository
    }
    
    @MainActor
    func getCategories() async {
        state = .loading
        let result = await repository.getUser()
        switch result {
        case .success(let categories):
            self.categories = categories.result.categories
            state = .loaded
            print(self.categories)
        case .failure(let failure):
            print(failure.localizedDescription)
            state = .failed(failure)
        }
    }
    
}
