//
//  ProductsListViewModel.swift
//  PrintIt
//
//  Created by Rinto Andrews on 18/05/23.
//

import Foundation

class ProductsListViewModel: ObservableObject {
    
    let category: Category
    let repository: ProductRepository
    @Published var products = [Product]()

    init(category: Category, repository: ProductRepository = ProductRepository(apiClient: ProductService())) {
        self.repository = repository
        self.category = category
    }
    
    @MainActor
    func getProducts() async {
        let result = await repository.getProducts(with: "\(category.id)")
        switch result {
        case .success(let products):
            self.products = products.result
            print(self.products)
        case .failure(let failure):
            print(failure.localizedDescription)
        }
    }
    
}
