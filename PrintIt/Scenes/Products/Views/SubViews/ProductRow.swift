
import SwiftUI

struct ProductRow: View {
    
    let product: Product
    
    var body: some View {
        VStack {
            HStack {
                AsyncImage(url: URL(string: product.image)) { phase in
                    switch phase {
                    case .empty:
                        ProgressView()
                    case .success(let image):
                        image.resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(maxWidth: 100, maxHeight: 100)
                            .cornerRadius(5)
                    case .failure:
                        Image(systemName: "photo")
                    @unknown default:
                        EmptyView()
                    }
                }
                
                VStack(alignment: .leading) {
                    Text(product.title)
                        .padding(.bottom, 5)
                        .font(.headline)
                        .foregroundColor(.black)
                    Text(product.typeName)
                        .foregroundColor(.gray)
                }
                Spacer()
            }
            Divider()
        }
    }
}

struct ProductRow_Previews: PreviewProvider {
    static var previews: some View {
        ProductRow(product: Product(id: 1, mainCategoryID: 2, description: "Text", typeName: "Text", title: "Text", brand: "Text", model: "Text", image: "www.test.com", variantCount: 1))
    }
}
