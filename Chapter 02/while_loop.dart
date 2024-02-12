void main() {
  List<double> prices = [
    20.0,
    25.0,
    30.0,
  ]; // Add all your product prices here
  int productNumber = 1;

  while (productNumber <= prices.length && prices[productNumber - 1] <= 50.0) {
    print('Product $productNumber: ${prices[productNumber - 1]}');
    productNumber++;
  }
}
