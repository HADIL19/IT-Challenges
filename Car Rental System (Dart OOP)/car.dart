void main() {
  final rentalSystem = RentalSystem();

  rentalSystem.addCar("Porshe 911");
  rentalSystem.addCar("SLS AMG " );
  rentalSystem.addCar("ferrarri 458");

  print("Initial Inventory:");
  rentalSystem.displayCars();


  print("\nRenting ferrarri 458:");
  if (rentalSystem.rentCar("ferrarri 458")) {
    print("Successfully rented ferrarri 458");
  }

  // Display updated inventory
  print("\nUpdated Inventory:");
  rentalSystem.displayCars();

  // Return the car
  print("\nReturning ferrarri 458:");
  if (rentalSystem.returnCar("ferrarri 458")) {
    print("Successfully returned ferrarri 458");
  }

  print("\nFinal Inventory:");
  rentalSystem.displayCars();
}

class Car {
  final String model;
  bool isAvailable;

  Car(this.model) : isAvailable = true;

  void rentCar() {
    isAvailable = false;
  }

  void returnCar() {
    isAvailable = true;
  }
}

class RentalSystem {
  final List<Car> cars = [];

  void addCar(String model) {
    cars.add(Car(model));
  }

  bool rentCar(String model) {
    try {
      final car = cars.firstWhere(
        (car) => car.model == model && car.isAvailable,
      );
      car.rentCar();
      return true;
    } catch (e) {
      return false;
    }
  }

  bool returnCar(String model) {
    try {
      final car = cars.firstWhere(
        (car) => car.model == model && !car.isAvailable,
      );
      car.returnCar();
      return true;
    } catch (e) {
      return false;
    }
  }

  void displayCars() {
    if (cars.isEmpty) {
      print("No cars in the inventory.");
      return;
    }

    for (final car in cars) {
      print("${car.model} - ${car.isAvailable ? 'Available' : 'Rented'}");
    }
  }
}
