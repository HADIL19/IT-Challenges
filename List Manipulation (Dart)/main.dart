class ProcessResult {
  final int oddSum;
  final List<int> squaredEvens;
  
  ProcessResult(this.oddSum, this.squaredEvens);
  
  @override
  String toString() => 'ProcessResult(oddSum: $oddSum, squaredEvens: $squaredEvens)';
}

ProcessResult processList(List<int> numbers) {
  
  int oddSum = 0;

  List<int?> processed = numbers.map((number) {
    if (number % 2 == 0) {
     
      return number * number;
    } else {
      
      oddSum += number;
      return null;
    }
  }).toList();
  
  List<int> squaredEvens = processed.whereType<int>().toList();
  
  return ProcessResult(oddSum, squaredEvens);
}

void main() {
  List<int> numbers = [5, 15, 3, 8, 11, 99];
  ProcessResult result = processList(numbers);
  print(result); 
}


