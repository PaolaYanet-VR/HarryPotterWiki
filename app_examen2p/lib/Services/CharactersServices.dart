import 'dart:convert';
import 'package:app_examen2p/Models/Character.dart';
import 'package:app_examen2p/Models/Spell.dart';
import 'package:http/http.dart' as http;

class CharactersServices {
  Future<List<Character>> getStudentsByHouse(String house) async {
    var url = Uri.parse('http://hp-api.herokuapp.com/api/characters/house/' + house);
    var response = await http.get(url);
    
    final parsed = jsonDecode(response.body).cast<Map<String, dynamic>>();
    List<Character> characters = parsed.map<Character>((json) => Character.fromJson(json)).toList();

    return characters;
  }

  Future<List<Spell>> getSpells() async {
    var url = Uri.parse('https://fedeperin-harry-potter-api-en.herokuapp.com/spells');
    var response = await http.get(url);
    
    final parsed = jsonDecode(response.body).cast<Map<String, dynamic>>();
    List<Spell> spells = parsed.map<Spell>((json) => Spell.fromJson(json)).toList();

    return spells;
  }
}