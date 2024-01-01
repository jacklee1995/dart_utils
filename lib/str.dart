import 'dart:convert';
import 'dart:math';

class StrUtil {
  /// 将字符串的首字母转换为大写。
  ///
  /// - str: 要转换的字符串。
  /// - 返回值: 首字母大写后的字符串。
  /// - 示例：
  /// ```dart
  /// var capitalized = StrUtil.capitalize("hello");
  /// print(capitalized); // 输出: "Hello"
  /// ```
  static String capitalize(String str) {
    if (str.isEmpty) return str;
    return str[0].toUpperCase() + str.substring(1);
  }

  /// 将字符串中的特定单词替换为大写形式。
  ///
  /// - str: 原始字符串。
  /// - words: 要替换为大写的单词列表。
  /// - 返回值: 替换后的字符串。
  /// - 示例：
  /// ```dart
  /// var capitalizedWords = StrUtil.capitalizeWords("hello world", ["world"]);
  /// print(capitalizedWords); // 输出: "hello WORLD"
  /// ```
  static String capitalizeWords(String str, List<String> words) {
    for (var word in words) {
      str = str.replaceAll(word, word.toUpperCase());
    }
    return str;
  }

  /// 检查字符串是否包含中文字符。
  ///
  /// - str: 要检查的字符串。
  /// - 返回值: 如果字符串包含中文字符，则返回true，否则返回false。
  /// - 示例：
  /// ```dart
  /// var containsChinese = StrUtil.containsChinese("你好");
  /// print(containsChinese); // 输出: true
  /// ```
  static bool containsChinese(String str) {
    return RegExp(r'[\u4e00-\u9fa5]').hasMatch(str);
  }

  /// 计算字符串中特定字符的出现次数。
  ///
  /// - str: 原始字符串。
  /// - char: 要计算的字符。
  /// - 返回值: 字符的出现次数。
  /// - 示例：
  /// ```dart
  /// var count = StrUtil.countCharOccurrences("hello world", "l");
  /// print(count); // 输出: 3
  /// ```
  static int countCharOccurrences(String str, String char) {
    return str.split(char).length - 1;
  }

  /// 计算字符串中特定字符或子串的出现次数。
  ///
  /// - str: 原始字符串。
  /// - sub: 要计算的字符或子串。
  /// - 返回值: 字符或子串的出现次数。
  /// - 示例：
  /// ```dart
  /// var count = StrUtil.countOccurrences("hello world", "o");
  /// print(count); // 输出: 2
  /// ```
  static int countOccurrences(String str, String sub) {
    return str.split(sub).length - 1;
  }

  /// 将字符串转换为驼峰命名格式。
  ///
  /// - str: 要转换的字符串。
  /// - 返回值: 驼峰命名格式的字符串。
  /// - 示例：
  /// ```dart
  /// var camelCaseStr = StrUtil.camelCase("hello world");
  /// print(camelCaseStr); // 输出: "helloWorld"
  /// ```
  static String camelCase(String str) {
    return str.toLowerCase().split(' ').map((word) {
      return word.isEmpty ? word : capitalize(word);
    }).join();
  }

  /// 检查字符串是否包含特定的子串。
  ///
  /// - str: 原始字符串。
  /// - sub: 检查的子串。
  /// - 返回值: 如果字符串包含该子串，则返回true，否则返回false。
  /// - 示例：
  /// ```dart
  /// var containsSub = StrUtil.contains("hello world", "world");
  /// print(containsSub); // 输出: true
  /// ```
  static bool contains(String str, String sub) {
    return str.contains(sub);
  }

  /// 检查字符串是否以特定子串结尾。
  ///
  /// - str: 原始字符串。
  /// [suffix]: 检查的子串。
  /// - 返回值: 如果字符串以该子串结尾，则返回true，否则返回false。
  /// - 示例：
  /// ```dart
  /// var endsWithSuffix = StrUtil.endsWith("hello world", "world");
  /// print(endsWithSuffix); // 输出: true
  /// ```
  static bool endsWith(String str, String suffix) {
    return str.endsWith(suffix);
  }

  /// 将字符串中的HTML特殊字符转义。
  ///
  /// - str: 要转义的字符串。
  /// - 返回值: 转义后的字符串。
  /// - 示例：
  /// ```dart
  /// var escapedHtml = StrUtil.escapeHtml("<div>Hello World</div>");
  /// print(escapedHtml); // 输出: "&lt;div&gt;Hello World&lt;/div&gt;"
  /// ```
  static String escapeHtml(String str) {
    return htmlEscape.convert(str);
  }

  /// 将字符串中的数字提取为列表。
  ///
  /// - str: 原始字符串。
  /// - 返回值: 包含字符串中所有数字的列表。
  /// - 示例：
  /// ```dart
  /// var numbers = StrUtil.extractNumbers("hello 123 world 456");
  /// print(numbers); // 输出: [123, 456]
  /// ```
  static List<int> extractNumbers(String str) {
    return RegExp(r'\d+')
        .allMatches(str)
        .map((match) => int.parse(match.group(0)!))
        .toList();
  }

  /// 从Base64格式解码字符串。
  ///
  /// - str: 要解码的Base64字符串。
  /// - 返回值: 解码后的字符串。
  /// - 示例：
  /// ```dart
  /// var decodedString = StrUtil.fromBase64("aGVsbG8gd29ybGQ=");
  /// print(decodedString); // 输出: "hello world"
  /// ```
  static String fromBase64(String str) {
    return utf8.decode(base64Decode(str));
  }

  /// 解析INI格式的字符串。
  ///
  /// - str: INI格式的字符串。
  /// - 返回值: 解析后的Map。
  ///
  /// - 示例：
  ///
  /// ```dart
  /// var iniData = '''
  ///   ; this is a comment
  ///   key1 = value1
  ///   key2 = 5
  ///
  ///   [section1]
  ///   keyA = valueA
  ///   keyB = 10
  ///
  ///   [section2]
  ///   keyX = valueX
  ///   keyY = 20
  /// ''';
  ///
  /// var parsedMap = StrUtil.fromIni(iniData);
  /// print(parsedMap);
  /// ```
  ///
  static Map<String, dynamic> fromIni(String str) {
    var result = <String, dynamic>{};
    String? currentSection;

    for (var line in str.split('\n')) {
      line = line.trim();

      // 忽略空行和注释
      if (line.isEmpty || line.startsWith(';')) continue;

      // 处理区段
      if (line.startsWith('[') && line.endsWith(']')) {
        currentSection = line.substring(1, line.length - 1);
        result[currentSection] = <String, dynamic>{};
      } else {
        // 处理键值对
        var index = line.indexOf('=');
        if (index != -1) {
          var key = line.substring(0, index).trim();
          var value = line.substring(index + 1).trim();

          // 尝试转换为数字
          var numericValue = num.tryParse(value);
          var finalValue = numericValue ?? value;

          if (currentSection != null) {
            result[currentSection][key] = finalValue;
          } else {
            result[key] = finalValue;
          }
        }
      }
    }

    return result;
  }

  /// 将字符串转换为逗号分隔的数字格式。
  ///
  /// - str: 数字字符串。
  /// - 返回值: 逗号分隔的数字格式字符串。
  /// - 示例：
  /// ```dart
  /// var formattedNumber = StrUtil.formatNumberWithCommas("1234567");
  /// print(formattedNumber); // 输出: "1,234,567"
  /// ```
  static String formatNumberWithCommas(String str) {
    return str.replaceAllMapped(
      RegExp(r'(\d)(?=(\d{3})+(?!\d))'),
      (Match m) => '${m[1]},',
    );
  }

