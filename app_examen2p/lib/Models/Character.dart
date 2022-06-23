
Character actualStudent = Character();

class Character {
  String? name;
  String? species;
  String? gender;
  String? house;
  String? dateOfBirth;
  String? ancestry;
  String? patronus;
  String? image;

  Character({
     this.name = "",
     this.species = "",
     this.gender = "",
     this.house = "",
     this.dateOfBirth = "",
     this.ancestry = "",
     this.patronus = "",
    this.image = ""
  });

  Character.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    species = json['species'];
    gender = json['gender'];
    house = json['house'];
    dateOfBirth = json['dateOfBirth'];
    ancestry = json['ancestry'];
    patronus = json['patronus'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['species'] = species;
    data['gender'] = gender;
    data['house'] = house;
    data['dateOfBirth'] = dateOfBirth;
    data['ancestry'] = ancestry;
    data['patronus'] = patronus;
    data['image'] = image;
    return data;
  }

  String? get imageUrl => image?.replaceAll("http", "https");
  
}

String getInfo(String? str) {
    if (str == null) {
      return "";
    }
    else {
      return str;
    }
  }

String getHouse(String? str) {
  if (str != null) {
    switch (str) {
      case 'Gryffindor':
        return 'https://clipground.com/images/gryffindor-png-6.png';
      case 'Slytherin':
        return 'https://i.pinimg.com/originals/68/d6/f8/68d6f87a5c531d04cee8fba4885c0bff.png';
      case 'Ravenclaw':
        return 'https://th.bing.com/th/id/R.7d2ce628f28695cc9f45d4fa82ed9dd5?rik=M%2bFpDzOsGD7uiQ&pid=ImgRaw&r=0';
      default:
        return 'https://th.bing.com/th/id/R.2395af04386f4dc09b75805e52dfac6d?rik=jd6iIiuXzwHEAw&pid=ImgRaw&r=0';
    }
  }
  return '';
}