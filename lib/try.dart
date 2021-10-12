import 'dart:async';

void main() async {
  var x = await four();
  print('hello');

  print(x);
}

Future<int> four() async {
  Future.delayed(const Duration(milliseconds: 5000), () {
    setState() {
      print('Delay');
    }
  });
  return 4;
}
