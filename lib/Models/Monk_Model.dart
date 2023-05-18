class Monk {
  String NameEng;
  String NameHindi;
  String NameGujrati;
  String Image;
  List Dohe;
  List Gist;

  Monk({
    required this.NameEng,
    required this.NameHindi,
    required this.NameGujrati,
    required this.Image,
    required this.Dohe,
    required this.Gist,
  });

  factory Monk.formMap({required Map data}) {
    return Monk(
      NameEng: data['NameEng'],
      NameHindi: data['NameHindi'],
      NameGujrati: data['NameGujrati'],
      Image: data['Image'],
      Dohe: data['Dohe'],
      Gist: data['Gist'],
    );
  }
}
