// Data class to keep the string and have an abbreviation function

class Grocery {
  const Grocery({required this.name, required this.price});

  final String name;

  final double price;

  String abbrev() {
    return name.substring(0, 1);
  }
}
