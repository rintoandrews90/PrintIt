
import Foundation

protocol ProductServiceable {
    func getProducts(with categoryId: String) async -> Result<Products, RequestError>
}

struct ProductService: NetworkManager, ProductServiceable {
    
    func getProducts(with categoryId: String) async -> Result<Products, RequestError> {
        return await request(endpoint: ProductsEndpoint.productsByCategoryId(categoryId), reponse: Products.self)
    }
}