  /// 获取字符串的哈希值。
  ///
  /// - str: 要哈希的字符串。
  /// - 返回值: 字符串的哈希值。
  /// - 示例：
  /// ```dart
  /// var hashCode = StrUtil.getHashCode("hello");
  /// print(hashCode); // 输出: 字符串"hello"的哈希值
  /// ```
  static int getHashCode(String str) {
    return str.hashCode;
  }

  /// 检查字符串中的字符是否按照字母表顺序排列。
  ///
  /// - str: 要检查的字符串。
  /// - 返回值: 如果字符按字母表顺序排列，则返回true，否则返回false。
  /// - 示例：
  /// ```dart
  /// var isAlphabetical = StrUtil.isZAlphabetical("abc");
  /// print(isAlphabetical); // 输出: true
  /// ```
  static bool isZAlphabetical(String str) {
    for (int i = 1; i < str.length; i++) {
      if (str[i - 1].compareTo(str[i]) > 0) return false;
    }
    return true;
  }

  /// 检查字符串是否是有效的十六进制数。
  ///
  /// - str: 要检查的字符串。
  /// - 返回值: 如果字符串是有效的十六进制数，则返回true，否则返回false。
  /// - 示例：
  /// ```dart
  /// var isHexadecimal = StrUtil.isHex("1a3f");
  /// print(isHexadecimal); // 输出: true
  /// ```
  static bool isHex(String str) {
    const hexPattern = r'^[0-9a-fA-F]+$';
    return RegExp(hexPattern).hasMatch(str);
  }

  /// 检查字符串是否只包含字母。
  ///
  /// - str: 要检查的字符串。
  /// - 返回值: 如果字符串只包含字母，则返回true，否则返回false。
  /// - 示例：
  /// ```dart
  /// var isAlphabetic = StrUtil.isAlpha("Hello");
  /// print(isAlphabetic); // 输出: true
  /// ```
  static bool isAlpha(String str) {
    final alphaPattern = RegExp(r'^[a-zA-Z]+$');
    return alphaPattern.hasMatch(str);
  }

  /// 检查字符串是否只包含字母和数字。
  ///
  /// - str: 要检查的字符串。
  /// - 返回值: 如果字符串只包含字母和数字，则返回true，否则返回false。
  /// - 示例：
  /// ```dart
  /// var isAlphanumeric = StrUtil.isAlphanumeric("Hello123");
  /// print(isAlphanumeric); // 输出: true
  /// ```
  static bool isAlphanumeric(String str) {
    final alphanumericPattern = RegExp(r'^[a-zA-Z0-9]+$');
    return alphanumericPattern.hasMatch(str);
  }

  /// 检查字符串是否只包含数字。
  ///
  /// - str: 要检查的字符串。
  /// - 返回值: 如果字符串只包含数字，则返回true，否则返回false。
  /// - 示例：
  /// ```dart
  /// var isNumeric = StrUtil.isNumeric("12345");
  /// print(isNumeric); // 输出: true
  /// ```
  static bool isNumeric(String str) {
    return double.tryParse(str) != null;
  }

  /// 检查字符串是否是有效的URL。
  ///
  /// - str: 要检查的字符串。
  /// - 返回值: 如果字符串是有效的URL，则返回true，否则返回false。
  /// - 示例：
  /// ```dart
  /// var isValidUrl = StrUtil.isUrl("https://www.example.com");
  /// print(isValidUrl); // 输出: true
  /// ```
  static bool isUrl(String str) {
    const urlPattern = r'^(https?:\/\/)?[\w-]+(\.[\w-]+)+\.?(:\d+)?(\/\S*)?$';

    return RegExp(urlPattern).hasMatch(str);
  }

  /// 检查字符串是否是有效的电子邮件地址。
  ///
  /// - str: 要检查的字符串。
  /// - 返回值: 如果字符串是有效的电子邮件地址，则返回true，否则返回false。
  /// - 示例：
  /// ```dart
  /// var isValidEmail = StrUtil.isEmail("user@example.com");
  /// print(isValidEmail); // 输出: true
  /// ```
  static bool isEmail(String str) {
    const emailPattern = r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$';
    return RegExp(emailPattern).hasMatch(str);
  }

  /// 检查字符串是否是有效的Flutter资源路径。
  ///
  /// - str: 要检查的字符串。
  /// - 返回值: 如果字符串是有效的Flutter资源路径，则返回true，否则返回false。
  /// - 示例：
  /// ```dart
  /// var isFlutterAsset = StrUtil.isAsset("assets/images/logo.png");
  /// print(isFlutterAsset); // 输出: true
  /// ```
  static bool isAsset(String str) {
    return str.startsWith('assets/');
  }

  /// 判断字符串是否是纯数字。
  ///
  /// - str: 要检查的字符串。
  /// - 返回值: 如果字符串是纯数字，则返回true，否则返回false。
  /// - 示例：
  /// ```dart
  /// var isDigitOnly = StrUtil.isDigitOnly("123456");
  /// print(isDigitOnly); // 输出: true
  /// ```
  static bool isDigitOnly(String str) {
    return RegExp(r'^\d+$').hasMatch(str);
  }

  /// 判断字符串是否只包含空格和换行符。
  ///
  /// - str: 要检查的字符串。
  /// - 返回值: 如果字符串只包含空格和换行符，则返回true，否则返回false。
  /// - 示例：
  /// ```dart
  /// var isWhitespace = StrUtil.isWhitespace("\n   \n");
  /// print(isWhitespace); // 输出: true
  /// ```
  static bool isWhitespace(String str) {
    return str.trim().isEmpty;
  }

  /// 检查字符串是否为空。
  ///
  /// - str: 要检查的字符串。
  /// - 返回值: 如果字符串为空，则返回true，否则返回false。
  static bool isEmpty(String? str) {
    return str?.isEmpty ?? true;
  }

  /// 检查字符串是否为null或空。
  ///
  /// - str: 要检查的字符串。
  /// - 返回值: 如果字符串为null或空，则返回true，否则返回false。
  /// - 示例：
  /// ```dart
  /// var isNullOrEmpty = StrUtil.isNullOrEmpty(null);
  /// print(isNullOrEmpty); // 输出: true
  /// ```
  static bool isNullOrEmpty(String? str) {
    return str == null || str.isEmpty;
  }

  /// 检查字符串是否为null、空或仅包含空白字符。
  ///
  /// - str: 要检查的字符串。
  /// - 返回值: 如果字符串为null、空或仅包含空白字符，则返回true，否则返回false。
  /// - 示例：
  /// ```dart
  /// var isEmptyOrWhitespace = StrUtil.isNullEmptyOrWhitespace("   ");
  /// print(isEmptyOrWhitespace); // 输出: true
  /// ```
  static bool isNullEmptyOrWhitespace(String? str) {
    return str == null || str.isEmpty || str.trim().isEmpty;
  }

  /// 检查字符串是否是有效的用户名（字母、数字、下划线，5-15字符）。
  ///
  /// - str: 要检查的字符串。
  /// - 返回值: 如果字符串是有效的用户名，则返回true，否则返回false。
  /// - 示例：
  /// ```dart
  /// var isValidUsername = StrUtil.isValidUsername("user_123");
  /// print(isValidUsername); // 输出: true
  /// ```
  static bool isValidUsername(String str) {
    return RegExp(r'^\w{5,15}$').hasMatch(str);
  }

