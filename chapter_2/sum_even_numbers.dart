// Function to find the sum of even numbers from 1 to 10
int sumOfEvenNumbers() {
  // Initialize a variable to hold the sum
  int sum = 0;

  // Use a for loop to iterate through numbers from 1 to 10
  for (int i = 1; i <= 10; i++) {
    // Check if the number is even
    if (i % 2 == 0) {
      // If it's even, add it to the sum
      sum += i;
    }
  }

  // Return the final sum
  return sum;
}

void main() {
  // Call the function to find the sum of even numbers from 1 to 10
  int sum = sumOfEvenNumbers();

  // Display the result
  print('The sum of even numbers from 1 to 10 is: $sum');
}
