//
//  ProductDetailViewModel.swift
//  PrintIt
//
//  Created by Rinto Andrews on 18/05/23.
//

import Foundation

class ProductDetailViewModel: ObservableObject {
    
    @Published var product: Product
    
    init(product: Product) {
        self.product = product
    }
}