  /// 检查字符串是否不为空。
  ///
  /// - str: 要检查的字符串。
  /// - 返回值: 如果字符串不为空，则返回true，否则返回false。
  /// - 示例：
  /// ```dart
  /// var isNotEmpty = StrUtil.isNotEmpty("Hello");
  /// print(isNotEmpty); // 输出: true
  /// ```
  static bool isNotEmpty(String? str) {
    return str?.isNotEmpty ?? false;
  }

  /// 检查字符串是否只包含空格。
  ///
  /// - str: 要检查的字符串。
  /// - 返回值: 如果字符串只包含空格，则返回true，否则返回false。
  /// - 示例：
  /// ```dart
  /// var isBlank = StrUtil.isBlank("   ");
  /// print(isBlank); // 输出: true
  /// ```
  static bool isBlank(String str) {
    return str.trim().isEmpty;
  }

  /// 检查字符串是否全部由小写字母组成。
  ///
  /// - str: 要检查的字符串。
  /// - 返回值: 如果字符串全部由小写字母组成，则返回true，否则返回false。
  /// - 示例：
  /// ```dart
  /// var isLowerCase = StrUtil.isLowerCase("hello");
  /// print(isLowerCase); // 输出: true
  /// ```
  static bool isLowerCase(String str) {
    return str == str.toLowerCase();
  }

  /// 检查字符串是否全部由大写字母组成。
  ///
  /// - str: 要检查的字符串。
  /// - 返回值: 如果字符串全部由大写字母组成，则返回true，否则返回false。
  /// - 示例：
  /// ```dart
  /// var isUpperCase = StrUtil.isUpperCase("HELLO");
  /// print(isUpperCase); // 输出: true
  /// ```
  static bool isUpperCase(String str) {
    return str == str.toUpperCase();
  }

  /// 检查字符串是否是一个回文。
  ///
  /// - str: 要检查的字符串。
  /// - 返回值: 如果字符串是回文，则返回true，否则返回false。
  /// - 示例：
  /// ```dart
  /// var isPalindrome = StrUtil.isPalindrome("madam");
  /// print(isPalindrome); // 输出: true
  /// ```
  static bool isPalindrome(String str) {
    String reversed = reverse(str); // 使用之前定义的reverse函数
    return str == reversed;
  }

  /// 检查字符串是否是有效的日期时间格式。
  ///
  /// - str: 要检查的字符串。
  /// - 返回值: 如果字符串是有效的日期时间格式，则返回true，否则返回false。
  /// - 示例：
  /// ```dart
  /// var isDateTime = StrUtil.isDateTime("2021-01-01");
  /// print(isDateTime); // 输出: true
  /// ```
  static bool isDateTime(String str) {
    try {
      DateTime.parse(str);
      return true;
    } catch (e) {
      return false;
    }
  }

  /// 检查字符串是否是有效的信用卡号。
  ///
  /// - str: 要检查的字符串。
  /// - 返回值: 如果字符串是有效的信用卡号，则返回true，否则返回false。
  /// 检查字符串是否是有效的信用卡号。
  /// - 示例：
  /// ```dart
  /// var isCreditCard = StrUtil.isCreditCard("1234567890123456");
  /// print(isCreditCard); // 输出: false
  /// ```
  static bool isCreditCard(String str) {
    final creditCardPattern = RegExp(r'^[0-9]{16}$');
    return creditCardPattern.hasMatch(str);
  }

  /// 检查字符串是否是有效的文件路径。
  ///
  /// - str: 要检查的字符串。
  /// - 返回值: 如果字符串是有效的文件路径，则返回true，否则返回false。
  /// - 示例：
  /// ```dart
  /// var isFilePath = StrUtil.isFilePath("C:/Users/example.txt");
  /// print(isFilePath); // 输出: true
  /// ```
  static bool isFilePath(String str) {
    final filePathPattern =
        RegExp(r'^[a-zA-Z0-9_\-\/\\]+[a-zA-Z0-9]+\.[a-zA-Z0-9]+$');
    return filePathPattern.hasMatch(str);
  }

  /// 检查字符串是否是有效的IPv4地址。
  ///
  /// - str: 要检查的字符串。
  /// - 返回值: 如果字符串是有效的IPv4地址，则返回true，否则返回false。
  /// - 示例：
  /// ```dart
  /// var isIPv4 = StrUtil.isIPv4("192.168.1.1");
  /// print(isIPv4); // 输出: true
  /// ```
  static bool isIPv4(String str) {
    const ipv4Pattern =
        r'^(?:(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)$';
    return RegExp(ipv4Pattern).hasMatch(str);
  }

  /// 检查字符串是否是有效的IPv6地址。
  ///
  /// - str: 要检查的字符串。
  /// - 返回值: 如果字符串是有效的IPv6地址，则返回true，否则返回false。
  /// - 示例：
  /// ```dart
  /// var isIPv6 = StrUtil.isIPv6("2001:0db8:85a3:0000:0000:8a2e:0370:7334");
  /// print(isIPv6); // 输出: true
  /// ```
  static bool isIPv6(String str) {
    const ipv6Pattern =
        r'^\s*((([0-9A-Fa-f]{1,4}:){7}([0-9A-Fa-f]{1,4}|:))|(([0-9A-Fa-f]{1,4}:){6}(:[0-9A-Fa-f]{1,4}|((25[0-5]|2[0-4][0-9]|1[0-9][0-9]|[1-9]?[0-9]))))(?<![^:]:)(?<!\.)\s*$';
    return RegExp(ipv6Pattern).hasMatch(str);
  }

  /// 检查字符串是否符合Base64格式。
  ///
  /// - str: 要检查的字符串。
  /// - 返回值: 如果字符串符合Base64格式，则返回true，否则返回false。
  /// - 示例：
  /// ```dart
  /// var isBase64 = StrUtil.isBase64("SGVsbG8gV29ybGQ=");
  /// print(isBase64); // 输出: true
  /// ```
  static bool isBase64(String str) {
    const base64Pattern =
        r'^(?:[A-Za-z0-9+\/]{4})*(?:[A-Za-z0-9+\/]{2}==|[A-Za-z0-9+\/]{3}=)?$';
    return RegExp(base64Pattern).hasMatch(str);
  }

  /// 检查字符串是否是有效的JSON格式。
  ///
  /// - str: 要检查的字符串。
  /// - 返回值: 如果字符串是有效的JSON格式，则返回true，否则返回false。
  /// - 示例：
  /// ```dart
  /// var isJson = StrUtil.isJson('{"name":"John", "age":30}');
  /// print(isJson); // 输出: true
  /// ```
  static bool isJson(String str) {
    try {
      json.decode(str);
      return true;
    } catch (_) {
      return false;
    }
  }

  /// 检查字符串是否符合电话号码格式。
  ///
  /// - str: 要检查的字符串。
  /// - 返回值: 如果字符串符合电话号码格式，则返回true，否则返回false。
  /// - 示例：
  /// ```dart
  /// var isPhoneNumber = StrUtil.isPhoneNumber("+1234567890");
  /// print(isPhoneNumber); // 输出: true
  /// ```
  static bool isPhoneNumber(String str) {
    final phonePattern = RegExp(r'^(?:\+?\d{1,3})?\s?\d{3,}$');
    return phonePattern.hasMatch(str);
  }

