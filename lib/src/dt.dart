import 'dart:async';
import 'package:intl/intl.dart';

class DT {
  DateTime _currentDateTime;

  /// 构造函数，初始化指定日期时间。
  ///
  /// [dateTime]: 字符串格式的日期时间。
  /// 用法示例：
  /// ```dart
  /// var dt = DT('2023-12-01 06:50');
  /// ```
  DT(String dateTime) : _currentDateTime = _parseDateTime(dateTime);

  /// 构造函数，从系统当前日期时间初始化。
  ///
  /// 用法示例：
  /// ```dart
  /// var dt = DT.synchronization();
  /// ```
  DT.synchronization() : _currentDateTime = DateTime.now();

  /// 从日期时间字符串构造DateTime对象。
  ///
  /// [dateTimeStr]: 可以是完整的日期时间字符串（如 '2023-12-01 06:50' 或 '2023/12/01 06:50'）或仅时间字符串（如 '06:50'）。
  /// 如果是仅时间字符串，日期部分将采用当前系统日期。
  /// 用法示例：
  /// ```dart
  /// var dateTime = DT._parseDateTime('2023-12-01 06:50');
  /// var dateTimeWithSlash = DT._parseDateTime('2023/12/01 06:50');
  /// var timeOnly = DT._parseDateTime('06:50');
  /// ```
  static DateTime _parseDateTime(String dateTimeStr) {
    DateFormat format;
    if (dateTimeStr.contains(RegExp(r'\d{4}[-/]\d{2}[-/]\d{2}'))) {
      // 匹配格式为 "yyyy-MM-dd" 或 "yyyy/MM/dd"
      format = DateFormat("yyyy-MM-dd HH:mm");
    } else {
      // 仅时间字符串
      DateTime currentDate = DateTime.now();
      List<String> timeParts = dateTimeStr.split(':');
      return DateTime(currentDate.year, currentDate.month, currentDate.day,
          int.parse(timeParts[0]), int.parse(timeParts[1]));
    }

    // 替换日期连接符号为统一的'-'
    dateTimeStr = dateTimeStr.replaceAll('/', '-');
    return format.parse(dateTimeStr, true);
  }

  /// 设置到昨天的同一时间。
  ///
  /// 用法示例：
  /// ```dart
  /// var dt = DT('2023-12-01 06:50');
  /// dt.lastDay();
  /// ```
  void lastDay() {
    _currentDateTime = _currentDateTime.subtract(Duration(days: 1));
  }

  /// 设置到明天的同一时间。
  ///
  /// 用法示例：
  /// ```dart
  /// var dt = DT('2023-12-01 06:50');
  /// dt.nextDay();
  /// ```
  void nextDay() {
    _currentDateTime = _currentDateTime.add(Duration(days: 1));
  }

  /// 设置到前n天的同一时间。
  ///
  /// [n]: 前进的天数。
  /// 用法示例：
  /// ```dart
  /// var dt = DT('2023-12-01 06:50');
  /// dt.previousNDays(3);
  /// ```
  void previousNDays(int n) {
    _currentDateTime = _currentDateTime.subtract(Duration(days: n));
  }

  /// 设置到后n天的同一时间。
  ///
  /// [n]: 后退的天数。
  /// 用法示例：
  /// ```dart
  /// var dt = DT('2023-12-01 06:50');
  /// dt.nextNDays(3);
  /// ```
  void nextNDays(int n) {
    _currentDateTime = _currentDateTime.add(Duration(days: n));
  }

  /// 前1秒
  ///
  /// 用法示例：
  /// ```dart
  /// var dt = DT('2023-12-01 06:50');
  /// dt.previousSecond();
  /// ```
  void previousSecond() {
    _currentDateTime = _currentDateTime.subtract(Duration(seconds: 1));
  }

  /// 后1秒
  /// 用法示例：
  /// ```dart
  /// var dt = DT('2023-12-01 06:50');
  /// dt.nextSecond();
  /// ```
  void nextSecond() {
    _currentDateTime = _currentDateTime.add(Duration(seconds: 1));
  }

  /// 前1分钟
  ///
  /// 用法示例：
  /// ```dart
  /// var dt = DT('2023-12-01 06:50');
  /// dt.previousMinute();
  /// ```
  void previousMinute() {
    _currentDateTime = _currentDateTime.subtract(Duration(minutes: 1));
  }

  /// 后1分钟
  ///
  /// 用法示例：
  /// ```dart
  /// var dt = DT('2023-12-01 06:50');
  /// dt.nextMinute();
  /// ```
  void nextMinute() {
    _currentDateTime = _currentDateTime.add(Duration(minutes: 1));
  }

