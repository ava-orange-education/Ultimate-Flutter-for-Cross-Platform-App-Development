// Function to greet a person
void greetPerson(String name) {
  print('Hello, $name! How are you today?');
}

// Function to calculate the sum of two numbers
int calculateSum(int a, int b) {
  return a + b;
}

void main() {
  // Calling the greetPerson function
  greetPerson('John');

  // Calling the calculateSum function and storing the result in a variable
  int result = calculateSum(10, 20);
  print('The sum is: $result');
}
