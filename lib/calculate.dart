class Calculate {
  int getDate() {
    var date = DateTime.now();
    var parse = DateTime.parse('$date');
    var today = parse.day;
    return today;
  }

  int getGbOfToday() {
    var gbCanBeUsed = (getDate() * 6.6666666).round();
    return gbCanBeUsed;
  }

  int getPercentOfToday() {
    var percentCanUsed = (getDate() * 3.333333).round();
    return percentCanUsed;
  }

  int getGbremained(int userInput) {
    var gbRemained = getGbOfToday() - userInput;
    return gbRemained;
  }

  int getPercentRemained() {
    var percentRemained = 100 - getPercentOfToday();
    return percentRemained;
  }
}