  /// 检查字符串是否符合简单的密码规则（至少6个字符）。
  ///
  /// - str: 要检查的字符串。
  /// - 返回值: 如果字符串符合密码规则，则返回true，否则返回false。
  /// - 示例：
  /// ```dart
  /// var isSimplePassword = StrUtil.isSimplePassword("123456");
  /// print(isSimplePassword); // 输出: true
  /// ```
  static bool isSimplePassword(String str) {
    return str.length >= 6;
  }

  /// 检查字符串是否只包含空格。
  ///
  /// - str: 要检查的字符串。
  /// - 返回值: 如果字符串只包含空格，则返回true，否则返回false。
  /// - 示例：
  /// ```dart
  /// var isSpace = StrUtil.isSpace("   ");
  /// print(isSpace); // 输出: true
  /// ```
  static bool isSpace(String str) {
    return str.trim().isEmpty;
  }

  /// 检查字符串是否是有效的车牌号。
  ///
  /// - str: 要检查的字符串。
  /// - 返回值: 如果字符串是有效的车牌号，则返回true，否则返回false。
  /// - 示例：
  /// ```dart
  /// var isLicensePlate = StrUtil.isLicensePlate("ABC1234");
  /// print(isLicensePlate); // 输出: true
  /// ```
  static bool isLicensePlate(String str) {
    final licensePlatePattern = RegExp(r'^[A-Z0-9]{6,8}$');
    return licensePlatePattern.hasMatch(str);
  }

  /// 将字符串转换为短横线命名格式。
  ///
  /// - str: 要转换的字符串。
  /// - 返回值: 短横线命名格式的字符串。
  /// - 示例：
  /// ```dart
  /// var kebabCaseStr = StrUtil.kebabCase("helloWorld");
  /// print(kebabCaseStr); // 输出: "hello-world"
  /// ```
  static String kebabCase(String str) {
    return str.replaceAllMapped(RegExp(r'[A-Z]'), (Match match) {
      return '-${match[0]!.toLowerCase()}';
    }).toLowerCase();
  }

  /// 将字符串中的特定单词替换为小写形式。
  ///
  /// - str: 原始字符串。
  /// - words: 要替换为小写的单词列表。
  /// - 返回值: 替换后的字符串。
  /// - 示例：
  /// ```dart
  /// var lowercasedWords = StrUtil.lowercaseWords("Hello World", ["world"]);
  /// print(lowercasedWords); // 输出: "Hello world"
  /// ```
  static String lowercaseWords(String str, List<String> words) {
    for (var word in words) {
      str = str.replaceAll(word, word.toLowerCase());
    }
    return str;
  }

  /// 将字符串中的每个单词首字母转换为小写。
  ///
  /// - str: 要处理的字符串。
  /// - 返回值: 处理后的字符串。
  /// - 示例：
  /// ```dart
  /// var lowercaseFirstLetter = StrUtil.lowercaseFirstLetterOfEachWord("Hello World");
  /// print(lowercaseFirstLetter); // 输出: "hello world"
  /// ```
  static String lowercaseFirstLetterOfEachWord(String str) {
    return str.replaceAllMapped(
      RegExp(r'\b\w'),
      (Match match) => match.group(0)!.toLowerCase(),
    );
  }

  /// 检查字符串是否符合指定的正则表达式。
  ///
  /// - str: 要检查的字符串。
  /// [pattern]: 正则表达式。
  /// - 返回值: 如果字符串符合正则表达式，则返回true，否则返回false。
  /// - 示例：
  /// ```dart
  /// var matchesPattern = StrUtil.matchesPattern("12345", r'\d+');
  /// print(matchesPattern); // 输出: true
  /// ```
  static bool matchesPattern(String str, String pattern) {
    return RegExp(pattern).hasMatch(str);
  }

  /// 将字符串转换为n倍重复的形式。
  ///
  /// - str: 原始字符串。
  /// - n: 重复的次数。
  /// - 返回值: 重复后的字符串。
  /// - 示例：
  /// ```dart
  /// var repeatedString = StrUtil.nTimesRepeat("abc", 3);
  /// print(repeatedString); // 输出: "abcabcabc"
  /// ```
  static String nTimesRepeat(String str, int n) {
    return List.filled(n, str).join();
  }

  /// 获取字符串中的数字。
  ///
  /// - str: 原始字符串。
  /// - 返回值: 字符串中的数字。
  /// - 示例：
  /// ```dart
  /// var onlyDigits = StrUtil.onlyDigits("abc123");
  /// print(onlyDigits); // 输出: "123"
  /// ```
  static String onlyDigits(String str) {
    return str.replaceAll(RegExp(r'[^\d]'), '');
  }

  /// 将字符串左侧填充到指定长度。
  ///
  /// - str: 要填充的字符串。
  /// - length: 指定的长度。
  /// [padWith]: 用于填充的字符。
  /// - 返回值: 左侧填充后的字符串。
  /// - 示例：
  /// ```dart
  /// var paddedLeft = StrUtil.padLeft("123", 5, "0");
  /// print(paddedLeft); // 输出: "00123"
  /// ```
  static String padLeft(String str, int length, String padWith) {
    if (str.length >= length) return str;
    return str.padLeft(length, padWith);
  }

  /// 将字符串右侧填充到指定长度。
  ///
  /// - str: 要填充的字符串。
  /// - length: 指定的长度。
  /// [padWith]: 用于填充的字符。
  /// - 返回值: 右侧填充后的字符串。
  /// - 示例：
  /// ```dart
  /// var paddedRight = StrUtil.padRight("123", 5, "0");
  /// print(paddedRight); // 输出: "12300"
  /// ```
  static String padRight(String str, int length, String padWith) {
    if (str.length >= length) return str;
    return str.padRight(length, padWith);
  }

  /// 将字符串重复指定次数。
  ///
  /// - str: 要重复的字符串。
  /// [times]: 重复的次数。
  /// - 返回值: 重复后的字符串。
  /// - 示例：
  /// ```dart
  /// var repeatedString = StrUtil.repeat("abc", 3);
  /// print(repeatedString); // 输出: "abcabcabc"
  /// ```
  static String repeat(String str, int times) {
    return List.filled(times, str).join();
  }

  /// 生成指定长度的随机字符串。
  ///
  /// - length: 随机字符串的长度。
  /// - 返回值: 生成的随机字符串。
  /// - 示例：
  /// ```dart
  /// var randomStr = StrUtil.randomString(5);
  /// print(randomStr); // 输出为一个5位的字符串
  /// ```
  static String randomString(int length) {
    const chars = 'abcdefghijklmnopqrstuvwxyz0123456789';
    final rnd = Random();
    return String.fromCharCodes(Iterable.generate(
        length, (_) => chars.codeUnitAt(rnd.nextInt(chars.length))));
  }

  /// 替换字符串中的子串。
  ///
  /// - str: 原始字符串。
  /// [oldSub]: 要替换的子串。
  /// [newSub]: 新的子串。
  /// - 返回值: 替换后的字符串。
  /// - 示例：
  /// ```dart
  /// var replacedStr = StrUtil.replace("Hello world", "world", "Dart");
  /// print(replacedStr); // 输出: "Hello Dart"
  /// ```
  static String replace(String str, String oldSub, String newSub) {
    return str.replaceAll(oldSub, newSub);
  }

