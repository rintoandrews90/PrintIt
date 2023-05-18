
import Foundation

class ProductDetailViewModel: ObservableObject {
    
    @Published var product: Product
    
    init(product: Product) {
        self.product = product
    }
}
