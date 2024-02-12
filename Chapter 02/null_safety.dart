void main() {
  String? friendName; // This friend might come or might not (null).

  // Uncomment the next line to see Dart saying: "Hey, be careful, friendName could be null!"
  // print(friendName.length);

  // But Dart is smart. If you check first, it's all good.
  if (friendName != null) {
    print('Party jollof rice for ${friendName} is ready!');
  } else {
    print('No party jollof rice because the friend is not confirmed.');
  }

  // Now, no matter if the friend is confirmed or not, your code won't crash due to null issues.
}
