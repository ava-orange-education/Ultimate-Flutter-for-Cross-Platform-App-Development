// Define a Car class
class Car {
  late String color;
  late String model;
  late int speed;

  // Method to accelerate the car
  void accelerate() {
    speed += 10;
    print('The car is now traveling at $speed km/h.');
  }

  // Method to brake the car
  void brake() {
    speed -= 5;
    print('The car is now traveling at $speed km/h.');
  }
}

void main() {
  // Create an instance of the Car class
  Car myCar = Car();
  myCar.color = 'Red';
  myCar.model = 'Sedan';
  myCar.speed = 60;

  // Call methods on the car instance
  myCar.accelerate(); // Output: The car is now traveling at 70 km/h.
  myCar.brake(); // Output: The car is now traveling at 65 km/h.
}
