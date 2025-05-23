bool isPrime(int number) {
  if (number <= 1) return false;
  for (int i = 2; i <= sqrt(number); i++) {
    if (number % i == 0) return false;
  }
  return true;
}

int sumEvenNumbers(List<int> numbers) {
  return numbers.where((number) => number.isEven).reduce((a, b) => a + b);
}

String greetUser(String name, [String greeting = "Hello"]) {
  return "$greeting, $name!";
}

int findMax(List<int> numbers) {
  if (numbers.isEmpty) {
    throw ArgumentError("The list cannot be empty.");
  }
  return numbers.reduce((a, b) => a > b ? a : b);
}
void main() {
  print(isPrime(2)); // true
  print(isPrime(4)); // false
  print(isPrime(17)); // true
  print(isPrime(20)); // false
}

