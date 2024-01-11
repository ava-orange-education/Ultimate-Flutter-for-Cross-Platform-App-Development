void main() {
  List<String> products = [
    'Product A',
    'Product B',
    'Product C'
  ]; // Add all your product names here

  for (int i = 0; i < products.length; i++) {
    print('Product ${i + 1}: ${products[i]}');
  }
}
