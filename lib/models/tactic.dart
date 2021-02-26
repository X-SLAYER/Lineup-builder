class Tactic {
  PlayerFieldPostion gK;
  PlayerFieldPostion dF1;
  PlayerFieldPostion dF2;
  PlayerFieldPostion rB;
  PlayerFieldPostion lB;
  PlayerFieldPostion mG;
  PlayerFieldPostion mC;
  PlayerFieldPostion mD;
  PlayerFieldPostion aG;
  PlayerFieldPostion bU;
  PlayerFieldPostion aD;

  Tactic(
      {this.gK,
      this.dF1,
      this.dF2,
      this.rB,
      this.lB,
      this.mG,
      this.mC,
      this.mD,
      this.aG,
      this.bU,
      this.aD});

  Tactic.fromJson(Map<String, dynamic> json) {
    gK =
        json['GK'] != null ? new PlayerFieldPostion.fromJson(json['GK']) : null;
    dF1 = json['DF1'] != null
        ? new PlayerFieldPostion.fromJson(json['DF1'])
        : null;
    dF2 = json['DF2'] != null
        ? new PlayerFieldPostion.fromJson(json['DF2'])
        : null;
    rB =
        json['RB'] != null ? new PlayerFieldPostion.fromJson(json['RB']) : null;
    lB =
        json['LB'] != null ? new PlayerFieldPostion.fromJson(json['LB']) : null;
    mG =
        json['MG'] != null ? new PlayerFieldPostion.fromJson(json['MG']) : null;
    mC =
        json['MC'] != null ? new PlayerFieldPostion.fromJson(json['MC']) : null;
    mD =
        json['MD'] != null ? new PlayerFieldPostion.fromJson(json['MD']) : null;
    aG =
        json['AG'] != null ? new PlayerFieldPostion.fromJson(json['AG']) : null;
    bU =
        json['BU'] != null ? new PlayerFieldPostion.fromJson(json['BU']) : null;
    aD =
        json['AD'] != null ? new PlayerFieldPostion.fromJson(json['AD']) : null;
  }
}

class PlayerFieldPostion {
  int x;
  int y;

  PlayerFieldPostion({this.x, this.y});

  PlayerFieldPostion.fromJson(Map<String, dynamic> json) {
    x = json['x'];
    y = json['y'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['x'] = this.x;
    data['y'] = this.y;
    return data;
  }
}
