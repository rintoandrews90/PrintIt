
import SwiftUI

struct ProductDetailView: View {
    
    let product: Product
    @StateObject var viewModel: ProductDetailViewModel
    
    init(product: Product) {
        self.product = product
        _viewModel = StateObject(wrappedValue: ProductDetailViewModel(product: product))
    }
    
    var body: some View {
        ScrollView {
            VStack {
                HStack(alignment: .top) {
                    AsyncImage(url: URL(string: product.image)) { phase in
                        switch phase {
                        case .empty:
                            ProgressView()
                        case .success(let image):
                            image.resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(maxWidth: 200, maxHeight: 200)
                                .cornerRadius(5)
                        case .failure:
                            Image(systemName: "photo")
                        @unknown default:
                            EmptyView()
                        }
                    }
                    VStack(alignment: .leading) {
                        Text(product.title)
                            .font(.headline)
                        Divider()
                        Text(product.typeName)
                            .font(.subheadline)
                        Text(product.brand ?? "Custom Brand")
                            .font(.subheadline)
                    }
                    Spacer()
                }
                Text(product.description)
            }
            .padding()
        }
    }
}