  /// 将字符串中的特定单词替换为指定的映射。
  ///
  /// - str: 原始字符串。
  /// - wordMap: 单词映射，例如 {'hello': 'hi', 'world': 'earth'}。
  /// - 返回值: 替换后的字符串。
  /// - 示例：
  /// ```dart
  /// var replacedWords = StrUtil.replaceWords("hello world", {"hello": "hi", "world": "Dart"});
  /// print(replacedWords); // 输出: "hi Dart"
  /// ```
  static String replaceWords(String str, Map<String, String> wordMap) {
    wordMap.forEach((key, value) {
      str = str.replaceAll(RegExp('\\b$key\\b'), value);
    });
    return str;
  }

  /// 将字符串中的特定模式替换为回调函数返回的字符串。
  ///
  /// - str: 原始字符串。
  /// - pattern: 要替换的模式（正则表达式）。
  /// - callback: 回调函数，接收匹配对象作为参数。
  /// - 返回值: 替换后的字符串。
  /// - 示例：
  /// ```dart
  /// var replacedCallback = StrUtil.replaceWithCallback("12345", r'\d', (m) => "(" + m.group(0)! + ")");
  /// print(replacedCallback); // 输出: "(1)(2)(3)(4)(5)"
  /// ```
  static String replaceWithCallback(
      String str, String pattern, String Function(Match match) callback) {
    return str.replaceAllMapped(RegExp(pattern), callback);
  }

  /// 移除字符串中的特定子串。
  ///
  /// - str: 原始字符串。
  /// - sub: 要移除的子串。
  /// - 返回值: 移除特定子串后的字符串。
  /// - 示例：
  /// ```dart
  /// var removedSubstring = StrUtil.removeSubstring("Hello world", "world");
  /// print(removedSubstring); // 输出: "Hello "
  /// ```
  static String removeSubstring(String str, String sub) {
    return str.replaceAll(sub, '');
  }

  /// 移除字符串中的所有非数字字符。
  ///
  /// - str: 原始字符串。
  /// - 返回值: 只包含数字的字符串。
  /// - 示例：
  /// ```dart
  /// var removedNonNumeric = StrUtil.removeNonNumeric("abc123");
  /// print(removedNonNumeric); // 输出: "123"
  /// ```
  static String removeNonNumeric(String str) {
    return str.replaceAll(RegExp(r'[^\d]'), '');
  }

  /// 移除字符串中的HTML标签。
  ///
  /// - str: 原始字符串。
  /// - 返回值: 移除HTML标签后的字符串。
  /// - 示例：
  /// ```dart
  /// var removedHtmlTags = StrUtil.removeHtmlTags("<p>Hello World</p>");
  /// print(removedHtmlTags); // 输出: "Hello World"
  /// ```
  static String removeHtmlTags(String str) {
    return str.replaceAll(RegExp(r'<[^>]*>'), '');
  }

  /// 将字符串的每个字符替换为指定的映射字符。
  ///
  /// - str: 原始字符串。
  /// - mapping: 字符映射，例如 {'a': '1', 'b': '2'}。
  /// - 返回值: 替换后的字符串。
  /// - 示例：
  /// ```dart
  /// var replacedChars = StrUtil.replaceChars("ab", {"a": "1", "b": "2"});
  /// print(replacedChars); // 输出: "12"
  /// ```
  static String replaceChars(String str, Map<String, String> mapping) {
    mapping.forEach((key, value) {
      str = str.replaceAll(key, value);
    });
    return str;
  }

  /// 将字符串中的特定单词替换为另一个单词。
  ///
  /// - str: 原始字符串。
  /// - oldWord: 要替换的单词。
  /// - newWord: 新的单词。
  /// - 返回值: 替换后的字符串。
  /// - 示例：
  /// ```dart
  /// var replacedWord = StrUtil.replaceWord("Hello world", "world", "Dart");
  /// print(replacedWord); // 输出: "Hello Dart"
  /// ```
  static String replaceWord(String str, String oldWord, String newWord) {
    return str.replaceAll(RegExp('\\b$oldWord\\b'), newWord);
  }

  /// 移除字符串中的所有数字。
  ///
  /// - str: 原始字符串。
  /// - 返回值: 移除数字后的字符串。
  /// - 示例：
  /// ```dart
  /// var removedDigits = StrUtil.removeDigits("abc123");
  /// print(removedDigits); // 输出: "abc"
  /// ```
  static String removeDigits(String str) {
    return str.replaceAll(RegExp(r'\d'), '');
  }

  /// 反转字符串。
  ///
  /// - str: 要反转的字符串。
  /// - 返回值: 反转后的字符串。
  /// - 示例：
  /// ```dart
  /// var reversedStr = StrUtil.reverse("hello");
  /// print(reversedStr); // 输出: "olleh"
  /// ```
  static String reverse(String str) {
    return String.fromCharCodes(str.runes.toList().reversed);
  }

  /// 将字符串转换为反转的蛇形命名格式。
  ///
  /// - str: 要转换的字符串。
  /// - 返回值: 反转的蛇形命名格式的字符串。
  /// - 示例：
  /// ```dart
  /// var reversedSnakeCaseStr = StrUtil.reverseSnakeCase("hello_world");
  /// print(reversedSnakeCaseStr); // 输出: "HELLO-WORLD"
  /// ```
  static String reverseSnakeCase(String str) {
    return str.split('_').map((word) => word.toUpperCase()).join('-');
  }

  /// 从字符串中移除特定字符。
  ///
  /// - str: 原始字符串。
  /// - char: 要移除的字符。
  /// - 返回值: 处理后的字符串。
  /// - 示例：
  /// ```dart
  /// var removedCharStr = StrUtil.removeChar("hello", "l");
  /// print(removedCharStr); // 输出: "heo"
  /// ```
  static String removeChar(String str, String char) {
    return str.replaceAll(char, '');
  }

  /// 移除字符串中的所有空格。
  ///
  /// - str: 要处理的字符串。
  /// - 返回值: 移除空格后的字符串。
  /// - 示例：
  /// ```dart
  /// var removedSpacesStr = StrUtil.removeSpaces("hello world");
  /// print(removedSpacesStr); // 输出: "helloworld"
  /// ```
  static String removeSpaces(String str) {
    return str.replaceAll(' ', '');
  }

  /// 将多个空格替换为单个空格。
  ///
  /// - str: 原始字符串。
  /// - 返回值: 替换后的字符串。
  /// - 示例：
  /// ```dart
  /// var singleSpaceStr = StrUtil.replaceMultipleSpacesWithSingle("hello   world");
  /// print(singleSpaceStr); // 输出: "hello world"
  /// ```
  static String replaceMultipleSpacesWithSingle(String str) {
    return str.replaceAll(RegExp(r'\s+'), ' ');
  }

  /// 移除字符串中的中文字符。
  ///
  /// - str: 原始字符串。
  /// - 返回值: 移除中文字符后的字符串。
  /// - 示例：
  /// ```dart
  /// var removedChineseStr = StrUtil.removeChinese("hello世界");
  /// print(removedChineseStr); // 输出: "hello"
  /// ```
  static String removeChinese(String str) {
    return str.replaceAll(RegExp(r'[\u4e00-\u9fa5]'), '');
  }

