import 'dart:io';

// Define an interface
abstract class Shape {
  double area();
}

// Define a class Rectangle that implements the Shape interface
class Rectangle implements Shape {
  double width;
  double height;

  Rectangle(this.width, this.height);

  @override
  double area() {
    return width * height;
  }
}

// Define a class Square that inherits from Rectangle
class Square extends Rectangle {
  Square(double sideLength) : super(sideLength, sideLength);

  // Override the area method to calculate the area of a square
  @override
  double area() {
    return width * width;
  }
}

// Method to read data from a file and initialize instances of Square class
List<Square> readSquaresFromFile(String filename) {
  final squares = <Square>[];
  final file = File(filename);

  file.readAsLinesSync().forEach((line) {
    final sideLength = double.parse(line.trim());
    squares.add(Square(sideLength));
  });

  return squares;
}

// Method that demonstrates the use of a loop
void printAreas(List<Shape> shapes) {
  for (var shape in shapes) {
    print("Area: ${shape.area()}");
  }
}

// Main method
void main() {
  try {
    // Initialize instances of Square class from data in a file
    final squares = readSquaresFromFile('squares.txt');

    // Demonstrate the use of a loop to print areas of squares
    printAreas(squares);
  } catch (e) {
    print('Error: $e');
  }
}
