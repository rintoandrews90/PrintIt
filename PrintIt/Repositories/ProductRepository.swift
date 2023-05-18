//
//  ProductRepository.swift
//  PrintIt
//
//  Created by Rinto Andrews on 18/05/23.
//

import Foundation

struct ProductRepository {
    
    var apiClient: ProductServiceable
    
    init(apiClient: ProductServiceable) {
        self.apiClient = apiClient
    }
    
    func getProducts(with categoryId: String) async -> Result<Products, RequestError> {
        await apiClient.getProducts(with: categoryId)
    }
}