  /// 前n分钟
  /// 将当前时间回退指定分钟数。
  ///
  /// [n]: 回退的分钟数。
  /// 用法示例：
  /// ```dart
  /// var dt = DT('2023-12-01 06:50');
  /// dt.previousNMinutes(15);
  /// ```
  void previousNMinutes(int n) {
    _currentDateTime = _currentDateTime.subtract(Duration(minutes: n));
  }

  /// 后n分钟
  ///
  /// [n]: 前进的分钟数。
  /// 用法示例：
  /// ```dart
  /// var dt = DT('2023-12-01 06:50');
  /// dt.nextNMinutes(15);
  /// ```
  void nextNMinutes(int n) {
    _currentDateTime = _currentDateTime.add(Duration(minutes: n));
  }

  /// 前n秒
  ///
  /// [n]: 回退的秒数。
  /// 用法示例：
  /// ```dart
  /// var dt = DT('2023-12-01 06:50');
  /// dt.previousNSeconds(30);
  /// ```
  void previousNSeconds(int n) {
    _currentDateTime = _currentDateTime.subtract(Duration(seconds: n));
  }

  /// 后n秒
  ///
  /// [n]: 前进的秒数。
  /// 用法示例：
  /// ```dart
  /// var dt = DT('2023-12-01 06:50');
  /// dt.nextNSeconds(30);
  /// ```
  void nextNSeconds(int n) {
    _currentDateTime = _currentDateTime.add(Duration(seconds: n));
  }

  /// 加法：增加时间。
  /// [timeStr] 格式为 "小时:分钟:秒"、"分钟:秒" 或 "秒"。
  void addTime(String timeStr) {
    final parts = timeStr.split(':').map(int.tryParse).toList();
    if (parts.any((part) => part == null)) {
      print('Warning: Invalid time format');
      return;
    }

    var duration = Duration();
    if (parts.length == 3) {
      duration =
          Duration(hours: parts[0]!, minutes: parts[1]!, seconds: parts[2]!);
    } else if (parts.length == 2) {
      duration = Duration(minutes: parts[0]!, seconds: parts[1]!);
    } else if (parts.length == 1) {
      duration = Duration(seconds: parts[0]!);
    }

    _currentDateTime = _currentDateTime.add(duration);
  }

  /// 减法：减少时间。
  /// [timeStr] 格式为 "小时:分钟:秒"、"分钟:秒" 或 "秒"。
  void subtractTime(String timeStr) {
    final parts = timeStr.split(':').map(int.tryParse).toList();
    if (parts.any((part) => part == null)) {
      print('Warning: Invalid time format');
      return;
    }

    var duration = Duration();
    if (parts.length == 3) {
      duration =
          Duration(hours: parts[0]!, minutes: parts[1]!, seconds: parts[2]!);
    } else if (parts.length == 2) {
      duration = Duration(minutes: parts[0]!, seconds: parts[1]!);
    } else if (parts.length == 1) {
      duration = Duration(seconds: parts[0]!);
    }

    _currentDateTime = _currentDateTime.subtract(duration);
  }

  @override
  String toString([String separator = '-']) {
    return DateFormat('yyyy${separator}MM${separator}dd HH:mm:ss')
        .format(_currentDateTime);
  }

  /// 打印日期时间字符串。
  void printDateTime() {
    print(toString());
  }

  /// 获取日期字符串
  String toDateString([String separator = '-']) {
    return DateFormat('yyyy${separator}MM${separator}dd')
        .format(_currentDateTime);
  }

  /// 打印日期字符串。
  void printDate() {
    print(toDateString());
  }

  /// 获取时间字符串
  String toTimeString() {
    return DateFormat('HH:mm:ss').format(_currentDateTime);
  }

  /// 打印时间字符串。
  void printTime() {
    print(toTimeString());
  }

  /// 获取时间戳数值
  int get stamp {
    return _currentDateTime.millisecondsSinceEpoch;
  }

  /// 打印时间戳。
  void printStamp() {
    print(stamp);
  }

  /// 根据指定的时间字符串运行回调函数。
  ///
  /// [timeStrings]: 时间字符串列表。
  /// [callback]: 达到指定时间时调用的回调函数。
  /// 用法示例：
  /// ```dart
  /// var dt = DT('2023-12-01 06:50');
  /// dt.run(['2023-12-01 06:51'], () {
  ///   print('时间到了！');
  /// });
  /// ```
  void run(List<String> timeStrings, Function callback) {
    Timer.periodic(Duration(seconds: 1), (timer) {
      var now = DateTime.now();
      for (var timeString in timeStrings) {
        var targetTime = _parseDateTime(timeString);
        if (now.hour == targetTime.hour && now.minute == targetTime.minute) {
          callback();
          timer.cancel(); // 停止计时器
          break;
        }
      }
    });
  }
}