  /// 将字符串中的换行符转换为特定的字符串。
  ///
  /// - str: 原始字符串。
  /// - replacement: 替换换行符的字符串。
  /// - 返回值: 替换后的字符串。
  /// - 示例：
  /// ```dart
  /// var replacedNewLinesStr = StrUtil.replaceNewLines("hello\nworld", " ");
  /// print(replacedNewLinesStr); // 输出: "hello world"
  /// ```
  static String replaceNewLines(String str, String replacement) {
    return str.replaceAll('\n', replacement);
  }

  /// 将字符串转换为反转的驼峰命名格式。
  ///
  /// - str: 要转换的字符串。
  /// - 返回值: 反转的驼峰命名格式的字符串。
  /// - 示例：
  /// ```dart
  /// var reverseCamelCaseStr = StrUtil.reverseCamelCase("HelloWorld");
  /// print(reverseCamelCaseStr); // 输出: "hello_world"
  /// ```
  static String reverseCamelCase(String str) {
    return str.replaceAllMapped(
      RegExp(r'[A-Z]'),
      (Match match) => '_${match[0]!.toLowerCase()}',
    );
  }

  /// 生成指定长度的随机字母字符串。
  ///
  /// - length: 字符串的长度。
  /// - 返回值: 生成的随机字母字符串。
  /// - 示例：
  /// ```dart
  /// var randomAlphabeticStr = StrUtil.randomAlphabetic(5);
  /// print(randomAlphabeticStr); // 输出: 随机的5个字母组成的字符串
  /// ```
  static String randomAlphabetic(int length) {
    const chars = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ';
    final rnd = Random();
    return String.fromCharCodes(Iterable.generate(
        length, (_) => chars.codeUnitAt(rnd.nextInt(chars.length))));
  }

  /// 从字符串的指定位置提取特定长度的子串。
  ///
  /// - str: 原始字符串。
  /// - start: 起始位置。
  /// - length: 提取的长度。
  /// - 返回值: 提取的子串。
  /// - 示例：
  /// ```dart
  /// var substringFromIndexStr = StrUtil.substringFromIndex("hello world", 6, 5);
  /// print(substringFromIndexStr); // 输出: "world"
  /// ```
  static String substringFromIndex(String str, int start, int length) {
    return str.substring(start, start + length);
  }

  /// 将字符串转换为蛇形命名格式。
  ///
  /// - str: 要转换的字符串。
  /// - 返回值: 蛇形命名格式的字符串。
  /// - 示例：
  /// ```dart
  /// var snakeCaseStr = StrUtil.snakeCase("HelloWorld");
  /// print(snakeCaseStr); // 输出: "hello_world"
  /// ```
  static String snakeCase(String str) {
    return str.replaceAllMapped(RegExp(r'[A-Z]'), (Match match) {
      return '_${match[0]!.toLowerCase()}';
    }).toLowerCase();
  }

  /// 将字符串中的所有单词按照字典顺序排序。
  ///
  /// - str: 原始字符串。
  /// - 返回值: 排序后的字符串。
  /// - 示例：
  /// ```dart
  /// var sortedWordsStr = StrUtil.sortWords("world hello");
  /// print(sortedWordsStr); // 输出: "hello world"
  /// ```
  static String sortWords(String str) {
    List<String> words = str.split(' ');
    words.sort();
    return words.join(' ');
  }

  /// 将字符串中的所有单词按字母顺序排序。
  ///
  /// - str: 原始字符串。
  /// - 返回值: 单词按字母顺序排序后的字符串。
  /// - 示例：
  /// ```dart
  /// var sortAlphabeticallyStr = StrUtil.sortAlphabetically("world hello");
  /// print(sortAlphabeticallyStr); // 输出: "hello world"
  /// ```
  static String sortAlphabetically(String str) {
    var words = str.split(RegExp(r'\s+'));
    words.sort((a, b) => a.compareTo(b));
    return words.join(' ');
  }

  /// 将字符串分割为指定长度的子串列表。
  ///
  /// - str: 原始字符串。
  /// - chunkSize: 子串的长度。
  /// - 返回值: 子串列表。
  /// - 示例：
  /// ```dart
  /// var splitIntoChunksList = StrUtil.splitIntoChunks("hello world", 3);
  /// print(splitIntoChunksList); // 输出: ["hel", "lo ", "wor", "ld"]
  /// ```
  static List<String> splitIntoChunks(String str, int chunkSize) {
    return [
      for (int i = 0; i < str.length; i += chunkSize)
        str.substring(i, i + chunkSize)
    ];
  }

  /// 将字符串转换为List，按照指定的分隔符分割。
  ///
  /// - str: 原始字符串。
  /// - delimiter: 分隔符。
  /// - 返回值: 分割后的字符串列表。
  /// - 示例：
  /// ```dart
  /// var splitByDelimiterList = StrUtil.splitByDelimiter("hello,world", ",");
  /// print(splitByDelimiterList); // 输出: ["hello", "world"]
  /// ```
  static List<String> splitByDelimiter(String str, String delimiter) {
    return str.split(delimiter);
  }

  /// 将字符串转换为List，按照新行符分割。
  ///
  /// - str: 原始字符串。
  /// - 返回值: 分割后的字符串列表。
  /// - 示例：
  /// ```dart
  /// var splitByNewLineList = StrUtil.splitByNewLine("hello\nworld");
  /// print(splitByNewLineList); // 输出: ["hello", "world"]
  /// ```
  static List<String> splitByNewLine(String str) {
    return str.split('\n');
  }

  /// 将字符串中的每个单词首字母转换为大写。
  ///
  /// - str: 原始字符串。
  /// - 返回值: 每个单词首字母大写后的字符串。
  /// - 示例：
  /// ```dart
  /// var titleizeStr = StrUtil.titleize("hello world");
  /// print(titleizeStr); // 输出: "Hello World"
  /// ```
  static String titleize(String str) {
    return str.replaceAllMapped(
        RegExp(r'\b\w'), (Match m) => m.group(0)!.toUpperCase());
  }

  /// 将字符串转换为其ASCII码表示的字符串。
  ///
  /// - str: 原始字符串。
  /// - 返回值: ASCII码表示的字符串。
  /// - 示例：
  /// ```dart
  /// var toAsciiStringStr = StrUtil.toAsciiString("hello");
  /// print(toAsciiStringStr); // 输出: "104 101 108 108 111"
  /// ```
  static String toAsciiString(String str) {
    return str.codeUnits.map((c) => c.toString()).join(' ');
  }

  /// 将字符串转换为零宽字符表示。
  ///
  /// - str: 要转换的字符串。
  /// - 返回值: 转换为零宽字符表示的字符串。
  /// - 示例：
  /// ```dart
  /// var toZeroWidthStringStr = StrUtil.toZeroWidthString("hello");
  /// print(toZeroWidthStringStr); // 输出: 对应的零宽字符表示的字符串
  /// ```
  static String toZeroWidthString(String str) {
    return str.codeUnits.map((ch) => String.fromCharCode(0x200B + ch)).join();
  }

  /// 将字符串转换为首字母缩写词。
  ///
  /// - str: 原始字符串。
  /// - 返回值: 首字母缩写词。
  /// - 示例：
  /// ```dart
  /// var toAcronymStr = StrUtil.toAcronym("hello world");
  /// print(toAcronymStr); // 输出: "HW"
  /// ```
  static String toAcronym(String str) {
    return str
        .trim()
        .split(RegExp(r'\s+'))
        .map((word) => word[0].toUpperCase())
        .join();
  }

