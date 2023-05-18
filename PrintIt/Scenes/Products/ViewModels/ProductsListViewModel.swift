
import Foundation

class ProductsListViewModel: ObservableObject {
    
    let category: Category
    let repository: ProductRepository
    @Published var products = [Product]()
    @Published private(set) var state = State.idle

    init(category: Category, repository: ProductRepository = ProductRepository(apiClient: ProductService())) {
        self.repository = repository
        self.category = category
    }
    
    @MainActor
    func getProducts() async {
        state = .loading
        let result = await repository.getProducts(with: "\(category.id)")
        switch result {
        case .success(let products):
            self.products = products.result
            self.state = .loaded
            print(self.products)
        case .failure(let failure):
            print(failure.localizedDescription)
            self.state = .failed(failure)
        }
    }
    
}
