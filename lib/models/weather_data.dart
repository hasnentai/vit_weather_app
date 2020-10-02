class WeatherData{
  int id;
  String main;
  String desc;

  WeatherData({this.id,this.main,this.desc});

  WeatherData.fromJson(Map<String,dynamic> json){
    id = json['id'];
    main = json['main'];
    desc = json["description"];
  }
}


