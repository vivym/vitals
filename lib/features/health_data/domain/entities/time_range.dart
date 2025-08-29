// 时间范围枚举
enum TimeRange {
  week('近一周', 7),
  month('近一月', 30),
  threeMonths('近三月', 90),
  year('近一年', 365),
  all('全部', -1);

  const TimeRange(this.label, this.days);
  final String label;
  final int days;
}
