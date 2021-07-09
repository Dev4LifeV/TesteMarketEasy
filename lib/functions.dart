DateTime formattedDateNow() {
  DateTime now = DateTime.now();
  final updatedDt = now.toLocal(); //DateTime.parse(newFormat).toLocal();

  return updatedDt;
}

DateTime formatDate(String date) {
  List<String> dM = date.split('/');
  String y = dM[2].substring(0, 4);

  List<String> hMS = date.split(':');
  List<String> h = hMS[0].split(' ');

  int day = int.parse(dM[0]);
  int month = int.parse(dM[1]);
  int year = int.parse(y);

  int hour = int.parse(h[1]);
  int minute = int.parse(hMS[1]);
  int second = int.parse(hMS[2]);

  final DateTime dateTime =
      DateTime(year, month, day, hour, minute, second).toLocal();

  return dateTime;
}
