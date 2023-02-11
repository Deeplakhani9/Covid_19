class Covid {
  final List loc;
  // final int confirmedCasesIndian;
  // final int confirmedCasesForeign;
  // final int discharged;
  // final int deaths;
  // final int totalConfirmed;
  Covid({
    required this.loc,
    // required this.confirmedCasesIndian,
    // required this.confirmedCasesForeign,
    // required this.discharged,
    // required this.deaths,
    // required this.totalConfirmed,
  });

  factory Covid.fromjson({required Map json}) {
    return Covid(
      loc: json['data']['regional'],
      // confirmedCasesIndian: json['data']['regional'][Global.i]
      //     ['confirmedCasesIndian'],
      // confirmedCasesForeign: json['data']['regional'][Global.i]
      //     ['confirmedCasesForeign'],
      // discharged: json['data']['regional'][Global.i]['discharged'],
      // deaths: json['data']['regional'][Global.i]['deaths'],
      // totalConfirmed: json['data']['regional'][Global.i]['totalConfirmed'],
    );
  }
}
