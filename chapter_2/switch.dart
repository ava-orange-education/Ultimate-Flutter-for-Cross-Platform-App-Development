void main() {
  String grade = 'A';

  switch (grade) {
    case 'A':
      print('Excellent!');
      break;
    case 'B':
      print('Good!');
      break;
    case 'C':
      print('Average.');
      break;
    case 'D':
      print('Poor.');
      break;
    default:
      print('Invalid grade.');
  }
}