  /// 将字符串转换为其二进制表示的字符串。
  ///
  /// - str: 原始字符串。
  /// - 返回值: 二进制表示的字符串。
  /// - 示例：
  /// ```dart
  /// var toBinaryStringStr = StrUtil.toBinaryString("hello");
  /// print(toBinaryStringStr); // 输出: "1101000 1100101 1101100 1101100 1101111"
  /// ```
  static String toBinaryString(String str) {
    return str.codeUnits.map((c) => c.toRadixString(2)).join(' ');
  }

  /// 将字符串转换为安全的文件名（移除非法字符）。
  ///
  /// - str: 原始字符串。
  /// - 返回值: 安全的文件名。
  /// - 示例：
  /// ```dart
  /// var toSafeFileNameStr = StrUtil.toSafeFileName("hello:world.txt");
  /// print(toSafeFileNameStr); // 输出: "hello_world.txt"
  /// ```
  static String toSafeFileName(String str) {
    return str.replaceAll(RegExp(r'[\\/:*?"<>|]'), '_');
  }

  /// 将字符串转换为标题格式，忽略小词。
  ///
  /// - str: 原始字符串。
  /// - 返回值: 转换后的标题格式字符串。
  /// - 示例：
  /// ```dart
  /// var toTitleCaseIgnoringSmallWordsStr = StrUtil.toTitleCaseIgnoringSmallWords("hello and world");
  /// print(toTitleCaseIgnoringSmallWordsStr); // 输出: "Hello and World"
  /// ```
  static String toTitleCaseIgnoringSmallWords(String str) {
    var words = str.toLowerCase().split(' ');
    var smallWords = {
      'and',
      'or',
      'the',
      'a',
      'an',
      'in',
      'on',
      'at',
      'for',
      'with'
    };
    words = words.map((word) {
      if (smallWords.contains(word)) {
        return word;
      }
      return capitalize(word);
    }).toList();
    return words.join(' ');
  }

  /// 将字符串转换为Base64格式。
  ///
  /// - str: 要转换的字符串。
  /// - 返回值: 转换后的Base64字符串。
  /// - 示例：
  /// ```dart
  /// var toBase64Str = StrUtil.toBase64("hello world");
  /// print(toBase64Str); // 输出: "aGVsbG8gd29ybGQ="
  /// ```
  static String toBase64(String str) {
    return base64Encode(utf8.encode(str));
  }

  /// 将字符串转换为布尔值（处理字符串的ture）。
  ///
  /// - str: 要转换的字符串。
  /// - 返回值: 转换后的布尔值。
  /// - 示例：
  /// ```dart
  /// var toBooleanStr = StrUtil.toBoolean("true");
  /// print(toBooleanStr); // 输出: true
  /// ```
  static bool toBoolean(String str) {
    return str.toLowerCase() == 'true';
  }

  /// 将字符串转换为slug（URL友好格式）。
  ///
  /// - str: 原始字符串。
  /// - 返回值: 转换后的slug字符串。
  /// - 示例：
  /// ```dart
  /// var toSlugStr = StrUtil.toSlug("Hello World!");
  /// print(toSlugStr); // 输出: "hello-world"
  /// ```
  static String toSlug(String str) {
    return str
        .toLowerCase()
        .trim()
        .replaceAll(RegExp(r'\s+'), '-')
        .replaceAll(RegExp(r'[^a-z0-9-]'), '');
  }

  /// 修剪字符串的首尾指定字符。
  ///
  /// - str: 原始字符串。
  /// - char: 要修剪的字符。
  /// - 返回值: 修剪后的字符串。
  /// - 示例：
  /// ```dart
  /// var trimmedStr = StrUtil.trimCharFromEnds("!!hello!!", "!");
  /// print(trimmedStr); // 输出: "hello"
  /// ```
  static String trimCharFromEnds(String str, String char) {
    var regExp = RegExp('^$char+|$char+\$');
    return str.replaceAll(regExp, '');
  }

  /// 截断字符串到指定长度。
  ///
  /// - str: 要截断的字符串。
  /// - length: 指定的长度。
  /// - 返回值: 截断后的字符串。
  /// - 示例：
  /// ```dart
  /// var truncatedStr = StrUtil.truncate("hello world", 5);
  /// print(truncatedStr); // 输出: "hello"
  /// ```
  static String truncate(String str, int length) {
    return (str.length <= length) ? str : str.substring(0, length);
  }

  /// 将字符串中的每个单词的首字母大写。
  ///
  /// - str: 要处理的字符串。
  /// - 返回值: 处理后的字符串。
  /// - 示例：
  /// ```dart
  /// var titleCaseStr = StrUtil.titleCase("hello world");
  /// print(titleCaseStr); // 输出: "Hello World"
  /// ```
  static String titleCase(String str) {
    return str.replaceAllMapped(
      RegExp(r'\b\w'),
      (Match match) => match.group(0)!.toUpperCase(),
    );
  }

  /// 将字符串转换为int类型。
  ///
  /// - str: 要转换的字符串。
  /// - 返回值: 转换后的int值，如果无法转换则返回null。
  /// - 示例：
  /// ```dart
  /// var toIntStr = StrUtil.toInt("123");
  /// print(toIntStr); // 输出: 123
  /// ```
  static int? toInt(String str) {
    return int.tryParse(str);
  }

  /// 将字符串转换为List，每个元素是原字符串的一个字符。
  ///
  /// - str: 原始字符串。
  /// - 返回值: 字符串字符组成的List。
  /// - 示例：
  /// ```dart
  /// var toCharListStr = StrUtil.toCharList("hello");
  /// print(toCharListStr); // 输出: ['h', 'e', 'l', 'l', 'o']
  /// ```
  static List<String> toList(String str) {
    return str.split('');
  }

  /// 将字符串转换为double类型。
  ///
  /// - str: 要转换的字符串。
  /// - 返回值: 转换后的double值，如果无法转换则返回null。
  /// - 示例：
  /// ```dart
  /// var toDoubleStr = StrUtil.toDouble("123.45");
  /// print(toDoubleStr); // 输出: 123.45
  /// ```
  static double? toDouble(String str) {
    return double.tryParse(str);
  }

  /// 将字符串转换为日期时间对象。
  ///
  /// - str: 表示日期时间的字符串。
  /// - 返回值: 对应的DateTime对象，如果无法解析则返回null。
  /// - 示例：
  /// ```dart
  /// var toDateStr = StrUtil.toDate("2024-01-01");
  /// print(toDateStr); // 输出: DateTime对象表示的2024年1月1日
  /// ```
  static DateTime? toDate(String str) {
    try {
      return DateTime.parse(str);
    } catch (_) {
      return null;
    }
  }

  /// 移除字符串首尾的特定字符。
  ///
  /// - str: 原始字符串。
  /// - char: 要移除的字符。
  /// - 返回值: 移除首尾特定字符后的字符串。
  /// - 示例：
  /// ```dart
  /// var trimCharStr = StrUtil.trimChar("!!hello!!", "!");
  /// print(trimCharStr); // 输出: "hello"
  /// ```
  static String trimChar(String str, String char) {
    return str.trim().replaceAll(RegExp('^$char+|$char+\$'), '');
  }

  /// 将字符串中的特定单词转换为大写。
  ///
  /// - str: 原始字符串。
  /// - word: 要转换的单词。
  /// - 返回值: 转换后的字符串。
  /// - 示例：
  /// ```dart
  /// var uppercaseWordStr = StrUtil.uppercaseWord("hello world", "world");
  /// print(uppercaseWordStr); // 输出: "hello WORLD"
  /// ```
  static String uppercaseWord(String str, String word) {
    return str.replaceAll(word, word.toUpperCase());
  }

