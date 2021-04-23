### Grep Command In Unix With Simple Examples

Grep command in Unix/Linux is the short form of ‘global search for the regular expression’.

The grep command is a filter that is used to search for lines matching a specified pattern and print the matching lines to standard output.

### Grep Command in Unix with Examples

**Syntax:**

```
grep [options] [pattern] [file]
```

The pattern is specified as a regular expression. A regular expression is a string of characters that is used to specify a pattern matching rule. Special characters are used to define the matching rules and positions.

**#1) Anchor Characters:** ‘^’ and ‘$’ at the beginning and end of the pattern are used to anchor the pattern to the start of the line, and to the end of the line respectively.

**Example:** “^Name” matches all lines that start with the string “Name”. The strings “\<” and “\>” are used to anchor the pattern to the start and end of a word respectively.

**#2) Wildcard Character:** ‘.’ Is used to match any character.

**Example:**“^.$” will match all lines with any single character.

**#3) Escaped Characters:** Any of the special characters can be matched as a regular character by escaping them with a ‘\’.

**Example:** “\$\*” will match the lines that contain the string “$*”

**#4) Character Range:** A set of characters enclosed in a ‘[‘ and ‘]’ pair specify a range of characters to be matched.

**Example:** “[aeiou]” will match all lines that contain a vowel. A hyphen can be used while specifying a range to shorten a set of consecutive characters. **E.g.** “[0-9]” will match all lines that contain a digit. A carat can be used at the beginning of the range to specify a negative range. **E.g.** “[^xyz]” will match all lines that do not contain x, y or z.

**#5) Repetition Modifier:** A ‘*’ after a character or group of characters is used to allow matching zero or more instances of the preceding pattern.

**The grep command supports a number of options for additional controls on the matching:**

- -i: performs a case-insensitive search.
- -n: displays the lines containing the pattern along with the line numbers.
- -v: displays the lines not containing the specified pattern.
- -c: displays the count of the matching patterns.

**Examples:**

- Match all lines that start with ‘hello’. **E.g:** “hello there”

```bash
$ grep “^hello” file1
```

- Match all lines that end with ‘done’. **E.g:** “well done”

```bash
$ grep “done$” file1
```

- Match all lines that contain any of the letters ‘a’, ‘b’, ‘c’, ‘d’ or ‘e’.

```bash
$ grep “[a-e]” file1
```

- Match all lines that do not contain a vowel

```bash
$ grep “[^aeiou]” file1
```

- Match all lines that start with a digit following zero or more spaces. **E.g:** “ 1.” or “2.”

```bash
$ grep “ *[0-9]” file1
```

- Match all lines that contain the word hello in upper-case or lower-case

```bash
$ grep -i “hello”
```