class TimeLineData {
  static const NORMAL = 0;
  static const WORK = 1;
  static const PLAY = 2;
  static const EATING = 3;
  static const OTHER = 4;

  int index;
  int type;
  String title;
  String content;

  TimeLineData(this.index, this.type, this.title, this.content);
}