  /// 将转义的HTML字符串还原。
  ///
  /// - [str]: 要还原的字符串。
  /// - 返回值: 还原后的字符串。
  /// - 示例：
  /// ```dart
  /// var unescapedHtmlStr = StrUtil.unescapeHtml("&lt;div&gt;Hello World!&lt;/div&gt;");
  /// print(unescapedHtmlStr); // 输出: "<div>Hello World!</div>"
  /// ```
  static String unescapeHtml(String str) {
    var unescapedStr = str
        .replaceAll('&lt;', '<')
        .replaceAll('&gt;', '>')
        .replaceAll('&amp;', '&')
        .replaceAll('&quot;', '"')
        .replaceAll('&#x27;', '\'')
        .replaceAll('&#x2F;', '/');
    return unescapedStr;
  }

  /// 计算字符串的字节长度（UTF-8编码）。
  ///
  /// - str: 要计算的字符串。
  /// - 返回值: 字节长度。
  /// - 示例：
  /// ```dart
  /// var utf8LengthStr = StrUtil.utf8Length("hello");
  /// print(utf8LengthStr); // 输出: 5
  /// ```
  static int utf8Length(String str) {
    return utf8.encode(str).length;
  }

  /// 验证字符串是否符合指定的正则表达式。
  ///
  /// - str: 原始字符串。
  /// - regex: 正则表达式。
  /// - 返回值: 如果字符串符合正则表达式，则返回true，否则返回false。
  static bool validateRegex(String str, String regex) {
    return RegExp(regex).hasMatch(str);
  }

  /// 将字符串的单词按照指定的分隔符连接。
  ///
  /// - str: 原始字符串。
  /// - separator: 分隔符。
  /// - 返回值: 以分隔符连接的字符串。
  /// - 示例：
  /// ```dart
  /// var validateRegexStr = StrUtil.validateRegex("hello", r'^\w+$');
  /// print(validateRegexStr); // 输出: true
  /// ```
  static String wordsJoinWithSeparator(String str, String separator) {
    return str.split(RegExp(r'\s+')).join(separator);
  }

  /// 将字符串转换为小写，并替换所有空格为破折号。
  ///
  /// - str: 原始字符串。
  /// - 返回值: 转换后的字符串。
  /// - 示例：
  /// ```dart
  /// var convertedStr = xToDash("Hello World");
  /// print(convertedStr); // 输出: "hello-world"
  /// ```
  static String xToDash(String str) {
    return str.toLowerCase().replaceAll(' ', '-');
  }

  /// 年份格式化。
  ///
  /// - year: 要格式化的年份。
  /// - 返回值: 格式化后的年份字符串。
  /// - 示例：
  /// ```dart
  /// var formattedYear = yearFormat(2023);
  /// print(formattedYear); // 输出: "2023"
  /// ```
  static String yearFormat(int year) {
    return year.toString().padLeft(4, '0');
  }

  /// 将字符串转换为“是/否”表示。
  ///
  /// - str: 原始字符串。
  /// - 返回值: 如果字符串为"true", "yes", "y", "1"则返回"Yes"，否则返回"No"。
  /// - 示例：
  /// ```dart
  /// var result = yesOrNo("yes");
  /// print(result); // 输出: "Yes"
  /// ```
  static String yesOrNo(String str) {
    var lowerStr = str.toLowerCase();
    return (lowerStr == 'true' ||
            lowerStr == 'yes' ||
            lowerStr == 'y' ||
            lowerStr == '1')
        ? 'Yes'
        : 'No';
  }

  /// 将两个字符串压缩（zip）成一对的列表。
  ///
  /// - str1: 第一个字符串。
  /// - str2: 第二个字符串。
  /// - 返回值: 由第一个和第二个字符串中的字符对组成的列表。
  /// - 示例：
  /// ```dart
  /// var zippedList = zipStrings("abc", "123");
  /// print(zippedList); // 输出: [{"str1": "a", "str2": "1"}, {"str1": "b", "str2": "2"}, {"str1": "c", "str2": "3"}]
  /// ```
  static List<Map<String, String>> zip(String str1, String str2) {
    int minLength = min(str1.length, str2.length);
    return List.generate(minLength, (index) {
      return {'str1': str1[index], 'str2': str2[index]};
    });
  }

  /// 将字符串转换为使用零宽空格的隐写形式。
  ///
  /// - str: 要转换的字符串。
  /// - 返回值: 使用零宽空格编码的字符串。
  /// ```dart
  /// var encodedStr = zeroWidthEncode("secret");
  /// print(encodedStr); // 输出: "零宽空格编码的字符串"
  /// ```
  static String zeroWidthEncode(String str) {
    return str.codeUnits
        .map((unit) => unit.toRadixString(2).padLeft(8, '0'))
        .join('\u200B');
  }

  /// 从使用零宽空格编码的字符串中解码出原始字符串。
  ///
  /// - str: 使用零宽空格编码的字符串。
  /// - 返回值: 解码后的原始字符串。
  /// - 示例：
  /// ```dart
  /// var decodedStr = zeroWidthDecode("零宽空格编码的字符串");
  /// print(decodedStr); // 输出: "secret"
  /// ```
  static String zeroWidthDecode(String str) {
    var binaryStr = str.split('\u200B').join();
    return String.fromCharCodes(
      RegExp(r'.{8}')
          .allMatches(binaryStr)
          .map((match) => int.parse(match.group(0)!, radix: 2)),
    );
  }

  /// 对字符串执行简单的压缩算法（使用重复字符计数）。
  ///
  /// - str: 要压缩的字符串。
  /// - 返回值: 压缩后的字符串。
  /// - 示例：
  /// ```dart
  /// var compressedStr = zipCompress("aaabbbcc");
  /// print(compressedStr); // 输出: "a3b3c2"
  /// ```
  static String zipCompress(String str) {
    return str.replaceAllMapped(RegExp(r'(.)\1+'),
        (match) => '${match.group(0)![0]}${match.group(0)!.length}');
  }

  /// 解压使用简单压缩算法压缩的字符串。
  ///
  /// - str: 要解压的字符串。
  /// - 返回值: 解压后的字符串。
  /// - 示例：
  /// ```dart
  /// var decompressedStr = zipDecompress("a3b3c2");
  /// print(decompressedStr); // 输出: "aaabbbcc"
  /// ```
  static String zipDecompress(String str) {
    return str.replaceAllMapped(RegExp(r'(.)\d+'),
        (match) => match.group(1)! * int.parse(match.group(0)!.substring(1)));
  }

  /// 使用指定的分隔符将字符串转换为“键-值”对的映射。
  ///
  /// - str: 要处理的字符串。
  /// - delimiter: 键和值之间的分隔符。
  /// - 返回值: “键-值”对的映射。
  /// - 示例：
  /// ```dart
  /// var keyValueMap = zipToMap("key1=value1&key2=value2", "&");
  /// print(keyValueMap); // 输出: {"key1": "value1", "key2": "value2"}
  /// ```
  static Map<String, String> zipToMap(String str, String delimiter) {
    return {
      for (var item in str.split(delimiter))
        item.split('=')[0]: item.split('=')[1]
    };
  }
}
