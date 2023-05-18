
import SwiftUI

struct ProductsListView: View {
    
    let category: Category
    @StateObject private var viewModel: ProductsListViewModel
    
    init(category: Category) {
        self.category = category
        _viewModel = StateObject(wrappedValue: ProductsListViewModel(category: category))
    }
    
    var body: some View {
        ScrollView {
            LazyVStack {
                ForEach(viewModel.products, id: \.self) { product in
                    NavigationLink {
                        ProductDetailView(product: product)
                    } label: {
                        ProductRow(product: product)
                    }
                }
            }
        }
        .task {
            await viewModel.getProducts()
        }
    }
}

struct ProductsListView_Previews: PreviewProvider {
    static var previews: some View {
        ProductsListView(category: Category(id: 1, parentID: 1, imageURL: "www.test.com", catalogPosition: 1, size: .small, title: "Test"))
    }
}
