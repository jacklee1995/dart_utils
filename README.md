# The Utils

A Dart and Flutter utils library.

[中文文档](https://github.com/jacklee1995/dart_utils/blob/master/README_CN.md)


## String Utils



```dart
import 'package:the_utils/the_utils.dart';

var isIPv4 = StrUtil.isIPv4("192.168.1.1");
print(isIPv4); // outputs: true
```

You can find examples of each method in the code comments.

| Method | Description |
|--------|-------------|
| `capitalize` | Converts the first letter of a string to uppercase. |
| `capitalizeWords` | Replaces specific words in a string with their uppercase forms. |
| `containsChinese` | Checks if the string contains Chinese characters. |
| `countCharOccurrences` | Counts the occurrences of a specific character in a string. |
| `countOccurrences` | Counts the occurrences of a specific character or substring in a string. |
| `camelCase` | Converts a string to camel case naming format. |
| `contains` | Checks if the string contains a specific substring. |
| `endsWith` | Checks if the string ends with a specific substring. |
| `escapeHtml` | Escapes HTML special characters in a string. |
| `extractNumbers` | Extracts numbers from a string into a list. |
| `fromBase64` | Decodes a string from Base64 format. |
| `fromIni` | Parses an INI format string. |
| `formatNumberWithCommas` | Formats a string as a comma-separated number. |
| `getHashCode` | Gets the hash code of a string. |
| `isZAlphabetical` | Checks if the characters in the string are in alphabetical order. |
| `isHex` | Checks if the string is a valid hexadecimal number. |
| `isAlpha` | Checks if the string contains only letters. |
| `isAlphanumeric` | Checks if the string contains only letters and numbers. |
| `isNumeric` | Checks if the string contains only numbers. |
| `isUrl` | Checks if the string is a valid URL. |
| `isEmail` | Checks if the string is a valid email address. |
| `isAsset` | Checks if the string is a valid Flutter asset path. |
| `isDigitOnly` | Determines if the string is composed of only digits. |
| `isWhitespace` | Checks if the string contains only whitespace and newline characters. |
| `isEmpty` | Checks if the string is empty. |
| `isNullOrEmpty` | Checks if the string is null or empty. |
| `isNullEmptyOrWhitespace` | Checks if the string is null, empty, or contains only whitespace. |
| `isValidUsername` | Checks if the string is a valid username. |
| `isNotEmpty` | Checks if the string is not empty. |
| `isBlank` | Checks if the string contains only spaces. |
| `isLowerCase` | Checks if all the characters in the string are lowercase. |
| `isUpperCase` | Checks if all the characters in the string are uppercase. |
| `isPalindrome` | Checks if the string is a palindrome. |
| `isDateTime` | Checks if the string is a valid datetime format. |
| `isCreditCard` | Checks if the string is a valid credit card number. |
| `isFilePath` | Checks if the string is a valid file path. |
| `isIPv4` | Checks if the string is a valid IPv4 address. |
| `isIPv6` | Checks if the string is a valid IPv6 address. |
| `isBase64` | Checks if the string matches the Base64 format. |
| `isJson` | Checks if the string is valid JSON format. |
| `isPhoneNumber` | Checks if the string matches the phone number format. |
| `isSimplePassword` | Checks if the string meets simple password rules. |
| `isSpace` | Checks if the string contains only space characters. |
| `isLicensePlate` | Checks if the string is a valid license plate number. |
| `kebabCase` | Converts a string to kebab case format. |
| `lowercaseWords` | Replaces specific words in a string with their lowercase forms. |
| `lowercaseFirstLetterOfEachWord` | Converts the first letter of each word in the string to lowercase. |
| `matchesPattern` | Checks if the string matches a specified regular expression. |
| `nTimesRepeat` | Converts the string to an n-times repeated form. |
| `onlyDigits` | Retrieves the digits from the string. |
| `padLeft` | Pads the string on the left to a specified length. |
| `padRight` | Pads the string on the right to a specified length. |
| `repeat` | Repeats the string a specified number of times. |
| `randomString` | Generates a random string of a specified length. |
| `replace` | Replaces substrings within the string. |
| `replaceWords` | Replaces specific words in a string with a specified mapping. |
| `replaceWithCallback` | Replaces specific patterns in a string with strings returned by a callback function. |
| `removeSubstring` | Removes a specific substring from the string. |
| `removeNonNumeric` | Removes all non-numeric characters from the string. |
| `removeHtmlTags` | Removes HTML tags from the string. |
| `replaceChars` | Replaces each character in the string with a specified mapping character. |
| `replaceWord` | Replaces a specific word in the string with another word. |
| `removeDigits` | Removes all digits from the string. |
| `reverse` | Reverses the string. |
| `reverseSnakeCase` | Converts the string to a reversed snake case format. |
| `removeChar` | Removes a specific character from the string. |
| `removeSpaces` | Removes all spaces from the string. |
| `replaceMultipleSpacesWithSingle` | Replaces multiple spaces in the string with a single space. |
| `removeChinese` | Removes Chinese characters from the string. |
| `replaceNewLines` | Replaces new line characters in the string with a specific string. |
| `reverseCamelCase` | Converts the string to a reversed camel case format. |
| `randomAlphabetic` | Generates a random alphabetic string of a specified length. |
| `substringFromIndex` | Extracts a specific length of substring from a specified position in the string. |
| `snakeCase` | Converts the string to a snake case format. |
| `sortWords` | Sorts all the words in the string in dictionary order. |
| `sortAlphabetically` | Sorts all the words in the string alphabetically. |
| `splitIntoChunks` | Splits the string into substrings of a specified length. |
| `splitByDelimiter` | Converts the string to a list, split by a specified delimiter. |
| `splitByNewLine` | Converts the string to a list, split by new line characters. |
| `titleize` | Converts the first letter of each word in the string to uppercase. |
| `toAsciiString` | Converts the string to its ASCII code representation. |
| `toZeroWidthString` | Converts the string to a zero-width character representation. |
| `toAcronym` | Converts the string to an acronym form. |
| `toBinaryString` | Converts the string to its binary representation. |
| `toSafeFileName` | Converts the string to a safe file name by removing illegal characters. |
| `toTitleCaseIgnoringSmallWords` | Converts the string to title case format, ignoring small words. |
| `toBase64` | Converts the string to Base64 format. |
| `toBoolean` | Converts the string to a boolean value. |
| `toSlug` | Converts the string to a slug (URL-friendly format). |
| `trimCharFromEnds` | Trims a specified character from the start and end of the string. |
| `truncate` | Truncates the string to a specified length. |
| `titleCase` | Converts the first letter of each word in the string to uppercase. |
| `toInt` | Converts the string to an int type. |
| `toList` | Converts the string to a list, with each element being a character of the original string. |
| `toDouble` | Converts the string to a double type. |
| `toDate` | Converts the string to a datetime object. |
| `trimChar` | Removes a specified character from the start and end of the string. |
| `uppercaseWord` | Converts a specific word in the string to uppercase. |
| `unescapeHtml` | Restores an escaped HTML string. |
| `utf8Length` | Calculates the byte length of the string (UTF-8 encoding). |
| `validateRegex` | Validates if the string matches a specified regular expression. |
| `wordsJoinWithSeparator` | Joins the words in the string with a specified separator. |
| `xToDash` | Converts the string to lowercase and replaces all spaces with dashes. |
| `yearFormat` | Formats a year. |
| `yesOrNo` | Converts the string to a "Yes/No" representation. |
| `zip` | Zips two strings into a list of pairs. |
| `zeroWidthEncode` | Converts the string to a zero-width space encoded form. |
| `zeroWidthDecode` | Decodes the original string from a zero-width space encoded string. |
| `zipCompress` | Applies a simple compression algorithm to the string (using repeated character counts). |
| `zipDecompress` | Decompresses a string compressed with a simple compression algorithm. |
| `zipToMap` | Converts the string to a map of "key-value" pairs using a specified delimiter. |
