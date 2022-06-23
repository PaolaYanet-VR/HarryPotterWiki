Spell actualSpell = Spell();

class Spell {
  String? spell;
  String? use;

  Spell({
     this.spell,
     this.use,
  });

  Spell.fromJson(Map<String, dynamic> json) {
    spell = json['spell'];
    use = json['use'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['spell'] = spell;
    data['use'] = use;
    return data;
  }
  
}