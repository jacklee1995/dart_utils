# The Utils

一个 Dart 和 Flutter 工具库。

[English Document](https://github.com/jacklee1995/dart_utils/blob/master/README.md)

## 字符串工具


```dart
import 'package:the_utils/the_utils.dart';

var isIPv4 = StrUtil.isIPv4("192.168.1.1");
print(isIPv4); // 输出： true
```

你可以从代码注释上找到每一个方法的示例。

| 方法 | 功能描述 |
|------|-----------|
| `capitalize` | 将字符串的首字母转换为大写。 |
| `capitalizeWords` | 将字符串中的特定单词替换为大写形式。 |
| `containsChinese` | 检查字符串是否包含中文字符。 |
| `countCharOccurrences` | 计算字符串中特定字符的出现次数。 |
| `countOccurrences` | 计算字符串中特定字符或子串的出现次数。 |
| `camelCase` | 将字符串转换为驼峰命名格式。 |
| `contains` | 检查字符串是否包含特定的子串。 |
| `endsWith` | 检查字符串是否以特定子串结尾。 |
| `escapeHtml` | 将字符串中的HTML特殊字符转义。 |
| `extractNumbers` | 将字符串中的数字提取为列表。 |
| `fromBase64` | 从Base64格式解码字符串。 |
| `fromIni` | 解析INI格式的字符串。 |
| `formatNumberWithCommas` | 将字符串转换为逗号分隔的数字格式。 |
| `getHashCode` | 获取字符串的哈希值。 |
| `isZAlphabetical` | 检查字符串中的字符是否按照字母表顺序排列。 |
| `isHex` | 检查字符串是否是有效的十六进制数。 |
| `isAlpha` | 检查字符串是否只包含字母。 |
| `isAlphanumeric` | 检查字符串是否只包含字母和数字。 |
| `isNumeric` | 检查字符串是否只包含数字。 |
| `isUrl` | 检查字符串是否是有效的URL。 |
| `isEmail` | 检查字符串是否是有效的电子邮件地址。 |
| `isAsset` | 检查字符串是否是有效的Flutter资源路径。 |
| `isDigitOnly` | 判断字符串是否是纯数字。 |
| `isWhitespace` | 检查字符串是否只包含空格和换行符。 |
| `isEmpty` | 检查字符串是否为空。 |
| `isNullOrEmpty` | 检查字符串是否为null或空。 |
| `isNullEmptyOrWhitespace` | 检查字符串是否为null、空或仅包含空白字符。 |
| `isValidUsername` | 检查字符串是否是有效的用户名。 |
| `isNotEmpty` | 检查字符串是否不为空。 |
| `isBlank` | 检查字符串是否只包含空格。 |
| `isLowerCase` | 检查字符串是否全部由小写字母组成。 |
| `isUpperCase` | 检查字符串是否全部由大写字母组成。 |
| `isPalindrome` | 检查字符串是否是一个回文。 |
| `isDateTime` | 检查字符串是否是有效的日期时间格式。 |
| `isCreditCard` | 检查字符串是否是有效的信用卡号。 |
| `isFilePath` | 检查字符串是否是有效的文件路径。 |
| `isIPv4` | 检查字符串是否是有效的IPv4地址。 |
| `isIPv6` | 检查字符串是否是有效的IPv6地址。 |
| `isBase64` | 检查字符串是否符合Base64格式。 |
| `isJson` | 检查字符串是否是有效的JSON格式。 |
| `isPhoneNumber` | 检查字符串是否符合电话号码格式。 |
| `isSimplePassword` | 检查字符串是否符合简单的密码规则。 |
| `isSpace` | 检查字符串是否只包含空格。 |
| `isLicensePlate` | 检查字符串是否是有效的车牌号。 |
| `kebabCase` | 将字符串转换为短横线命名格式。 |
| `lowercaseWords` | 将字符串中的特定单词替换为小写形式。 |
| `lowercaseFirstLetterOfEachWord` | 将字符串中的每个单词首字母转换为小写。 |
| `matchesPattern` | 检查字符串是否符合指定的正则表达式。 |
| `nTimesRepeat` | 将字符串转换为n倍重复的形式。 |
| `onlyDigits` | 获取字符串中的数字。 |
| `padLeft` | 将字符串左侧填充到指定长度。 |
| `padRight` | 将字符串右侧填充到指定长度。 |
| `repeat` | 将字符串重复指定次数。 |
| `randomString` | 生成指定长度的随机字符串。 |
| `replace` | 替换字符串中的子串。 |
| `replaceWords` | 将字符串中的特定单词替换为指定的映射。 |
| `replaceWithCallback` | 将字符串中的特定模式替换为回调函数返回的字符串。 |
| `removeSubstring` | 移除字符串中的特定子串。 |
| `removeNonNumeric` | 移除字符串中的所有非数字字符。 |
| `removeHtmlTags` | 移除字符串中的HTML标签。 |
| `replaceChars` | 将字符串的每个字符替换为指定的映射字符。 |
| `replaceWord` | 将字符串中的特定单词替换为另一个单词。 |
| `removeDigits` | 移除字符串中的所有数字。 |
| `reverse` | 反转字符串。 |
| `reverseSnakeCase` | 将字符串转换为反转的蛇形命名格式。 |
| `removeChar` | 从字符串中移除特定字符。 |
| `removeSpaces` | 移除字符串中的所有空格。 |
| `replaceMultipleSpacesWithSingle` | 将多个空格替换为单个空格。 |
| `removeChinese` | 移除字符串中的中文字符。 |
| `replaceNewLines` | 将字符串中的换行符转换为特定的字符串。 |
| `reverseCamelCase` | 将字符串转换为反转的驼峰命名格式。 |
| `randomAlphabetic` | 生成指定长度的随机字母字符串。 |
| `substringFromIndex` | 从字符串的指定位置提取特定长度的子串。 |
| `snakeCase` | 将字符串转换为蛇形命名格式。 |
| `sortWords` | 将字符串中的所有单词按照字典顺序排序。 |
| `sortAlphabetically` | 将字符串中的所有单词按字母顺序排序。 |
| `splitIntoChunks` | 将字符串分割为指定长度的子串列表。 |
| `splitByDelimiter` | 将字符串转换为List，按照指定的分隔符分割。 |
| `splitByNewLine` | 将字符串转换为List，按照新行符分割。 |
| `titleize` | 将字符串中的每个单词首字母转换为大写。 |
| `toAsciiString` | 将字符串转换为其ASCII码表示的字符串。 |
| `toZeroWidthString` | 将字符串转换为零宽字符表示。 |
| `toAcronym` | 将字符串转换为首字母缩写词。 |
| `toBinaryString` | 将字符串转换为其二进制表示的字符串。 |
| `toSafeFileName` | 将字符串转换为安全的文件名（移除非法字符）。 |
| `toTitleCaseIgnoringSmallWords` | 将字符串转换为标题格式，忽略小词。 |
| `toBase64` | 将字符串转换为Base64格式。 |
| `toBoolean` | 将字符串转换为布尔值。 |
| `toSlug` | 将字符串转换为slug（URL友好格式）。 |
| `trimCharFromEnds` | 修剪字符串的首尾指定字符。 |
| `truncate` | 截断字符串到指定长度。 |
| `titleCase` | 将字符串中的每个单词的首字母大写。 |
| `toInt` | 将字符串转换为int类型。 |
| `toList` | 将字符串转换为List，每个元素是原字符串的一个字符。 |
| `toDouble` | 将字符串转换为double类型。 |
| `toDate` | 将字符串转换为日期时间对象。 |
| `trimChar` | 移除字符串首尾的特定字符。 |
| `uppercaseWord` | 将字符串中的特定单词转换为大写。 |
| `unescapeHtml` | 将转义的HTML字符串还原。 |
| `utf8Length` | 计算字符串的字节长度（UTF-8编码）。 |
| `validateRegex` | 验证字符串是否符合指定的正则表达式。 |
| `wordsJoinWithSeparator` | 将字符串的单词按照指定的分隔符连接。 |
| `xToDash` | 将字符串转换为小写，并替换所有空格为破折号。 |
| `yearFormat` | 年份格式化。 |
| `yesOrNo` | 将字符串转换为“是/否”表示。 |
| `zip` | 将两个字符串压缩（zip）成一对的列表。 |
| `zeroWidthEncode` | 将字符串转换为使用零宽空格的隐写形式。 |
| `zeroWidthDecode` | 从使用零宽空格编码的字符串中解码出原始字符串。 |
| `zipCompress` | 对字符串执行简单的压缩算法（使用重复字符计数）。 |
| `zipDecompress` | 解压使用简单压缩算法压缩的字符串。 |
| `zipToMap` | 使用指定的分隔符将字符串转换为“键-值”对的映射。 |


## 日期时间工具

例如：

```dart
import 'package:the_utils/the_utils.dart';

void main(List<String> args) {
  var dt = DT('2023-12-01 06:50');
  dt.nextDay();
  dt.printDateTime();
}
```

输出为：

```
2023-12-02 06:50:00
```

你可以从代码注释上找到每一个方法的示例。

| 方法 | 功能描述 |
|------|-----------|
| `DT(String dateTime)` | 构造函数，使用字符串格式的日期时间初始化。 |
| `DT.synchronization()` | 构造函数，使用系统当前日期时间初始化。 |
| `_parseDateTime(String dateTimeStr)` | 从日期时间字符串构造 `DateTime` 对象。 |
| `lastDay()` | 设置到昨天的同一时间。 |
| `nextDay()` | 设置到明天的同一时间。 |
| `previousNDays(int n)` | 设置到前 `n` 天的同一时间。 |
| `nextNDays(int n)` | 设置到后 `n` 天的同一时间。 |
| `previousSecond()` | 将当前时间回退一秒。 |
| `nextSecond()` | 将当前时间前进一秒。 |
| `previousMinute()` | 将当前时间回退一分钟。 |
| `nextMinute()` | 将当前时间前进一分钟。 |
| `previousNMinutes(int n)` | 将当前时间回退指定分钟数。 |
| `nextNMinutes(int n)` | 将当前时间前进指定分钟数。 |
| `previousNSeconds(int n)` | 将当前时间回退指定秒数。 |
| `nextNSeconds(int n)` | 将当前时间前进指定秒数。 |
| `addTime(String timeStr)` | 根据给定的时间字符串增加时间。 |
| `subtractTime(String timeStr)` | 根据给定的时间字符串减少时间。 |
| `toString()` | 返回 yyyy-MM-dd HH:mm:ss 格式的日期时间字符串。 |
| `printDateTime()` | 打印日期时间字符串。 |
| `toDateString()` | 获取日期字符串。 |
| `printDate()` | 打印日期字符串。 |
| `toTimeString()` | 获取时间字符串。 |
| `printTime()` | 打印时间字符串。 |
| `get stamp` | 获取当前时间的时间戳。 |
| `printStamp()` | 打印当前时间的时间戳。 |
| `run(List<String> timeStrings, Function callback)` | 根据指定的时间字符串运行回调函数。 |

