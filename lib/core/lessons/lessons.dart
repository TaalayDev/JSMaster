import 'package:flutter_vector_icons/flutter_vector_icons.dart';

import '../../data.dart';

String validator(String code, String check) => '''
  $code

  $check
''';

final List<Lesson> lessonsList = [
  const Lesson(
    id: '1',
    title: 'Introduction to JavaScript',
    description:
        'This lesson covers the basics of JavaScript, including syntax, variables, and data types, setting a foundation for deeper understanding.',
    sections: [
      LessonSection(
        content: '''
JavaScript is a versatile programming language primarily used for web development. It allows developers to create dynamic, interactive web applications.

Here are some key things to know about JavaScript:
- It is a high-level, interpreted language.
- JavaScript can be used on both the client-side (in browsers) and server-side (with environments like Node.js).
- It is the backbone of web technologies, alongside HTML and CSS.
      ''',
        exercises: [],
      ),
      LessonSection(
        content: '''
Let's start with some basic syntax in JavaScript.

1. Comments: You can write comments to explain your code. Comments are ignored by the browser.
   - Single line comment: `// This is a comment`
   - Multi-line comment: `/* This is a comment */`

2. Console: `console.log()` is used to print messages to the browser's console, often for debugging purposes.
      ''',
        codeExample: '''
// Single line comment
console.log('Hello, JavaScript!');  // Prints: Hello, JavaScript!

/* Multi-line comment */
console.log('This is a multi-line comment example');
      ''',
        exercises: [
          Exercise(
            question:
                'Write a program that prints "Welcome to JavaScript" to the console.',
            initialCode: '// Write your code here',
            validate: '''
              const isValid = (function() {
                const logs = consoleLog.join('\\n');
                return logs === 'Welcome to JavaScript';
              })();
            ''',
          ),
        ],
      ),
    ],
    difficulty: 'Beginner',
    durationMinutes: 15,
    icon: Feather.book_open,
  ),
  const Lesson(
    id: '2',
    title: 'Variables and Constants',
    description:
        'Learn how to declare and use variables and constants in JavaScript, understanding their differences and best practices.',
    sections: [
      LessonSection(
        content: '''
Variables and constants are fundamental concepts in JavaScript. They allow you to store and manipulate data in your programs.

1. Variables (let):
   - Variables are containers for storing data values.
   - They can be declared using the 'let' keyword.
   - The value of a variable can be changed after it's declared.

2. Constants (const):
   - Constants are also used to store data, but their value cannot be changed once set.
   - They are declared using the 'const' keyword.
   - Use constants for values that should not be reassigned.

3. var (older way):
   - 'var' is an older way to declare variables in JavaScript.
   - It's function-scoped rather than block-scoped like 'let' and 'const'.
   - It's generally recommended to use 'let' and 'const' in modern JavaScript.
      ''',
        codeExample: '''
// Variable declaration and assignment
let age = 25;
console.log(age); // Output: 25

age = 26; // You can change the value of a variable
console.log(age); // Output: 26

// Constant declaration
const PI = 3.14159;
console.log(PI); // Output: 3.14159

// PI = 3.14; // This would cause an error because you can't reassign a constant

// Using var (older way)
var name = "John";
console.log(name); // Output: John
      ''',
        exercises: [
          Exercise(
            question:
                'Declare a variable named "score" and assign it the value 100.',
            initialCode: '// Write your code here',
            validate: '''
              const isValid = (function() {
                return score === 100;
              })();
            ''',
          ),
          Exercise(
            question:
                'Declare a constant named "MAX_LEVEL" and assign it the value 50.',
            initialCode: '// Write your code here',
            validate: '''
              const isValid = (function() {
                return MAX_LEVEL === 50 && /const MAX_LEVEL/.test(code);
              })();
            ''',
          ),
        ],
      ),
      LessonSection(
        content: '''
Best Practices for Using Variables and Constants:

1. Use descriptive names: Choose variable and constant names that clearly describe their purpose.
2. Use camelCase for variables and constants: e.g., userAge, maxScore.
3. Use UPPERCASE_WITH_UNDERSCORES for constants that are truly fixed values: e.g., MAX_ITEMS, PI.
4. Prefer 'const' over 'let' when the value won't change: This helps prevent accidental reassignment.
5. Declare variables at the top of their scope: This makes it easier to see all variables used in a block.
6. Avoid using 'var': Stick to 'let' and 'const' for clearer scoping rules.

Remember: JavaScript is a dynamically typed language, which means you don't need to specify the data type when declaring variables or constants. The type is inferred from the assigned value.
      ''',
        codeExample: '''
// Good practices
const MAX_USERS = 100;
let currentUserCount = 0;

function addUser(username) {
  if (currentUserCount < MAX_USERS) {
    // Add user logic here
    currentUserCount++;
    console.log(`Added user: \${username}`);
  } else {
    console.log("Cannot add user. Maximum user limit reached.");
  }
}

addUser("Alice");
console.log(currentUserCount); // Output: 1

// Bad practice (avoid using var)
var temp = 72; // Use 'let' instead
      ''',
        exercises: [
          Exercise(
            question:
                'Declare a variable for a user\'s age and a constant for the minimum voting age. Then write an if statement to check if the user can vote.',
            initialCode: '''
// Declare your variables and constant here

// Write your if statement here
''',
            validate: '''
              const isValid = (function() {
                let varMatch = code.match(/let (\\w+) =/);
                let constMatch = code.match(/const (\\w+) =/);

                if (!varMatch || !constMatch) return false;

                let varName = varMatch[1];
                let constName = constMatch[1];

                let varValue = eval(varName);
                let constValue = eval(constName);

                let isVarNumber = typeof varValue === 'number';
                let isConstNumber = typeof constValue === 'number';

                let isIfStatement = /if \\(.+?\\) {/.test(code);
                let isConditionCorrect = code.includes(\`if (\${varName} >= \${constName})\`);

                return isVarNumber && isConstNumber && isIfStatement && isConditionCorrect;
              })();
            ''',
          ),
        ],
      ),
    ],
    difficulty: 'Beginner',
    durationMinutes: 25,
    icon: Feather.database,
  ),
  const Lesson(
    id: '3',
    title: 'Data Types and Structures',
    description:
        'Explore the fundamental data types in JavaScript and learn about basic data structures like arrays and objects.',
    sections: [
      LessonSection(
        content: '''
JavaScript has several basic data types that are essential to understand:

1. Primitive Data Types:
   - Number: Represents both integer and floating-point numbers.
   - String: Represents textual data, enclosed in single or double quotes.
   - Boolean: Represents a logical entity with two values: true or false.
   - Undefined: Represents a variable that has been declared but not assigned a value.
   - Null: Represents a deliberate non-value or absence of any object value.

2. Complex Data Types:
   - Object: A collection of key-value pairs.
   - Array: An ordered list of values, a special type of object.

Understanding these data types is crucial for effective JavaScript programming.
      ''',
        codeExample: '''
// Number
let age = 25;
let price = 9.99;

// String
let name = "Alice";
let greeting = 'Hello, World!';

// Boolean
let isStudent = true;
let hasLicense = false;

// Undefined
let job;

// Null
let salary = null;

// Checking types
console.log(typeof age);       // "number"
console.log(typeof name);      // "string"
console.log(typeof isStudent); // "boolean"
console.log(typeof job);       // "undefined"
console.log(typeof salary);    // "object" (this is a quirk in JavaScript)
      ''',
        exercises: [
          Exercise(
            question:
                'Declare a variable called "temperature" and assign it the value 72.',
            initialCode: '// Write your code here',
            validate: '''
              const isValid = (function() {
                return temperature === 72;
              })();
            ''',
          ),
          Exercise(
            question:
                'Create a string variable called "city" with the value "New York".',
            initialCode: '// Write your code here',
            validate: '''
              const isValid = (function() {
                return city === "New York";
              })();
            ''',
          ),
        ],
      ),
      LessonSection(
        content: '''
Arrays and Objects are two important data structures in JavaScript:

1. Arrays:
   - Arrays are used to store multiple values in a single variable.
   - They are created using square brackets [].
   - Array elements are accessed using their index (starting from 0).

2. Objects:
   - Objects are used to store collections of data in key-value pairs.
   - They are created using curly braces {}.
   - Object properties can be accessed using dot notation or bracket notation.

Both arrays and objects can store different types of data.
      ''',
        codeExample: '''
// Arrays
let fruits = ["apple", "banana", "orange"];
console.log(fruits[0]);  // "apple"
console.log(fruits[1]);  // "banana"
console.log(fruits.length);  // 3

// Objects
let person = {
  name: "Bob",
  age: 30,
  isStudent: false
};

console.log(person.name);  // "Bob"
console.log(person["age"]);  // 30

// Adding new elements
fruits[3] = "grape";
person.city = "London";

console.log(fruits[3]);  // "grape"
console.log(person.city);  // "London"
      ''',
        exercises: [
          Exercise(
            question:
                'Create an array called "colors" with three color names of your choice.',
            initialCode: '// Write your code here',
            validate: '''
              const isValid = (function() {
                return colors.length === 3 && Array.isArray(colors);
              })();
            ''',
          ),
          Exercise(
            question:
                'Create an object called "book" with properties for title and author.',
            initialCode: '// Write your code here',
            validate: '''
              const isValid = (function() {
                return book.hasOwnProperty("title") && book.hasOwnProperty("author");
              })();
            ''',
          ),
        ],
      ),
    ],
    difficulty: 'Beginner',
    durationMinutes: 25,
    icon: Feather.layers,
  ),
  const Lesson(
    id: '4',
    title: 'Operators and Expressions',
    description:
        'Learn about different types of operators in JavaScript and how to use them to form expressions. Understand arithmetic, comparison, and logical operators.',
    sections: [
      LessonSection(
        content: '''
Operators in JavaScript are symbols that perform operations on operands (values and variables). Expressions are combinations of values, variables, and operators that can be evaluated to produce a result.

1. Arithmetic Operators:
   - Addition (+)
   - Subtraction (-)
   - Multiplication (*)
   - Division (/)
   - Modulus (%) - returns the remainder of a division
   - Increment (++) - increases a value by 1
   - Decrement (--) - decreases a value by 1

2. Assignment Operators:
   - Assign a value (=)
   - Add and assign (+=)
   - Subtract and assign (-=)
   - Multiply and assign (*=)
   - Divide and assign (/=)

Let's see these operators in action:
      ''',
        codeExample: '''
// Arithmetic operators
let a = 10;
let b = 3;

console.log(a + b);  // 13
console.log(a - b);  // 7
console.log(a * b);  // 30
console.log(a / b);  // 3.3333...
console.log(a % b);  // 1 (remainder of 10 divided by 3)

let c = 5;
c++;  // Increment
console.log(c);  // 6
c--;  // Decrement
console.log(c);  // 5

// Assignment operators
let x = 20;
x += 5;  // Same as: x = x + 5
console.log(x);  // 25

x -= 3;  // Same as: x = x - 3
console.log(x);  // 22

x *= 2;  // Same as: x = x * 2
console.log(x);  // 44

x /= 4;  // Same as: x = x / 4
console.log(x);  // 11
      ''',
        exercises: [
          Exercise(
            question:
                'Create two variables, "num1" with value 15 and "num2" with value 4. Then create a third variable "result" that stores the remainder when num1 is divided by num2.',
            initialCode: '''
// Write your code here
''',
            validate: '''
              const isValid = (function() {
                return result === 3 && /let result = num1 % num2/.test(code);
              })();
            ''',
          ),
          Exercise(
            question:
                'Create a variable "count" with initial value 10. Use the increment operator to increase its value by 1, then multiply the result by 3 using the multiplication assignment operator.',
            initialCode: '''
// Write your code here
''',
            validate: '''
              const isValid = (function() {
                return count === 33 
                  && /let count = 10;/.test(code) 
                  && /count\+\+/.test(code) 
                  && (/count \*= 3/.test(code) || /count \* 3/.test(code));
              })();
            ''',
          ),
        ],
      ),
      LessonSection(
        content: '''
3. Comparison Operators:
   - Equal to (==)
   - Strict equal to (===) - compares both value and type
   - Not equal to (!=)
   - Strict not equal to (!==)
   - Greater than (>)
   - Less than (<)
   - Greater than or equal to (>=)
   - Less than or equal to (<=)

4. Logical Operators:
   - AND (&&) - returns true if both operands are true
   - OR (||) - returns true if at least one operand is true
   - NOT (!) - reverses the boolean value

These operators are often used in conditional statements, which we'll cover in more detail in future lessons.
      ''',
        codeExample: '''
// Comparison operators
let p = 5;
let q = "5";

console.log(p == q);   // true (values are equal)
console.log(p === q);  // false (values are equal, but types are different)
console.log(p != q);   // false
console.log(p !== q);  // true

console.log(p > 3);    // true
console.log(p < 3);    // false
console.log(p >= 5);   // true
console.log(p <= 5);   // true

// Logical operators
let isAdult = true;
let hasLicense = false;

console.log(isAdult && hasLicense);  // false
console.log(isAdult || hasLicense);  // true
console.log(!isAdult);               // false

// Combining operators
let age = 25;
let hasPermission = true;
let canAccess = age >= 18 && hasPermission;
console.log(canAccess);  // true
      ''',
        exercises: [
          Exercise(
            question:
                'Create two variables: "num" with value 10 and "text" with value "10". Use the strict equality operator to compare them and store the result in a variable called "isStrictlyEqual".',
            initialCode: '''
// Write your code here
''',
            validate: '''
              const isValid = (function() {
                return isStrictlyEqual === false 
                  && /===/.test(code) 
                  && num === 10 
                  && text === "10";
              })();
            ''',
          ),
          Exercise(
            question:
                'Create two boolean variables: "isSunny" (true) and "isWarm" (false). Use the logical OR operator to check if either condition is true, and store the result in a variable called "niceWeather".',
            initialCode: '''
// Write your code here
''',
            validate: '''
              const isValid = (function() {
                return niceWeather === true 
                  && /\\|\\|/.test(code) 
                  && isSunny === true 
                  && isWarm === false;
              })();
            ''',
          ),
        ],
      ),
    ],
    difficulty: 'Beginner',
    durationMinutes: 30,
    icon: Feather.plus,
  ),
  const Lesson(
    id: '5',
    title: 'Working with Strings',
    description:
        'Learn how to create, manipulate, and work with strings in JavaScript. Understand basic string operations and commonly used string methods.',
    sections: [
      LessonSection(
        content: '''
Strings in JavaScript are used to represent text. They can be created using single quotes (''), double quotes (""), or backticks (``).

Key points about strings:
1. Strings are immutable, meaning once created, they cannot be changed.
2. JavaScript provides many built-in methods to work with strings.
3. String indices start at 0 for the first character.

Let's explore some basic string operations:
      ''',
        codeExample: '''
// Creating strings
let singleQuotes = 'Hello';
let doubleQuotes = "World";
let backticks = `JavaScript`;

// Concatenation
let greeting = singleQuotes + " " + doubleQuotes;
console.log(greeting);  // "Hello World"

// String length
console.log(greeting.length);  // 11

// Accessing characters
console.log(greeting[0]);  // "H"
console.log(greeting[6]);  // "W"

// Strings are immutable
greeting[0] = "h";  // This doesn't change the string
console.log(greeting);  // Still "Hello World"

// Template literals (with backticks)
let name = "Alice";
let message = `Welcome, \${name}!`;
console.log(message);  // "Welcome, Alice!"
      ''',
        exercises: [
          Exercise(
            question:
                'Create a string variable called "language" with the value "JavaScript".',
            initialCode: '// Write your code here',
            validate: '''
              const isValid = (function() {
                return language === "JavaScript";
              })();
            ''',
          ),
          Exercise(
            question:
                'Using the "language" variable, create a new string that says "I am learning JavaScript!" and store it in a variable called "learningMessage".',
            initialCode: '''
let language = "JavaScript";
// Write your code here
''',
            validate: '''
              const isValid = (function() {
                return learningMessage === "I am learning JavaScript!"
                  && (/\\+/.test(code) || /\\\$\\{language\\}/.test(code));
              })();
            ''',
          ),
        ],
      ),
      LessonSection(
        content: '''
JavaScript provides many useful methods for working with strings. Here are some commonly used ones:

1. toUpperCase() and toLowerCase(): Convert a string to all uppercase or lowercase.
2. trim(): Removes whitespace from both ends of a string.
3. substring(start, end): Extracts a portion of a string between two indices.
4. indexOf(substring): Returns the index of the first occurrence of a substring.
5. replace(search, replacement): Replaces a specified value with another value in a string.

Let's see these methods in action:
      ''',
        codeExample: '''
let text = "  Hello, World!  ";

// toUpperCase() and toLowerCase()
console.log(text.toUpperCase());  // "  HELLO, WORLD!  "
console.log(text.toLowerCase());  // "  hello, world!  "

// trim()
console.log(text.trim());  // "Hello, World!"

// substring(start, end)
console.log(text.substring(2, 7));  // "Hello"

// indexOf(substring)
console.log(text.indexOf("World"));  // 9

// replace(search, replacement)
console.log(text.replace("World", "JavaScript"));  // "  Hello, JavaScript!  "

// Chaining methods
let result = text.trim().toLowerCase().replace("world", "javascript");
console.log(result);  // "hello, javascript!"
      ''',
        exercises: [
          Exercise(
            question:
                'Create a variable called "email" with the value "   USER@EXAMPLE.COM   ". Then, create a new variable called "cleanEmail" that contains the email in lowercase with no leading or trailing spaces.',
            initialCode: '''
let email = "   USER@EXAMPLE.COM   ";
// Write your code here
''',
            validate: '''
              const isValid = (function() {
                return cleanEmail === "user@example.com" && /trim/.test(code) && /toLowerCase/.test(code);
              })();
            ''',
          ),
          Exercise(
            question:
                'Using the string "JavaScript is awesome", create a new string that replaces "awesome" with "amazing" and store it in a variable called "newPhrase".',
            initialCode: '''
let phrase = "JavaScript is awesome";
// Write your code here
''',
            validate: '''
              const isValid = (function() {
                return newPhrase === "JavaScript is amazing" && /replace/.test(code);
              })();
            ''',
          ),
        ],
      ),
    ],
    difficulty: 'Beginner',
    durationMinutes: 25,
    icon: Feather.type,
  ),
  const Lesson(
    id: '6',
    title: 'Numbers and the Math Object',
    description:
        'Explore number operations in JavaScript and learn how to use the built-in Math object for more complex mathematical operations.',
    sections: [
      LessonSection(
        content: '''
In JavaScript, numbers can be integers (whole numbers) or floating-point (decimal) numbers. There's no separate integer type; all numbers are represented as 64-bit floating-point values.

Key points about numbers:
1. JavaScript uses the number type for both integers and floating-point numbers.
2. Special number values include Infinity, -Infinity, and NaN (Not a Number).
3. Be cautious with floating-point precision in calculations.

Let's explore some number operations:
      ''',
        codeExample: '''
// Basic number operations
let x = 10;
let y = 3;

console.log(x + y);  // 13
console.log(x - y);  // 7
console.log(x * y);  // 30
console.log(x / y);  // 3.3333...

// Integer division (using Math.floor)
console.log(Math.floor(x / y));  // 3

// Modulus (remainder)
console.log(x % y);  // 1

// Exponentiation
console.log(x ** 2);  // 100 (10 squared)

// Special number values
console.log(1 / 0);   // Infinity
console.log(-1 / 0);  // -Infinity
console.log(0 / 0);   // NaN

// Be careful with floating-point precision
console.log(0.1 + 0.2);  // 0.30000000000000004
console.log(0.1 + 0.2 === 0.3);  // false
      ''',
        exercises: [
          Exercise(
            question:
                'Create two variables, "width" with value 7.5 and "height" with value 3. Calculate the area and store it in a variable called "area".',
            initialCode: '''
// Write your code here
''',
            validate: '''
              const isValid = (function() {
                return Math.abs(area - 22.5) < 0.0001;
              })();
            ''',
          ),
          Exercise(
            question:
                'Create a variable "number" with value 17. Use the modulus operator to check if it\'s odd or even. Store the result (0 for even, 1 for odd) in a variable called "oddOrEven".',
            initialCode: '''
// Write your code here
''',
            validate: '''
              const isValid = (function() {
                return oddOrEven === 1 && /%/.test(code);
              })();
            ''',
          ),
        ],
      ),
      LessonSection(
        content: '''
The Math object in JavaScript provides properties and methods for mathematical constants and functions. It's a built-in object that you can use without importing anything.

Some commonly used Math properties and methods:

1. Math.PI: The ratio of a circle's circumference to its diameter (≈3.14159)
2. Math.round(x): Rounds x to the nearest integer
3. Math.floor(x): Rounds x down to the nearest integer
4. Math.ceil(x): Rounds x up to the nearest integer
5. Math.abs(x): Returns the absolute value of x
6. Math.max(x, y, ...): Returns the largest of the given numbers
7. Math.min(x, y, ...): Returns the smallest of the given numbers
8. Math.random(): Returns a random number between 0 (inclusive) and 1 (exclusive)

Let's see these in action:
      ''',
        codeExample: '''
// Using Math constants
console.log(Math.PI);  // 3.141592653589793

// Rounding methods
console.log(Math.round(4.7));  // 5
console.log(Math.round(4.4));  // 4
console.log(Math.floor(4.7));  // 4
console.log(Math.ceil(4.4));   // 5

// Absolute value
console.log(Math.abs(-5));  // 5

// Max and Min
console.log(Math.max(5, 10, 3));  // 10
console.log(Math.min(5, 10, 3));  // 3

// Random number
console.log(Math.random());  // Random number between 0 and 1

// Generate a random integer between 1 and 10
let randomInt = Math.floor(Math.random() * 10) + 1;
console.log(randomInt);  // Random integer between 1 and 10
      ''',
        exercises: [
          Exercise(
            question:
                'Calculate the area of a circle with radius 5 using Math.PI. Store the result in a variable called "circleArea". (Hint: The formula is π * r^2)',
            initialCode: '''
// Write your code here
''',
            validate: '''
              const isValid = (function() {
                return Math.abs(circleArea - 78.53981633974483) < 0.0001
                  && /Math.PI/.test(code);
              })();
            ''',
          ),
          Exercise(
            question:
                'Generate a random number between 1 and 100 (inclusive) and store it in a variable called "randomNumber".',
            initialCode: '''
// Write your code here
''',
            validate: '''
              const isValid = (function() {
                return randomNumber >= 1 
                  && randomNumber <= 100 
                  && Math.floor(randomNumber) === randomNumber
                  && /Math.random/.test(code);
              })();
            ''',
          ),
        ],
      ),
    ],
    difficulty: 'Beginner',
    durationMinutes: 30,
    icon: Feather.hash,
  ),
  Lesson(
    id: '7',
    title: 'Control Flow: Conditionals',
    description:
        'Learn how to control the flow of your JavaScript programs using conditional statements like if, else if, else, and switch.',
    sections: [
      LessonSection(
        content: '''
Conditional statements allow you to execute different code blocks based on certain conditions. In JavaScript, we have the following conditional statements:

1. if statement
2. if...else statement
3. if...else if...else statement
4. switch statement

Let's start with the if, else if, and else statements:

1. if statement: Executes a block of code if a specified condition is true.
2. else statement: Specifies a block of code to be executed if the condition is false.
3. else if statement: Specifies a new condition if the first condition is false.
      ''',
        codeExample: '''
let temperature = 25;

// Simple if statement
if (temperature > 30) {
  console.log("It's a hot day!");
}

// if...else statement
if (temperature > 30) {
  console.log("It's a hot day!");
} else {
  console.log("It's not too hot today.");
}

// if...else if...else statement
if (temperature > 30) {
  console.log("It's a hot day!");
} else if (temperature > 20) {
  console.log("It's a nice day!");
} else {
  console.log("It's a bit chilly.");
}

// You can also use logical operators in conditions
let isSunny = true;

if (temperature > 25 && isSunny) {
  console.log("It's a beautiful sunny day!");
}

// Ternary operator: a shorthand for simple if-else statements
let message = temperature > 30 ? "It's hot" : "It's not hot";
console.log(message);
      ''',
        exercises: [
          Exercise(
            question:
                'Create a variable "age" and assign it a value. Then write an if statement to check if the person is an adult (18 or older). If true, log "You are an adult" to the console.',
            initialCode: '''
// Write your code here
''',
            validate: '''
              const isValid = (function() {
                return ((consoleLog.join(",") === "You are an adult" && age >= 18) || consoleLog.join(",") === "");
              })();
            ''',
          ),
          Exercise(
            question:
                'Create a variable "score" and assign it a value between 0 and 100. Write an if-else if-else statement to determine the grade: A (90-100), B (80-89), C (70-79), D (60-69), F (below 60). Log the grade to the console.',
            initialCode: '''
// Write your code here
''',
            validate: '''
              const isValid = (function() {
                if (score < 0 || score > 100) return false;
                return (consoleLog.join(",") === "A" && score >= 90)
                  || (consoleLog.join(",") === "B" && score >= 80 && score <= 89)
                  || (consoleLog.join(",") === "C" && score >= 70 && score <= 79)
                  || (consoleLog.join(",") === "D" && score >= 60 && score <= 69)
                  || (consoleLog.join(",") === "F" && score < 60);
              })();
            ''',
          ),
        ],
      ),
      LessonSection(
        content: '''
The switch statement is used to perform different actions based on different conditions. It's often used as an alternative to long if...else if statements when comparing a variable to multiple values.

Key points about switch statements:
1. The switch expression is evaluated once.
2. The value of the expression is compared with the values of each case.
3. If there's a match, the associated block of code is executed.
4. The break keyword breaks out of the switch block.
5. The default keyword specifies code to run if there's no case match.
      ''',
        codeExample: '''
let day = 3;
let dayName;

switch (day) {
  case 1:
    dayName = "Monday";
    break;
  case 2:
    dayName = "Tuesday";
    break;
  case 3:
    dayName = "Wednesday";
    break;
  case 4:
    dayName = "Thursday";
    break;
  case 5:
    dayName = "Friday";
    break;
  case 6:
    dayName = "Saturday";
    break;
  case 7:
    dayName = "Sunday";
    break;
  default:
    dayName = "Invalid day";
}

console.log(dayName);  // Output: Wednesday

// Switch with multiple cases
let fruit = "apple";
let fruit_type;

switch (fruit) {
  case "apple":
  case "pear":
  case "cherry":
    fruit_type = "pomaceous fruit";
    break;
  case "orange":
  case "lemon":
  case "lime":
    fruit_type = "citrus fruit";
    break;
  default:
    fruit_type = "unknown fruit type";
}

console.log(fruit_type);  // Output: pomaceous fruit
      ''',
        exercises: [
          Exercise(
            question:
                'Create a variable "month" with a number value (1-12). Write a switch statement to determine the season (Spring: 3-5, Summer: 6-8, Autumn: 9-11, Winter: 12, 1, 2). Log the season to the console.',
            initialCode: '''
// Write your code here
''',
            validate: '''
              const isValid = (function() {
                if (month < 1 || month > 12) return false;
                return (consoleLog.join(",") === "Spring" && month >= 3 && month <= 5)
                  || (consoleLog.join(",") === "Summer" && month >= 6 && month <= 8)
                  || (consoleLog.join(",") === "Autumn" && month >= 9 && month <= 11)
                  || (consoleLog.join(",") === "Winter" && (month === 12 || month === 1 || month === 2));
              })();
            ''',
          ),
          Exercise(
            question:
                'Create a variable "trafficLight" with a value of "red", "yellow", or "green". Write a switch statement to log the appropriate action: "Stop" for red, "Slow down" for yellow, "Go" for green, and "Invalid signal" for any other value.',
            initialCode: '''
// Write your code here
''',
            validate: '''
              const isValid = (function() {
                return consoleLog.join(",") === "Stop" || consoleLog.join(",") === "Slow down" || consoleLog.join(",") === "Go" || consoleLog.join(",") === "Invalid signal";
              })();
            ''',
          ),
        ],
      ),
    ],
    difficulty: 'Beginner',
    durationMinutes: 35,
    icon: Feather.git_branch,
  ),
  Lesson(
    id: '8',
    title: 'Control Flow: Loops',
    description:
        'Learn how to use loops in JavaScript to repeat code execution. Understand different types of loops and when to use each one.',
    sections: [
      LessonSection(
        content: '''
Loops are used in JavaScript to perform repeated tasks based on a condition. Conditions typically return true or false. A loop will continue running until the defined condition returns false.

The three most common types of loops in JavaScript are:
1. for loop
2. while loop
3. do...while loop

Let's start with the for loop:

The for loop repeats until a specified condition evaluates to false. It's often used when you know in advance how many times the loop should run.

Syntax:
for (initialization; condition; increment/decrement) {
    // code to be executed
}
      ''',
        codeExample: '''
// Basic for loop
for (let i = 0; i < 5; i++) {
    console.log(i);
}
// Output: 0, 1, 2, 3, 4

// Looping through an array
let fruits = ['apple', 'banana', 'cherry'];
for (let i = 0; i < fruits.length; i++) {
    console.log(fruits[i]);
}
// Output: apple, banana, cherry

// Counting backwards
for (let i = 5; i > 0; i--) {
    console.log(i);
}
// Output: 5, 4, 3, 2, 1

// Skipping iterations with continue
for (let i = 0; i < 5; i++) {
    if (i === 2) {
        continue; // Skip the rest of the loop body
    }
    console.log(i);
}
// Output: 0, 1, 3, 4

// Breaking out of a loop early
for (let i = 0; i < 5; i++) {
    if (i === 3) {
        break; // Exit the loop
    }
    console.log(i);
}
// Output: 0, 1, 2
      ''',
        exercises: [
          Exercise(
            question:
                'Write a for loop that prints the even numbers from 0 to 10 (inclusive).',
            initialCode: '''
// Write your code here
''',
            validate: '''
              const isValid = (function() {
                return consoleLog.join(",") === "0,2,4,6,8,10";
              })();
            ''',
          ),
          Exercise(
            question:
                'Create an array of five colors. Use a for loop to print each color to the console, but skip the third color (index 2).',
            initialCode: '''
let colors = ['red', 'blue', 'green', 'yellow', 'purple'];
// Write your loop here
''',
            validate: '''
              const isValid = (function() {
                return consoleLog.join(",") === "red,blue,yellow,purple";
              })();
            ''',
          ),
        ],
      ),
      LessonSection(
        content: '''
Now let's look at while and do...while loops:

1. while loop:
   The while loop repeats as long as a specified condition evaluates to true.

2. do...while loop:
   The do...while loop is similar to the while loop, except that it always executes the code block at least once before checking the condition.

These loops are useful when you don't know in advance how many times the loop should run.
      ''',
        codeExample: '''
// while loop
let count = 0;
while (count < 5) {
    console.log(count);
    count++;
}
// Output: 0, 1, 2, 3, 4

// do...while loop
let num = 0;
do {
    console.log(num);
    num++;
} while (num < 3);
// Output: 0, 1, 2

// Using while to process user input (simulated)
let userInput = 'y'; // Simulated user input
while (userInput === 'y') {
    console.log("Processing...");
    userInput = Math.random() < 0.5 ? 'y' : 'n'; // Randomly change input
}
console.log("Done processing.");

// Avoiding infinite loops
let x = 0;
while (x < 5) {
    console.log(x);
    x++; // Don't forget to increment, or the loop will never end!
}
      ''',
        exercises: [
          Exercise(
            question:
                'Write a while loop that prints the odd numbers from 1 to 9.',
            initialCode: '''
// Write your code here
''',
            validate: '''
              const isValid = (function() {
                return consoleLog.join(",") === "1,3,5,7,9";
              })();
            ''',
          ),
          Exercise(
            question:
                'Use a do...while loop to print numbers starting from 5, decrementing by 1 in each iteration, until the number becomes less than or equal to 0.',
            initialCode: '''
// Write your code here
''',
            validate: '''
              const isValid = (function() {
                return consoleLog.join(",") === "5,4,3,2,1";
              })();
            ''',
          ),
        ],
      ),
    ],
    difficulty: 'Beginner',
    durationMinutes: 40,
    icon: Feather.repeat,
  ),
  Lesson(
    id: '10',
    title: 'Functions',
    description:
        'Learn how to create and use functions in JavaScript. Understand function declarations, parameters, return values, and basic concepts of scope.',
    sections: [
      LessonSection(
        content: '''
Functions are one of the fundamental building blocks in JavaScript. A function is a reusable block of code that performs a specific task or calculates a value.

Key points about functions:
1. They allow you to write reusable code.
2. They can take inputs (parameters) and return outputs.
3. They help in organizing and structuring your code.

There are several ways to define functions in JavaScript:
1. Function Declaration
2. Function Expression
3. Arrow Function (ES6+)

Let's start with Function Declarations:
      ''',
        codeExample: '''
// Basic function declaration
function greet() {
    console.log("Hello, World!");
}

// Calling the function
greet();  // Output: Hello, World!

// Function with parameters
function greetPerson(name) {
    console.log("Hello, " + name + "!");
}

greetPerson("Alice");  // Output: Hello, Alice!

// Function with return value
function add(a, b) {
    return a + b;
}

let result = add(5, 3);
console.log(result);  // Output: 8

// Function with multiple parameters and conditional return
function compareNumbers(a, b) {
    if (a > b) {
        return "a is greater";
    } else if (b > a) {
        return "b is greater";
    } else {
        return "a and b are equal";
    }
}

console.log(compareNumbers(5, 3));  // Output: a is greater
console.log(compareNumbers(2, 7));  // Output: b is greater
console.log(compareNumbers(4, 4));  // Output: a and b are equal
      ''',
        exercises: [
          Exercise(
            question:
                'Write a function called "isEven" that takes a number as a parameter and returns true if the number is even, and false otherwise.',
            initialCode: '''
// Write your function here
''',
            validate: '''
              const isValid = (function() {
                return isEven(4) === true && isEven(7) === false;
              })();
            ''',
          ),
          Exercise(
            question:
                'Create a function called "getFullName" that takes two parameters, firstName and lastName, and returns the full name as a single string.',
            initialCode: '''
// Write your function here
''',
            validate: '''
              const isValid = (function() {
                return getFullName("John", "Doe") === "John Doe";
              })();
            ''',
          ),
        ],
      ),
      LessonSection(
        content: '''
Now let's look at Function Expressions and Arrow Functions:

Function Expression:
A function expression is similar to a function declaration, but the function is assigned to a variable.

Arrow Function:
Arrow functions provide a shorter syntax for writing function expressions. They were introduced in ES6 (ECMAScript 2015).

Both function expressions and arrow functions are often used as anonymous functions, which are functions without a name, typically used as arguments to other functions.
      ''',
        codeExample: '''
// Function Expression
let greet = function(name) {
    return "Hello, " + name + "!";
};

console.log(greet("Bob"));  // Output: Hello, Bob!

// Arrow Function
let add = (a, b) => a + b;

console.log(add(5, 3));  // Output: 8

// Arrow Function with multiple statements
let compareNumbers = (a, b) => {
    if (a > b) {
        return "a is greater";
    } else if (b > a) {
        return "b is greater";
    } else {
        return "a and b are equal";
    }
};

console.log(compareNumbers(5, 3));  // Output: a is greater

// Using functions as arguments (callback functions)
let numbers = [1, 2, 3, 4, 5];

let doubledNumbers = numbers.map(num => num * 2);
console.log(doubledNumbers);  // Output: [2, 4, 6, 8, 10]

let evenNumbers = numbers.filter(num => num % 2 === 0);
console.log(evenNumbers);  // Output: [2, 4]
      ''',
        exercises: [
          Exercise(
            question:
                'Write an arrow function called "square" that takes a number as input and returns its square.',
            initialCode: '''
// Write your arrow function here
''',
            validate: '''
              const isValid = (function() {
                return square(4) === 16 && square(3) === 9;
              })();
            ''',
          ),
          Exercise(
            question:
                'Create an array of numbers. Use the filter function with an arrow function to create a new array containing only the numbers greater than 5.',
            initialCode: '''
let numbers = [2, 8, 4, 10, 1, 7];
// Write your code here
''',
            validate: '''
              const isValid = (function() {
                return JSON.stringify(filteredNumbers) === "[8,10,7]";
              })();
            ''',
          ),
        ],
      ),
    ],
    difficulty: 'Beginner',
    durationMinutes: 45,
    icon: Feather.code,
  ),
  Lesson(
    id: '11',
    title: 'Arrays',
    description:
        'Learn about arrays in JavaScript: how to create them, access and modify elements, and use common array methods.',
    sections: [
      LessonSection(
        content: '''
Arrays in JavaScript are used to store multiple values in a single variable. They are ordered collections that can hold various types of data, including numbers, strings, objects, and even other arrays.

Key points about arrays:
1. Arrays are zero-indexed, meaning the first element is at index 0.
2. Array length is dynamic; you can add or remove elements at any time.
3. Arrays in JavaScript can hold mixed data types.

Let's start with creating arrays and accessing elements:
      ''',
        codeExample: '''
// Creating an array
let fruits = ['apple', 'banana', 'orange'];

// Accessing elements
console.log(fruits[0]);  // Output: apple
console.log(fruits[2]);  // Output: orange

// Array length
console.log(fruits.length);  // Output: 3

// Modifying elements
fruits[1] = 'grape';
console.log(fruits);  // Output: ['apple', 'grape', 'orange']

// Adding elements to the end
fruits.push('mango');
console.log(fruits);  // Output: ['apple', 'grape', 'orange', 'mango']

// Removing the last element
let lastFruit = fruits.pop();
console.log(lastFruit);  // Output: mango
console.log(fruits);  // Output: ['apple', 'grape', 'orange']

// Adding elements to the beginning
fruits.unshift('kiwi');
console.log(fruits);  // Output: ['kiwi', 'apple', 'grape', 'orange']

// Removing the first element
let firstFruit = fruits.shift();
console.log(firstFruit);  // Output: kiwi
console.log(fruits);  // Output: ['apple', 'grape', 'orange']

// Finding the index of an element
let index = fruits.indexOf('grape');
console.log(index);  // Output: 1

// Checking if an element exists
let hasOrange = fruits.includes('orange');
console.log(hasOrange);  // Output: true
      ''',
        exercises: [
          Exercise(
            question:
                'Create an array called "colors" with five different color names. Then change the third color (index 2) to "purple".',
            initialCode: '''
// Write your code here
''',
            validate: '''
              const isValid = (function() {
                return colors.length === 5 && colors[2] === "purple";
              })();
            ''',
          ),
          Exercise(
            question:
                'Using the "colors" array from the previous exercise, add "pink" to the end and "black" to the beginning of the array.',
            initialCode: '''
// Assuming colors array exists
// Write your code here
''',
            validate: '''
              const isValid = (function() {
                return colors[0] === "black" && colors[colors.length - 1] === "pink";
              })();
            ''',
          ),
        ],
      ),
      LessonSection(
        content: '''
Now let's look at some powerful array methods that allow you to iterate, transform, and filter arrays:

1. forEach(): Executes a provided function once for each array element.
2. map(): Creates a new array with the results of calling a provided function on every element.
3. filter(): Creates a new array with all elements that pass the test implemented by the provided function.
4. find(): Returns the value of the first element in the array that satisfies the provided testing function.
5. some(): Tests whether at least one element in the array passes the test implemented by the provided function.
6. every(): Tests whether all elements in the array pass the test implemented by the provided function.
7. reduce(): Executes a reducer function on each element of the array, resulting in a single output value.

These methods are powerful tools for working with arrays and are commonly used in modern JavaScript programming.
      ''',
        codeExample: '''
let numbers = [1, 2, 3, 4, 5];

// forEach
numbers.forEach(num => console.log(num));
// Output: 1, 2, 3, 4, 5 (each on a new line)

// map
let doubled = numbers.map(num => num * 2);
console.log(doubled);  // Output: [2, 4, 6, 8, 10]

// filter
let evenNumbers = numbers.filter(num => num % 2 === 0);
console.log(evenNumbers);  // Output: [2, 4]

// find
let firstEven = numbers.find(num => num % 2 === 0);
console.log(firstEven);  // Output: 2

// some
let hasEven = numbers.some(num => num % 2 === 0);
console.log(hasEven);  // Output: true

// every
let allPositive = numbers.every(num => num > 0);
console.log(allPositive);  // Output: true

// reduce
let sum = numbers.reduce((acc, num) => acc + num, 0);
console.log(sum);  // Output: 15

// Chaining methods
let result = numbers
  .filter(num => num % 2 === 0)
  .map(num => num * 3)
  .reduce((acc, num) => acc + num, 0);
console.log(result);  // Output: 18 (2*3 + 4*3)
      ''',
        exercises: [
          Exercise(
            question:
                'Given an array of numbers, use the map method to create a new array where each number is squared.',
            initialCode: '''
let nums = [1, 2, 3, 4, 5];
// Write your code here
''',
            validate: '''
              const isValid = (function() {
                return JSON.stringify(squaredNums) === "[1,4,9,16,25]";
              })();
            ''',
          ),
          Exercise(
            question:
                'Using the filter method, create a new array that contains only the strings with a length greater than 3 from the given array.',
            initialCode: '''
let words = ['cat', 'dog', 'elephant', 'fish', 'giraffe'];
// Write your code here
''',
            validate: '''
              const isValid = (function() {
                return JSON.stringify(longWords) === '["elephant","fish","giraffe"]';
              })();
            ''',
          ),
        ],
      ),
    ],
    difficulty: 'Beginner',
    durationMinutes: 50,
    icon: Feather.list,
  ),
  Lesson(
    id: '12',
    title: 'Objects',
    description:
        'Learn about objects in JavaScript: how to create them, access and modify properties, add methods, and use common object operations.',
    sections: [
      LessonSection(
        content: '''
Objects in JavaScript are used to store keyed collections of various data and more complex entities. They are one of the fundamental data types in JavaScript and form the building blocks for modern JavaScript.

Key points about objects:
1. Objects are collections of key-value pairs (properties and values).
2. Properties can be accessed using dot notation or bracket notation.
3. Objects can contain methods (functions as values).
4. Objects are mutable; you can add, modify, or delete properties after creation.

Let's start with creating objects and working with properties:
      ''',
        codeExample: '''
// Creating an object
let person = {
  name: "John",
  age: 30,
  city: "New York"
};

// Accessing properties
console.log(person.name);  // Output: John
console.log(person['age']);  // Output: 30

// Modifying properties
person.age = 31;
person['city'] = "San Francisco";
console.log(person);  // Output: {name: "John", age: 31, city: "San Francisco"}

// Adding new properties
person.job = "Developer";
console.log(person.job);  // Output: Developer

// Deleting properties
delete person.city;
console.log(person.city);  // Output: undefined

// Checking if a property exists
console.log('name' in person);  // Output: true
console.log('city' in person);  // Output: false

// Object methods
let car = {
  brand: "Toyota",
  model: "Corolla",
  year: 2020,
  start: function() {
    console.log("The car is starting...");
  }
};

car.start();  // Output: The car is starting...

// Shorthand method syntax (ES6+)
let calculator = {
  add(a, b) {
    return a + b;
  },
  subtract(a, b) {
    return a - b;
  }
};

console.log(calculator.add(5, 3));  // Output: 8
console.log(calculator.subtract(10, 4));  // Output: 6
      ''',
        exercises: [
          Exercise(
            question:
                'Create an object called "book" with properties for title, author, and year. Then add a new property called "genre".',
            initialCode: '''
// Write your code here
''',
            validate: '''
              const isValid = (function() {
                return book.hasOwnProperty("title") && book.hasOwnProperty("author") && book.hasOwnProperty("year") && book.hasOwnProperty("genre");
              })();
            ''',
          ),
          Exercise(
            question:
                'Create an object called "circle" with a property "radius". Add a method called "area" that returns the area of the circle (π * r^2). Use 3.14 for π.',
            initialCode: '''
// Write your code here
''',
            validate: '''
              const isValid = (function() {
                return typeof circle.area === "function" && Math.abs(circle.area() - (3.14 * circle.radius * circle.radius)) < 0.01;
              })();
            ''',
          ),
        ],
      ),
      LessonSection(
        content: '''
Now let's look at some more advanced object concepts and operations:

1. Object.keys(): Returns an array of a given object's own enumerable property names.
2. Object.values(): Returns an array of a given object's own enumerable property values.
3. Object.entries(): Returns an array of a given object's own enumerable string-keyed property [key, value] pairs.
4. Object spread operator (...): Allows you to create a shallow copy of an object or merge objects.
5. Object destructuring: Allows you to extract multiple properties from an object and assign them to variables in a single statement.

These features are commonly used in modern JavaScript for working with objects efficiently.
      ''',
        codeExample: '''
let person = {
  name: "Alice",
  age: 28,
  city: "London"
};

// Object.keys()
console.log(Object.keys(person));  // Output: ["name", "age", "city"]

// Object.values()
console.log(Object.values(person));  // Output: ["Alice", 28, "London"]

// Object.entries()
console.log(Object.entries(person));  
// Output: [["name", "Alice"], ["age", 28], ["city", "London"]]

// Spread operator for object copying
let personCopy = {...person};
console.log(personCopy);  // Output: {name: "Alice", age: 28, city: "London"}

// Spread operator for merging objects
let personalInfo = {name: "Bob", age: 25};
let workInfo = {company: "Tech Co", position: "Developer"};
let bobComplete = {...personalInfo, ...workInfo};
console.log(bobComplete);  
// Output: {name: "Bob", age: 25, company: "Tech Co", position: "Developer"}

// Object destructuring
let {name, age} = person;
console.log(name);  // Output: Alice
console.log(age);   // Output: 28

// Destructuring with renaming
let {name: personName, age: personAge} = person;
console.log(personName);  // Output: Alice

// Destructuring in function parameters
function printPerson({name, age}) {
  console.log(`\${name} is \${age} years old.`);
}
printPerson(person);  // Output: Alice is 28 years old.
      ''',
        exercises: [
          Exercise(
            question:
                'Given an object "student" with properties for name, age, and grades (an array), use object destructuring to extract these properties into separate variables.',
            initialCode: '''
let student = {name: "Emma", age: 20, grades: [85, 90, 92]};
// Write your destructuring code here
''',
            validate: '''
              const isValid = (function() {
                return name === "Emma" && age === 20 && JSON.stringify(grades) === "[85,90,92]";
              })();
            ''',
          ),
          Exercise(
            question:
                'Create two objects, "personalDetails" with properties name and age, and "professionalDetails" with properties job and company. Use the spread operator to merge these into a new object called "person".',
            initialCode: '''
// Write your code here
''',
            validate: '''
              const isValid = (function() {
                return person.name && person.age && person.job && person.company;
              })();
            ''',
          ),
        ],
      ),
    ],
    difficulty: 'Beginner',
    durationMinutes: 55,
    icon: Feather.box,
  ),
  Lesson(
    id: '13',
    title: 'Asynchronous JavaScript',
    description:
        'Learn about asynchronous programming in JavaScript, including callbacks, promises, and async/await syntax.',
    sections: [
      LessonSection(
        content: '''
Asynchronous programming in JavaScript allows you to perform long-running operations without blocking the execution of other code. This is crucial for tasks like making API calls, reading files, or any operation that might take an unpredictable amount of time.

Key concepts in asynchronous JavaScript:
1. Callbacks
2. Promises
3. Async/Await

Let's start with callbacks, the traditional way of handling asynchronous operations:

Callbacks are functions passed as arguments to other functions, to be executed once an asynchronous operation has completed.
      ''',
        codeExample: '''
// Simulating an asynchronous operation
function fetchData(callback) {
  setTimeout(() => {
    const data = { id: 1, name: "John Doe" };
    callback(data);
  }, 2000);  // Simulates a 2-second delay
}

console.log("Starting data fetch...");

fetchData((result) => {
  console.log("Data received:", result);
});

console.log("Data fetch initiated.");

// Output:
// Starting data fetch...
// Data fetch initiated.
// (After 2 seconds) Data received: { id: 1, name: "John Doe" }

// Callback hell example (nested callbacks)
function step1(callback) {
  setTimeout(() => {
    console.log("Step 1 complete");
    callback();
  }, 1000);
}

function step2(callback) {
  setTimeout(() => {
    console.log("Step 2 complete");
    callback();
  }, 1000);
}

function step3(callback) {
  setTimeout(() => {
    console.log("Step 3 complete");
    callback();
  }, 1000);
}

step1(() => {
  step2(() => {
    step3(() => {
      console.log("All steps complete");
    });
  });
});
      ''',
        exercises: [
          Exercise(
            question:
                'Create a function called "delayedGreeting" that takes a name and a callback function as parameters. The function should use setTimeout to call the callback after a 2-second delay, passing a greeting message with the given name.',
            initialCode: '''
// Write your code here
''',
            validate: '''
              const isValid = (function() {
                let result;
                delayedGreeting("Alice", (message) => {
                  result = message;
                });
                return result === "Hello, Alice!";
              })();
            ''',
          ),
        ],
      ),
      LessonSection(
        content: '''
Promises provide a more structured way to handle asynchronous operations, avoiding the "callback hell" problem. A Promise represents a value that may not be available yet but will be resolved at some point in the future.

Promises have three states:
1. Pending: Initial state, neither fulfilled nor rejected.
2. Fulfilled: The operation completed successfully.
3. Rejected: The operation failed.

Promises use .then() for success and .catch() for error handling.

After Promises, we'll look at the async/await syntax, which is built on top of Promises and provides a more synchronous-looking way to write asynchronous code.
      ''',
        codeExample: '''
// Creating a Promise
const myPromise = new Promise((resolve, reject) => {
  setTimeout(() => {
    const randomNumber = Math.random();
    if (randomNumber > 0.5) {
      resolve(randomNumber);
    } else {
      reject("Number too low");
    }
  }, 1000);
});

myPromise
  .then(result => console.log("Success:", result))
  .catch(error => console.log("Error:", error));

// Chaining Promises
function step1() {
  return new Promise(resolve => {
    setTimeout(() => {
      console.log("Step 1 complete");
      resolve(100);
    }, 1000);
  });
}

function step2(value) {
  return new Promise(resolve => {
    setTimeout(() => {
      console.log("Step 2 complete");
      resolve(value + 200);
    }, 1000);
  });
}

step1()
  .then(result => step2(result))
  .then(finalResult => console.log("Final result:", finalResult))
  .catch(error => console.log("Error:", error));

// Async/Await
async function runSteps() {
  try {
    const step1Result = await step1();
    const step2Result = await step2(step1Result);
    console.log("Final result:", step2Result);
  } catch (error) {
    console.log("Error:", error);
  }
}

runSteps();

// Fetching data from an API (if running in a browser environment)
// async function fetchUser(id) {
//   try {
//     const response = await fetch(`https://api.example.com/users/\${id}`);
//     const user = await response.json();
//     console.log("User:", user);
//   } catch (error) {
//     console.log("Error fetching user:", error);
//   }
// }

// fetchUser(1);
      ''',
        exercises: [
          Exercise(
            question:
                'Create a function called "delayedMultiply" that takes two numbers as parameters and returns a Promise. The Promise should resolve after a 1-second delay with the product of the two numbers.',
            initialCode: '''
// Write your code here
''',
            validate: '''
              const isValid = (function() {
                return delayedMultiply(2, 3) instanceof Promise;
              })();
            ''',
          ),
          Exercise(
            question:
                'Using async/await, create a function called "runMultiplication" that uses the delayedMultiply function from the previous exercise to multiply 3 and 4, then multiply the result by 2. Log the final result.',
            initialCode: '''
// Assume delayedMultiply function exists
// Write your code here
''',
            validate: '''
              const isValid = (function() {
                let result;
                runMultiplication().then(res => result = res);
                return result === 24;
              })();
            ''',
          ),
        ],
      ),
    ],
    difficulty: 'Intermediate',
    durationMinutes: 60,
    icon: Feather.clock,
  ),
  Lesson(
    id: '14',
    title: 'ES6+ Features: Modern JavaScript Syntax',
    description:
        'Explore modern JavaScript syntax and features introduced in ES6 and beyond, enhancing code readability and functionality.',
    sections: [
      LessonSection(
        content: '''
ES6 (ECMAScript 2015) and subsequent versions have introduced many new features that make JavaScript more powerful and expressive. In this lesson, we'll cover some of the most important modern JavaScript features:

1. let and const
2. Arrow functions
3. Template literals
4. Destructuring
5. Spread and rest operators
6. Enhanced object literals
7. Default parameters
8. Classes
9. Modules

Let's start with some of the fundamental syntax changes:
      ''',
        codeExample: '''
// 1. let and const
let variable = 'can be reassigned';
const constant = 'cannot be reassigned';

// Block scoping
{
  let blockScoped = 'only available in this block';
  var functionScoped = 'available throughout the function';
}
// console.log(blockScoped); // ReferenceError
console.log(functionScoped); // Works fine

// 2. Arrow functions
const add = (a, b) => a + b;
const square = x => x * x; // Parentheses optional for single parameter
const logMessage = () => console.log('Hello!'); // No parameters

// 3. Template literals
const name = 'Alice';
console.log(`Hello, \${name}!`); // String interpolation
const multiLine = `
  This is a
  multi-line string
`;

// 4. Destructuring
const person = { name: 'Bob', age: 30 };
const { name: personName, age } = person;
console.log(personName, age); // Bob 30

const numbers = [1, 2, 3];
const [first, second] = numbers;
console.log(first, second); // 1 2

// 5. Spread and rest operators
const arr1 = [1, 2, 3];
const arr2 = [...arr1, 4, 5]; // Spread
console.log(arr2); // [1, 2, 3, 4, 5]

const sum = (...args) => args.reduce((a, b) => a + b, 0); // Rest
console.log(sum(1, 2, 3, 4)); // 10

// 6. Enhanced object literals
const x = 1, y = 2;
const point = { 
  x, 
  y, 
  moveBy(dx, dy) {
    this.x += dx;
    this.y += dy;
  }
};

// 7. Default parameters
function greet(name = 'Guest') {
  console.log(`Hello, \${name}!`);
}
greet(); // Hello, Guest!
greet('Alice'); // Hello, Alice!
      ''',
        exercises: [
          Exercise(
            question:
                'Create an arrow function called "calculateArea" that takes the radius of a circle as a parameter and returns the area. Use the const PI = 3.14159 in your calculation.',
            initialCode: '''
// Write your code here
''',
            validate: '''
              const isValid = (function() {
                return Math.abs(calculateArea(5) - 78.53975) < 0.0001;
              })();
            ''',
          ),
          Exercise(
            question:
                'Given an object person = { name: "John", age: 30, city: "New York" }, use destructuring to extract name and age into variables. Then, use a template literal to log "John is 30 years old."',
            initialCode: '''
const person = { name: "John", age: 30, city: "New York" };
// Write your code here
''',
            validate: '''
              const isValid = (function() {
                return consoleLog.join(" ").includes("John is 30 years old");
              })();
            ''',
          ),
        ],
      ),
      LessonSection(
        content: '''
Now let's look at some more advanced ES6+ features:

8. Classes: ES6 introduced a more intuitive way to create objects and implement inheritance.

9. Modules: ES6 modules allow you to split your code into separate files, making it easier to maintain and organize large projects.

10. Promises and async/await: We covered these in the previous lesson on asynchronous JavaScript, but they're worth mentioning again as key ES6+ features.

11. Array methods: ES6+ introduced several useful array methods like find(), findIndex(), and includes().

12. Object methods: Object.assign() and Object.entries() are powerful additions for working with objects.
      ''',
        codeExample: '''
// 8. Classes
class Animal {
  constructor(name) {
    this.name = name;
  }
  
  speak() {
    console.log(`\${this.name} makes a sound.`);
  }
}

class Dog extends Animal {
  speak() {
    console.log(`\${this.name} barks.`);
  }
}

const dog = new Dog('Rex');
dog.speak(); // Rex barks.

// 9. Modules
// In a separate file named math.js:
// export const add = (a, b) => a + b;
// export const subtract = (a, b) => a - b;

// In your main file:
// import { add, subtract } from './math.js';
// console.log(add(5, 3)); // 8

// 11. New Array methods
const numbers = [1, 2, 3, 4, 5];
const evenNumber = numbers.find(n => n % 2 === 0);
console.log(evenNumber); // 2

const index = numbers.findIndex(n => n > 3);
console.log(index); // 3

console.log(numbers.includes(3)); // true

// 12. New Object methods
const obj1 = { a: 1, b: 2 };
const obj2 = { c: 3, d: 4 };
const combined = Object.assign({}, obj1, obj2);
console.log(combined); // { a: 1, b: 2, c: 3, d: 4 }

const entries = Object.entries(combined);
console.log(entries); // [['a', 1], ['b', 2], ['c', 3], ['d', 4]]
      ''',
        exercises: [
          Exercise(
            question:
                'Create a class called "Rectangle" with a constructor that takes width and height. Add a method called "area" that returns the area of the rectangle. Then create a subclass called "Square" that only requires one side length in its constructor.',
            initialCode: '''
// Write your code here
''',
            validate: '''
              const isValid = (function() {
                return new Rectangle(4, 5).area() === 20 && new Square(4).area() === 16;
              })();
            ''',
          ),
          Exercise(
            question:
                'Use the find() method to find the first number greater than 10 in the array [5, 12, 8, 130, 44]. Then, use findIndex() to find the index of the first even number in the same array.',
            initialCode: '''
const numbers = [5, 12, 8, 130, 44];
// Write your code here
''',
            validate: '''
              const isValid = (function() {
                return foundNumber === 12 && foundIndex === 1;
              })();
            ''',
          ),
        ],
      ),
    ],
    difficulty: 'Intermediate',
    durationMinutes: 60,
    icon: Feather.zap,
  ),
  Lesson(
    id: '15',
    title: 'Error Handling in JavaScript',
    description:
        'Learn how to handle errors effectively in JavaScript using try-catch blocks, throw statements, and understand common error types.',
    sections: [
      LessonSection(
        content: '''
Error handling is a crucial part of writing robust JavaScript code. It allows you to gracefully manage unexpected situations and provide meaningful feedback to users or developers.

Key concepts in JavaScript error handling:
1. try-catch blocks
2. throw statement
3. Error object and its properties
4. Common built-in error types
5. finally clause
6. Error handling in asynchronous code

Let's start with the basics of try-catch and throw:
      ''',
        codeExample: '''
// Basic try-catch block
try {
  // Code that might throw an error
  let x = y + 5; // y is not defined
} catch (error) {
  console.log("An error occurred:", error.message);
}

// Output: An error occurred: y is not defined

// Using throw to create custom errors
function divide(a, b) {
  if (b === 0) {
    throw new Error("Division by zero is not allowed");
  }
  return a / b;
}

try {
  console.log(divide(10, 2)); // Works fine
  console.log(divide(10, 0)); // This will throw an error
} catch (error) {
  console.log("Caught an error:", error.message);
}

// Using finally
function openFile(filename) {
  let file = null;
  try {
    // Simulating file operations
    file = { name: filename, content: "Some content" };
    // Simulating an error
    if (filename === "error.txt") {
      throw new Error("File not found");
    }
    console.log("File opened successfully");
  } catch (error) {
    console.log("Error opening file:", error.message);
  } finally {
    // This block always executes
    if (file) {
      console.log("Closing file:", file.name);
    }
  }
}

openFile("test.txt");
openFile("error.txt");

// Accessing error properties
try {
  throw new Error("Something went wrong");
} catch (error) {
  console.log("Name:", error.name);
  console.log("Message:", error.message);
  console.log("Stack:", error.stack);
}
      ''',
        exercises: [
          Exercise(
            question:
                'Create a function called "squareRoot" that takes a number as input. If the input is negative, throw an error with the message "Cannot calculate square root of a negative number". Use a try-catch block to handle the error when calling the function.',
            initialCode: '''
// Write your code here
''',
            validate: '''
              const isValid = (function() {
                try {
                  squareRoot(-4);
                  return false;
                } catch (e) {
                  return e.message === "Cannot calculate square root of a negative number";
                }
              })();
            ''',
          ),
        ],
      ),
      LessonSection(
        content: '''
JavaScript has several built-in error types that you might encounter or use:

1. Error: The base type for all errors
2. SyntaxError: For parsing errors
3. ReferenceError: When a variable is not defined
4. TypeError: When a value is not of the expected type
5. RangeError: When a value is not in the set or range of allowed values
6. URIError: When a URI handling function is misused

Error handling in asynchronous code requires special attention, especially when working with Promises or async/await syntax.
      ''',
        codeExample: '''
// Different types of errors
try {
  // SyntaxError
  eval("Hello World");
} catch (e) {
  console.log(e instanceof SyntaxError);  // true
  console.log("SyntaxError:", e.message);
}

try {
  // ReferenceError
  console.log(undefinedVariable);
} catch (e) {
  console.log(e instanceof ReferenceError);  // true
  console.log("ReferenceError:", e.message);
}

try {
  // TypeError
  null.f();
} catch (e) {
  console.log(e instanceof TypeError);  // true
  console.log("TypeError:", e.message);
}

try {
  // RangeError
  console.log(new Array(-1));
} catch (e) {
  console.log(e instanceof RangeError);  // true
  console.log("RangeError:", e.message);
}

// Error handling in Promises
function fetchData() {
  return new Promise((resolve, reject) => {
    // Simulating an error in an asynchronous operation
    setTimeout(() => reject(new Error("Failed to fetch data")), 1000);
  });
}

fetchData()
  .then(data => console.log(data))
  .catch(error => console.log("Caught error:", error.message));

// Error handling with async/await
async function fetchDataAsync() {
  try {
    const data = await fetchData();
    console.log(data);
  } catch (error) {
    console.log("Caught error in async function:", error.message);
  }
}

fetchDataAsync();
      ''',
        exercises: [
          Exercise(
            question:
                'Create an async function called "fetchUser" that simulates fetching a user from an API. The function should return a Promise that resolves with a user object if the id is a number, and rejects with an error "Invalid user id" if it\'s not. Use a try-catch block when calling this function to handle potential errors.',
            initialCode: '''
// Write your code here
''',
            validate: '''
              const isValid = (function() {
                try {
                  fetchUser('abc');
                  return false;
                } catch (e) {
                  return e.message === "Invalid user id";
                }
              })();
            ''',
          ),
        ],
      ),
    ],
    difficulty: 'Intermediate',
    durationMinutes: 45,
    icon: Feather.alert_triangle,
  ),
  Lesson(
    id: '16',
    title: 'JSON in JavaScript',
    description:
        'Learn about JSON (JavaScript Object Notation), its structure, how to work with it in JavaScript, and its common use cases in web development.',
    sections: [
      LessonSection(
        content: '''
JSON (JavaScript Object Notation) is a lightweight data-interchange format that is easy for humans to read and write and easy for machines to parse and generate. Despite its name, JSON is language-independent and is used by many programming languages.

Key points about JSON:
1. It's a text format that is completely language independent.
2. It's built on two structures: 
   - A collection of name/value pairs (similar to a JavaScript object)
   - An ordered list of values (similar to a JavaScript array)
3. JSON supports the following data types:
   - String
   - Number
   - Boolean
   - null
   - Object
   - Array

Let's start with the basic structure and syntax of JSON:
      ''',
        codeExample: '''
// JSON Object
let person = {
  "name": "John Doe",
  "age": 30,
  "city": "New York",
  "isStudent": false,
  "grades": [85, 90, 92],
  "address": {
    "street": "123 Main St",
    "zipCode": "10001"
  }
};

// JSON Array
let cities = [
  {
    "name": "New York",
    "population": 8419000
  },
  {
    "name": "Los Angeles",
    "population": 3898000
  },
  {
    "name": "Chicago",
    "population": 2716000
  }
];

// Accessing JSON data
console.log(person.name);  // Output: John Doe
console.log(person["age"]);  // Output: 30
console.log(person.address.street);  // Output: 123 Main St
console.log(cities[0].name);  // Output: New York

// JSON doesn't support functions or undefined values
let invalidJSON = {
  "function": function() { console.log("This is not valid in JSON"); },
  "undefined": undefined
};
// This will cause issues when trying to convert to a JSON string
      ''',
        exercises: [
          Exercise(
            question:
                'Create a JSON object representing a book with properties for title, author, publication year, and an array of chapters (each chapter should have a title and page count).',
            initialCode: '''
// Write your JSON object here
let book = 
''',
            validate: '''
              const isValid = (function() {
                return book.title && book.author && book.year && Array.isArray(book.chapters) &&
                  book.chapters.every(ch => ch.title && typeof ch.pages === "number");
              })();
            ''',
          ),
        ],
      ),
      LessonSection(
        content: '''
JavaScript provides built-in methods to work with JSON:

1. JSON.stringify(): Converts a JavaScript object to a JSON string
2. JSON.parse(): Parses a JSON string and returns a JavaScript object

These methods are crucial when sending data to or receiving data from a server, as data is typically transmitted as strings.

Additionally, we'll look at:
- Working with nested JSON structures
- Handling JSON in API responses (using fetch as an example)
- Common pitfalls when working with JSON
      ''',
        codeExample: '''
// Converting JavaScript object to JSON string
let person = {
  name: "Alice",
  age: 28,
  city: "London"
};

let jsonString = JSON.stringify(person);
console.log(jsonString);
// Output: {"name":"Alice","age":28,"city":"London"}

// Parsing JSON string to JavaScript object
let jsonData = '{"name":"Bob","age":35,"city":"Paris"}';
let parsedData = JSON.parse(jsonData);
console.log(parsedData.name);  // Output: Bob

// Working with nested JSON
let company = {
  name: "Tech Corp",
  employees: [
    {name: "John", position: "Developer"},
    {name: "Sarah", position: "Designer"}
  ],
  address: {
    street: "123 Tech St",
    city: "San Francisco"
  }
};

console.log(company.employees[1].position);  // Output: Designer
console.log(company.address.city);  // Output: San Francisco

// Stringifying with formatting
console.log(JSON.stringify(company, null, 2));
// Output:
// {
//   "name": "Tech Corp",
//   "employees": [
//     {
//       "name": "John",
//       "position": "Developer"
//     },
//     {
//       "name": "Sarah",
//       "position": "Designer"
//     }
//   ],
//   "address": {
//     "street": "123 Tech St",
//     "city": "San Francisco"
//   }
// }

// Example of fetching JSON data from an API
// Note: This would typically be run in a browser environment
// fetch('https://api.example.com/data')
//   .then(response => response.json())
//   .then(data => console.log(data))
//   .catch(error => console.error('Error:', error));

// Common pitfall: JSON.parse() with invalid JSON
try {
  JSON.parse('{"name": "John", age: 30}');  // Missing quotes around "age"
} catch (error) {
  console.error('Invalid JSON:', error.message);
}
      ''',
        exercises: [
          Exercise(
            question:
                'Create a function called "filterAndStringify" that takes an array of objects and a property name. The function should filter the array to include only objects where the specified property exists, and then return the filtered array as a JSON string.',
            initialCode: '''
// Write your function here
function filterAndStringify(array, property) {
  // Your code here
}

// Test data
let data = [
  {id: 1, name: "Alice"},
  {id: 2, age: 30},
  {id: 3, name: "Bob", age: 25}
];

console.log(filterAndStringify(data, "name"));
''',
            validate: '''
              const isValid = (function() {
                return filterAndStringify(data, "name") === '[{"id":1,"name":"Alice"},{"id":3,"name":"Bob","age":25}]';
              })();
            ''',
          ),
        ],
      ),
    ],
    difficulty: 'Intermediate',
    durationMinutes: 40,
    icon: Feather.file_text,
  ),
  Lesson(
    id: '17',
    title: 'Regular Expressions in JavaScript',
    description:
        'Learn how to use regular expressions in JavaScript for pattern matching and text manipulation. Understand regex syntax, methods, and common use cases.',
    sections: [
      LessonSection(
        content: '''
Regular expressions (regex) are powerful tools for pattern matching and manipulation of strings. In JavaScript, they are objects that describe a pattern of characters.

Key points about regular expressions:
1. They are created using /pattern/flags or new RegExp(pattern, flags)
2. They can be used with string methods like match(), search(), replace()
3. The RegExp object has methods like test() and exec()
4. Special characters and metacharacters allow for flexible pattern matching

Let's start with basic regex creation and usage:
      ''',
        codeExample: '''
// Creating a regular expression
let regex1 = /hello/;
let regex2 = new RegExp('world');

// Basic pattern matching
let text = "Hello, world!";
console.log(regex1.test(text));  // false (case-sensitive)
console.log(regex2.test(text));  // true

// Case-insensitive matching
let regex3 = /hello/i;
console.log(regex3.test(text));  // true

// Finding matches
let matches = text.match(/o/g);
console.log(matches);  // ['o', 'o']

// Replacing with regex
let newText = text.replace(/o/g, '0');
console.log(newText);  // Hell0, w0rld!

// Regex metacharacters
let digit = /\d/;  // Matches any digit
let word = /\w+/;  // Matches one or more word characters
let whitespace = /\s/;  // Matches whitespace

console.log(digit.test("There are 3 apples"));  // true
console.log(word.exec("Hello world"));  // ["Hello"]
console.log("A B".replace(whitespace, '_'));  // "A_B"

// Character classes
let vowels = /[aeiou]/gi;  // Matches any vowel, case-insensitive
console.log("Hello World".match(vowels));  // ["e","o","o"]

// Quantifiers
let threeDigs = /\d{3}/;  // Matches exactly three digits
console.log(threeDigs.test("123"));  // true
console.log(threeDigs.test("12"));   // false

// Start and end of string
let startHi = /^Hi/;
let endBye = /Bye\$/;
console.log(startHi.test("Hi there"));  // true
console.log(endBye.test("Goodbye"));    // true
      ''',
        exercises: [
          Exercise(
            question:
                'Create a regular expression that matches any string that starts with "Java" followed by any characters. Test it with the strings "JavaScript", "Java", and "JavaBeans".',
            initialCode: '''
// Write your regex and tests here
''',
            validate: '''
              const isValid = (function() {
                return regex.test("JavaScript") && regex.test("Java") && regex.test("JavaBeans") && !regex.test("Python");
              })();
            ''',
          ),
        ],
      ),
      LessonSection(
        content: '''
Now let's look at more advanced regex concepts and common use cases:

1. Grouping and capturing
2. Alternation
3. Lookahead and lookbehind assertions
4. Common regex patterns (email, URL, etc.)
5. Regex flags (g, i, m, s, u, y)
6. Regex performance considerations

Remember, while powerful, regular expressions can become complex. It's often a good practice to build them up gradually and test each step.
      ''',
        codeExample: '''
// Grouping and capturing
let dateRegex = /(\d{4})-(\d{2})-(\d{2})/;
let date = "2023-05-15";
let [fullMatch, year, month, day] = date.match(dateRegex);
console.log(year, month, day);  // 2023 05 15

// Alternation
let fruitRegex = /apple|banana|cherry/;
console.log(fruitRegex.test("I like banana"));  // true

// Lookahead and lookbehind
let password = /(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}/;
// Matches a string that contains at least one digit, one lowercase and one uppercase letter, and is at least 8 characters long
console.log(password.test("Password123"));  // true

// Email regex (simplified)
let emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+\$/;
console.log(emailRegex.test("user@example.com"));  // true

// URL regex (simplified)
let urlRegex = /https?:\/\/(www\.)?[-a-zA-Z0-9@:%._\+~#=]{2,256}\.[a-z]{2,6}\b([-a-zA-Z0-9@:%_\+.~#?&//=]*)/;
console.log(urlRegex.test("https://www.example.com"));  // true

// Regex flags
let multilineRegex = /^start/m;  // ^ matches start of each line with m flag
let multilineText = "first line\nstart of second";
console.log(multilineRegex.test(multilineText));  // true

// Using exec() with global flag
let globalRegex = /\d+/g;
let text = "There are 3 apples and 4 oranges";
let match;
while ((match = globalRegex.exec(text)) !== null) {
  console.log(`Found \${match[0]} at index \${match.index}`);
}
// Output:
// Found 3 at index 10
// Found 4 at index 25

// Regex performance
let slowRegex = /^(a+)+\$/;  // Can be very slow on certain inputs
console.log(slowRegex.test("aaaaaaaaaaaaaaaaaaaaaaaaaaaaaab"));  // Be cautious with patterns like this
      ''',
        exercises: [
          Exercise(
            question:
                'Create a function called "extractPhoneNumbers" that takes a string of text and returns an array of all phone numbers in the format (xxx) xxx-xxxx. Use a regular expression to find the phone numbers.',
            initialCode: '''
function extractPhoneNumbers(text) {
  // Your code here
}

// Test
let text = "Call me at (123) 456-7890 or (987) 654-3210";
console.log(extractPhoneNumbers(text));
''',
            validate: '''
              const isValid = (function() {
                return JSON.stringify(extractPhoneNumbers(text)) === '["(123) 456-7890","(987) 654-3210"]';
              })();
            ''',
          ),
        ],
      ),
    ],
    difficulty: 'Intermediate',
    durationMinutes: 50,
    icon: Feather.search,
  ),
  Lesson(
    id: '18',
    title: 'Functional Programming Concepts in JavaScript',
    description:
        'Learn key concepts of functional programming and how to apply them in JavaScript. Understand pure functions, immutability, higher-order functions, and more.',
    sections: [
      LessonSection(
        content: '''
Functional programming is a programming paradigm that treats computation as the evaluation of mathematical functions and avoids changing state and mutable data. JavaScript, being a multi-paradigm language, supports many functional programming concepts.

Key concepts in functional programming:
1. Pure functions
2. Immutability
3. Higher-order functions
4. Function composition
5. Recursion
6. Currying

Let's start with pure functions and immutability:
      ''',
        codeExample: '''
// Pure function
// Always returns the same output for the same input, no side effects
function add(a, b) {
  return a + b;
}

console.log(add(2, 3));  // Always 5

// Impure function (for comparison)
let total = 0;
function addToTotal(value) {
  total += value;  // Side effect: modifies external state
  return total;
}

console.log(addToTotal(3));  // 3
console.log(addToTotal(3));  // 6 (different result for same input)

// Immutability
const originalArray = [1, 2, 3];

// Instead of modifying the original array:
// originalArray.push(4);  // This would mutate the array

// Create a new array with the added element
const newArray = [...originalArray, 4];

console.log(originalArray);  // [1, 2, 3]
console.log(newArray);       // [1, 2, 3, 4]

// Working with immutable objects
const person = { name: "Alice", age: 30 };

// Instead of: person.age = 31;
const updatedPerson = { ...person, age: 31 };

console.log(person);         // { name: "Alice", age: 30 }
console.log(updatedPerson);  // { name: "Alice", age: 31 }
      ''',
        exercises: [
          Exercise(
            question:
                'Create a pure function called "calculateCircleArea" that takes the radius as an input and returns the area of the circle. Use Math.PI for the value of π.',
            initialCode: '''
// Write your function here
''',
            validate: '''
              const isValid = (function() {
                return Math.abs(calculateCircleArea(5) - 78.53981633974483) < 0.0001 &&
                  Math.abs(calculateCircleArea(3) - 28.274333882308138) < 0.0001;
              })();
            ''',
          ),
        ],
      ),
      LessonSection(
        content: '''
Now let's explore higher-order functions, function composition, recursion, and currying:

1. Higher-order functions: Functions that take other functions as arguments or return functions.
2. Function composition: Combining two or more functions to produce a new function.
3. Recursion: A function calling itself until it reaches a base case.
4. Currying: The technique of translating a function that takes multiple arguments into a sequence of functions, each with a single argument.

These concepts are powerful tools in functional programming, enabling more modular and reusable code.
      ''',
        codeExample: '''
// Higher-order function
function multiplyBy(factor) {
  return function(number) {
    return number * factor;
  };
}

const double = multiplyBy(2);
const triple = multiplyBy(3);

console.log(double(5));  // 10
console.log(triple(5));  // 15

// Function composition
const add5 = x => x + 5;
const multiply2 = x => x * 2;

const compose = (f, g) => x => f(g(x));
const add5ThenMultiply2 = compose(multiply2, add5);

console.log(add5ThenMultiply2(10));  // (10 + 5) * 2 = 30

// Recursion
function factorial(n) {
  if (n <= 1) return 1;
  return n * factorial(n - 1);
}

console.log(factorial(5));  // 120

// Currying
function curryAdd(a) {
  return function(b) {
    return function(c) {
      return a + b + c;
    };
  };
}

console.log(curryAdd(1)(2)(3));  // 6

// Using arrow functions for a more concise curry
const curriedAdd = a => b => c => a + b + c;
console.log(curriedAdd(1)(2)(3));  // 6

// Practical example: Using map, filter, and reduce
const numbers = [1, 2, 3, 4, 5];

const doubledNumbers = numbers.map(n => n * 2);
console.log(doubledNumbers);  // [2, 4, 6, 8, 10]

const evenNumbers = numbers.filter(n => n % 2 === 0);
console.log(evenNumbers);  // [2, 4]

const sum = numbers.reduce((acc, n) => acc + n, 0);
console.log(sum);  // 15
      ''',
        exercises: [
          Exercise(
            question:
                'Create a higher-order function called "repeat" that takes a function and a number n as arguments. It should return a new function that, when called, will call the original function n times and return an array of the results.',
            initialCode: '''
function repeat(func, n) {
  // Your code here
}

// Example usage:
// const doubleAndRepeat = repeat(x => x * 2, 3);
// console.log(doubleAndRepeat(5));  // Should output [10, 20, 40]
''',
            validate: '''
              const isValid = (function() {
                return JSON.stringify(repeat(x => x * 2, 3)(5)) === '[10,20,40]';
              })();
            ''',
          ),
        ],
      ),
    ],
    difficulty: 'Intermediate',
    durationMinutes: 55,
    icon: Feather.code,
  ),
  Lesson(
    id: '19',
    title: 'Object-Oriented Programming in JavaScript',
    description:
        'Learn the principles of Object-Oriented Programming and how to implement them in JavaScript. Understand classes, objects, inheritance, and more.',
    sections: [
      LessonSection(
        content: '''
Object-Oriented Programming (OOP) is a programming paradigm based on the concept of "objects", which can contain data and code. The data is in the form of fields (often known as attributes or properties), and the code is in the form of procedures (often known as methods).

Key concepts in OOP:
1. Classes and Objects
2. Encapsulation
3. Inheritance
4. Polymorphism

Let's start with classes, objects, and encapsulation:
      ''',
        codeExample: '''
// Class definition
class Person {
  constructor(name, age) {
    this.name = name;
    this.age = age;
  }

  // Method
  sayHello() {
    console.log(`Hello, my name is \${this.name} and I'm \${this.age} years old.`);
  }

  // Getter
  get birthYear() {
    return new Date().getFullYear() - this.age;
  }

  // Setter
  set birthYear(year) {
    this.age = new Date().getFullYear() - year;
  }
}

// Creating objects
const person1 = new Person("Alice", 30);
const person2 = new Person("Bob", 25);

person1.sayHello(); // Output: Hello, my name is Alice and I'm 30 years old.
person2.sayHello(); // Output: Hello, my name is Bob and I'm 25 years old.

console.log(person1.birthYear); // Output: 1993 (assuming current year is 2023)
person2.birthYear = 1990;
console.log(person2.age); // Output: 33 (assuming current year is 2023)

// Encapsulation with private fields (ES2022+)
class BankAccount {
  #balance = 0; // Private field

  deposit(amount) {
    if (amount > 0) {
      this.#balance += amount;
      console.log(`Deposited \${amount}. New balance: \${this.#balance}`);
    }
  }

  withdraw(amount) {
    if (amount > 0 && amount <= this.#balance) {
      this.#balance -= amount;
      console.log(`Withdrawn \${amount}. New balance: \${this.#balance}`);
    } else {
      console.log("Insufficient funds");
    }
  }

  getBalance() {
    return this.#balance;
  }
}

const account = new BankAccount();
account.deposit(100);
account.withdraw(50);
console.log(account.getBalance()); // 50
// console.log(account.#balance); // SyntaxError: Private field '#balance' must be declared in an enclosing class
      ''',
        exercises: [
          Exercise(
            question:
                'Create a class called "Rectangle" with properties for width and height. Add methods to calculate the area and perimeter of the rectangle. Then create an instance of the class and calculate its area and perimeter.',
            initialCode: '''
// Write your class and code here
''',
            validate: '''
              const isValid = (function() {
                return rectangle instanceof Rectangle &&
                  rectangle.calculateArea() === rectangle.width * rectangle.height &&
                  rectangle.calculatePerimeter() === 2 * (rectangle.width + rectangle.height);
              })();
            ''',
          ),
        ],
      ),
      LessonSection(
        content: '''
Now let's explore inheritance and polymorphism:

Inheritance allows a class to inherit properties and methods from another class. It promotes code reuse and establishes a relationship between the parent class (superclass) and the child class (subclass).

Polymorphism allows objects of different classes to be treated as objects of a common superclass. In JavaScript, this is often achieved through method overriding.
      ''',
        codeExample: '''
// Base class
class Animal {
  constructor(name) {
    this.name = name;
  }

  speak() {
    console.log(`\${this.name} makes a sound.`);
  }
}

// Inheritance
class Dog extends Animal {
  constructor(name, breed) {
    super(name); // Call the parent constructor
    this.breed = breed;
  }

  // Method overriding (polymorphism)
  speak() {
    console.log(`\${this.name} barks.`);
  }

  // Additional method
  fetch() {
    console.log(`\${this.name} fetches the ball.`);
  }
}

class Cat extends Animal {
  // Method overriding (polymorphism)
  speak() {
    console.log(`\${this.name} meows.`);
  }
}

// Creating instances
const genericAnimal = new Animal("Generic Animal");
const myDog = new Dog("Buddy", "Golden Retriever");
const myCat = new Cat("Whiskers");

// Demonstrating polymorphism
function makeAnimalSpeak(animal) {
  animal.speak();
}

makeAnimalSpeak(genericAnimal); // Generic Animal makes a sound.
makeAnimalSpeak(myDog);         // Buddy barks.
makeAnimalSpeak(myCat);         // Whiskers meows.

// Accessing inherited and own properties/methods
console.log(myDog.name);  // Buddy (inherited from Animal)
console.log(myDog.breed); // Golden Retriever
myDog.fetch();            // Buddy fetches the ball.

// instanceof operator
console.log(myDog instanceof Dog);    // true
console.log(myDog instanceof Animal); // true
console.log(myCat instanceof Dog);    // false

// Static methods (ES2015+)
class MathOperations {
  static add(x, y) {
    return x + y;
  }
}

console.log(MathOperations.add(5, 3)); // 8
      ''',
        exercises: [
          Exercise(
            question:
                'Create a class hierarchy for shapes. Start with a base class "Shape" that has a method to calculate area. Then create two subclasses: "Circle" and "Square". Implement the area calculation for each shape. Finally, create an array of different shapes and calculate the total area.',
            initialCode: '''
// Write your classes and code here
''',
            validate: '''
              const isValid = (function() {
                return Math.abs(new Circle(5).calculateArea() - 78.54) < 0.01 &&
                  new Square(4).calculateArea() === 16 &&
                  typeof totalArea === "number" && totalArea > 0;
              })();
            ''',
          ),
        ],
      ),
    ],
    difficulty: 'Intermediate',
    durationMinutes: 60,
    icon: Feather.box,
  ),
  Lesson(
    id: '20',
    title: 'Local Storage in JavaScript',
    description:
        'Learn how to use Local Storage to persist data in the browser. Understand how to store, retrieve, and manage data using the Web Storage API.',
    sections: [
      LessonSection(
        content: '''
Local Storage is part of the Web Storage API, which provides mechanisms for storing key-value pairs in a web browser. It allows web applications to store data locally within the user's browser, persisting even when the browser window is closed.

Key points about Local Storage:
1. Data is stored as strings
2. It has a larger storage capacity compared to cookies (typically around 5-10MB)
3. Data persists even when the browser is closed and reopened
4. It's specific to the protocol and domain of the page
5. It's synchronous, which means operations are performed immediately

Let's start with basic operations using Local Storage:
      ''',
        codeExample: '''
// Storing data
localStorage.setItem('username', 'JohnDoe');
localStorage.setItem('isLoggedIn', 'true');
localStorage.setItem('lastLogin', new Date().toISOString());

// Retrieving data
const username = localStorage.getItem('username');
console.log('Username:', username);  // Output: Username: JohnDoe

const isLoggedIn = localStorage.getItem('isLoggedIn') === 'true';
console.log('Is logged in:', isLoggedIn);  // Output: Is logged in: true

const lastLogin = new Date(localStorage.getItem('lastLogin'));
console.log('Last login:', lastLogin);  // Output: Last login: [Date object]

// Updating data
localStorage.setItem('username', 'JaneDoe');
console.log('Updated username:', localStorage.getItem('username'));  // Output: Updated username: JaneDoe

// Removing a specific item
localStorage.removeItem('lastLogin');
console.log('Last login after removal:', localStorage.getItem('lastLogin'));  // Output: Last login after removal: null

// Clearing all data in Local Storage
localStorage.clear();
console.log('Items after clear:', localStorage.length);  // Output: Items after clear: 0

// Checking if a key exists
if (localStorage.getItem('username') === null) {
  console.log('Username not found in Local Storage');
}

// Using the storage event (this would typically be in a different window or tab)
window.addEventListener('storage', function(e) {
  console.log('Storage changed:', e.key, e.oldValue, e.newValue);
});

// Note: The storage event doesn't fire in the same window that made the change
      ''',
        exercises: [
          Exercise(
            question:
                'Create a function called "saveUserPreferences" that takes an object with user preferences (e.g., theme, fontSize) and saves it to Local Storage. Then create another function called "getUserPreferences" that retrieves and returns these preferences.',
            initialCode: '''
// Write your functions here
function saveUserPreferences(preferences) {
  // Your code here
}

function getUserPreferences() {
  // Your code here
}

// Test your functions
const prefs = { theme: 'dark', fontSize: 16 };
saveUserPreferences(prefs);
console.log(getUserPreferences());
''',
            validate: '''
              const isValid = (function() {
                return localStorage.getItem("userPreferences") === '{"theme":"dark","fontSize":16}' &&
                  JSON.stringify(getUserPreferences()) === '{"theme":"dark","fontSize":16}';
              })();
            ''',
          ),
        ],
      ),
      LessonSection(
        content: '''
Now let's look at some more advanced concepts and best practices when working with Local Storage:

1. Storing complex data structures
2. Handling errors and exceptions
3. Using Local Storage with JSON
4. Local Storage limitations and alternatives
5. Security considerations

Remember that Local Storage is limited to storing strings, so we need to serialize and deserialize complex data structures.
      ''',
        codeExample: '''
// Storing complex data structures
const user = {
  id: 1,
  name: 'John Doe',
  roles: ['admin', 'editor'],
  settings: {
    notifications: true,
    theme: 'dark'
  }
};

try {
  localStorage.setItem('user', JSON.stringify(user));
  console.log('User data saved successfully');
} catch (error) {
  console.error('Failed to save user data:', error);
  // Handle quota exceeded error or other exceptions
}

// Retrieving and parsing complex data
try {
  const storedUser = JSON.parse(localStorage.getItem('user'));
  console.log('Retrieved user:', storedUser);
  console.log('User theme:', storedUser.settings.theme);
} catch (error) {
  console.error('Failed to retrieve user data:', error);
  // Handle parsing errors or missing data
}

// Checking available space (approximate method)
function getLocalStorageSpace() {
  let total = 0;
  for (let key in localStorage) {
    if (localStorage.hasOwnProperty(key)) {
      total += localStorage[key].length;
    }
  }
  return (total / 1024).toFixed(2) + " KB";
}

console.log('Used Local Storage space:', getLocalStorageSpace());

// Local Storage alternatives
// sessionStorage - similar API, but data is cleared when the page session ends
sessionStorage.setItem('sessionUser', 'JohnDoe');
console.log('Session user:', sessionStorage.getItem('sessionUser'));

// IndexedDB - for larger amounts of structured data (asynchronous)
// This is just a simple example, IndexedDB is much more powerful
const dbName = 'MyDatabase';
const request = indexedDB.open(dbName, 1);
request.onerror = (event) => console.error('IndexedDB error:', event.target.error);
request.onsuccess = (event) => {
  const db = event.target.result;
  console.log('IndexedDB opened successfully');
  // Use the database here
};

// Security note: Never store sensitive information (like passwords or tokens) in Local Storage
// It's accessible to any JavaScript code running on the same origin
      ''',
        exercises: [
          Exercise(
            question:
                'Create a "ShoppingCart" class that uses Local Storage to persist items. Implement methods to add items, remove items, clear the cart, and display the current cart contents. Each item should have a name and quantity.',
            initialCode: '''
class ShoppingCart {
  constructor() {
    // Initialize your shopping cart here
  }

  addItem(name, quantity) {
    // Implement this method
  }

  removeItem(name) {
    // Implement this method
  }

  clearCart() {
    // Implement this method
  }

  displayCart() {
    // Implement this method
  }
}

// Test your implementation
const cart = new ShoppingCart();
cart.addItem('Apple', 3);
cart.addItem('Banana', 2);
cart.displayCart();
cart.removeItem('Apple');
cart.displayCart();
cart.clearCart();
cart.displayCart();
''',
            validate: '''
              const isValid = (function() {
                return localStorage.getItem("shoppingCart").includes("Banana") &&
                  !localStorage.getItem("shoppingCart").includes("Apple") &&
                  localStorage.getItem("shoppingCart") === "[]";
              })();
            ''',
          ),
        ],
      ),
    ],
    difficulty: 'Intermediate',
    durationMinutes: 45,
    icon: Feather.hard_drive,
  ),
  Lesson(
    id: '21',
    title: 'ES6 Classes in JavaScript',
    description:
        'Learn about ES6 class syntax in JavaScript, including class declarations, methods, inheritance, and advanced features.',
    sections: [
      LessonSection(
        content: '''
ES6 introduced a more intuitive way to create objects and implement inheritance through the `class` keyword. While JavaScript remains prototype-based, the class syntax provides a cleaner and more familiar way to create object-oriented code.

Key concepts of ES6 Classes:
1. Class declarations
2. Constructor method
3. Instance methods
4. Static methods
5. Inheritance (extends keyword)
6. Super keyword
7. Getters and setters

Let's start with basic class syntax and instance methods:
      ''',
        codeExample: '''
// Basic class declaration
class Person {
  constructor(name, age) {
    this.name = name;
    this.age = age;
  }

  // Instance method
  sayHello() {
    console.log(`Hello, my name is \${this.name} and I'm \${this.age} years old.`);
  }

  // Another instance method
  haveBirthday() {
    this.age++;
    console.log(`Happy birthday! \${this.name} is now \${this.age} years old.`);
  }
}

// Creating an instance of the class
const john = new Person('John', 30);
john.sayHello();  // Output: Hello, my name is John and I'm 30 years old.
john.haveBirthday();  // Output: Happy birthday! John is now 31 years old.

// Class expression (less common, but possible)
const Animal = class {
  constructor(name) {
    this.name = name;
  }

  speak() {
    console.log(`\${this.name} makes a sound.`);
  }
};

const dog = new Animal('Rex');
dog.speak();  // Output: Rex makes a sound.
      ''',
        exercises: [
          Exercise(
            question:
                'Create a class called "Rectangle" with a constructor that takes width and height. Add methods to calculate the area and perimeter of the rectangle. Then create an instance and call both methods.',
            initialCode: '''
// Write your class and code here
''',
            validate: '''
              const isValid = (function() {
                return rect instanceof Rectangle &&
                  rect.calculateArea() === rect.width * rect.height &&
                  rect.calculatePerimeter() === 2 * (rect.width + rect.height);
              })();
            ''',
          ),
        ],
      ),
      LessonSection(
        content: '''
Now let's explore more advanced features of ES6 classes:

1. Static methods
2. Inheritance with extends and super
3. Getters and setters
4. Private fields (a more recent addition to JavaScript)

These features allow for more complex and flexible class structures.
      ''',
        codeExample: '''
class MathOperations {
  // Static method
  static square(x) {
    return x * x;
  }

  // Static property (ES2022+)
  static PI = 3.14159;
}

console.log(MathOperations.square(5));  // Output: 25
console.log(MathOperations.PI);  // Output: 3.14159

// Inheritance
class Animal {
  constructor(name) {
    this.name = name;
  }

  speak() {
    console.log(`\${this.name} makes a sound.`);
  }
}

class Dog extends Animal {
  constructor(name, breed) {
    super(name);  // Call the parent constructor
    this.breed = breed;
  }

  speak() {
    super.speak();  // Call the parent method
    console.log(`\${this.name} barks.`);
  }
}

const myDog = new Dog('Buddy', 'Golden Retriever');
myDog.speak();
// Output:
// Buddy makes a sound.
// Buddy barks.

// Getters and setters
class Circle {
  constructor(radius) {
    this._radius = radius;
  }

  get radius() {
    return this._radius;
  }

  set radius(value) {
    if (value > 0) {
      this._radius = value;
    } else {
      console.log('Radius must be positive');
    }
  }

  get area() {
    return Math.PI * this._radius ** 2;
  }
}

const circle = new Circle(5);
console.log(circle.radius);  // Output: 5
circle.radius = 7;
console.log(circle.area);  // Output: ~153.94

// Private fields (ES2022+)
class BankAccount {
  #balance = 0;  // Private field

  deposit(amount) {
    if (amount > 0) {
      this.#balance += amount;
      console.log(`Deposited \${amount}. New balance: \${this.#balance}`);
    }
  }

  getBalance() {
    return this.#balance;
  }
}

const account = new BankAccount();
account.deposit(100);
console.log(account.getBalance());  // Output: 100
// console.log(account.#balance);  // This would cause an error
      ''',
        exercises: [
          Exercise(
            question:
                'Create a "Vehicle" class with properties for make and model. Then create a "Car" class that extends Vehicle, adding a property for the number of doors. Include a method in Car that displays all the information about the car.',
            initialCode: '''
// Write your classes here
''',
            validate: '''
              const isValid = (function() {
                const car = new Car('Toyota', 'Corolla', 4);
                const info = car.displayInfo();
                return info.includes('Toyota') && info.includes('Corolla') && info.includes('4');
              })();
            ''',
          ),
        ],
      ),
    ],
    difficulty: 'Intermediate',
    durationMinutes: 50,
    icon: Feather.box,
  ),
  Lesson(
    id: '22',
    title: 'JavaScript Best Practices and Code Style',
    description:
        'Learn essential coding practices, style conventions, and patterns to write clean, efficient, and maintainable JavaScript code.',
    sections: [
      LessonSection(
        content: '''
Writing clean, readable, and maintainable code is crucial for professional JavaScript development. Following best practices and consistent code style helps improve code quality, reduces bugs, and enhances collaboration among developers.

Key areas we'll cover:
1. Naming conventions
2. Code formatting
3. Variable declarations
4. Function best practices
5. Comments and documentation
6. Error handling
7. Performance considerations

Let's start with naming conventions and code formatting:
      ''',
        codeExample: '''
// Naming Conventions
const MAX_ITEMS = 100;  // Constants in uppercase
let userName = 'John';  // camelCase for variables and function names
class UserProfile {}    // PascalCase for class names

// Avoid single-letter names except for loops or short callbacks
for (let i = 0; i < 5; i++) {
  console.log(i);
}

// Be descriptive with names
// Bad
const yyyymmdstr = moment().format('YYYY/MM/DD');
// Good
const currentDate = moment().format('YYYY/MM/DD');

// Code Formatting
// Use consistent indentation (2 or 4 spaces, or tabs)
function exampleFunction() {
  if (condition) {
    // do something
  } else {
    // do something else
  }
}

// Place opening braces on the same line
function goodBracing() {
  return {
    key: 'value'
  };
}

// Use semicolons to end statements
let x = 5;
let y = 10;
let z = x + y;

// Limit line length (often 80-120 characters)
const longString = 'This is a very long string that ' +
  'we break into multiple lines for readability';

// Use single quotes for strings (or be consistent with double quotes)
const name = 'Alice';

// Add spaces around operators
let sum = a + b;

// No space after function name
function doSomething(param1, param2) {
  // function body
}

// Separate logical sections with blank lines
function processData(data) {
  const processedData = data.map(item => item.toUpperCase());
  
  const filteredData = processedData.filter(item => item.length > 3);
  
  return filteredData;
}
      ''',
        exercises: [
          Exercise(
            question:
                'Refactor the following code to follow best practices for naming conventions and code formatting:',
            initialCode: '''
function calc(a,b,c){
if(a>b){
return a*c
}else{
return b*c
}}

const x=calc(5,3,2)
console.log(x)
''',
            validate: '''
              const isValid = (function() {
                return code.includes(' = ') && code.includes(' > ') &&
                  (code.toLowerCase().includes('calculate') || code.toLowerCase().includes('multiply')) &&
                  (code.includes('  ') || code.includes('    ')) &&
                  code.includes(';');
              })();
            ''',
          ),
        ],
      ),
      LessonSection(
        content: '''
Now let's explore more best practices related to variable declarations, functions, comments, error handling, and performance:

1. Variable declarations
2. Function best practices
3. Comments and documentation
4. Error handling
5. Performance considerations
      ''',
        codeExample: '''
// Variable Declarations
// Use const for values that won't be reassigned
const PI = 3.14159;
// Use let for values that will be reassigned
let counter = 0;
// Avoid var
// var x = 5;  // Don't use var

// Declare variables at the top of their scope
function processArray(arr) {
  let sum = 0;
  let average;
  
  for (let i = 0; i < arr.length; i++) {
    sum += arr[i];
  }
  
  average = sum / arr.length;
  return average;
}

// Function Best Practices
// Use arrow functions for short, non-method functions
const square = x => x * x;

// Use default parameters
function greet(name = 'Guest') {
  console.log(`Hello, \${name}!`);
}

// Avoid long parameter lists, use objects instead
// Bad
function createUser(firstName, lastName, age, email, password) {
  // ...
}
// Good
function createUser(userDetails) {
  const { firstName, lastName, age, email, password } = userDetails;
  // ...
}

// Comments and Documentation
/**
 * Calculates the average of an array of numbers.
 * @param {number[]} numbers - The array of numbers.
 * @returns {number} The average of the numbers.
 */
function calculateAverage(numbers) {
  const sum = numbers.reduce((acc, num) => acc + num, 0);
  return sum / numbers.length;
}

// Use comments to explain why, not what
// Bad
// Increment i
i++;

// Good
// Move to the next item in the list
i++;

// Error Handling
function divide(a, b) {
  if (b === 0) {
    throw new Error('Division by zero is not allowed');
  }
  return a / b;
}

try {
  const result = divide(10, 0);
  console.log(result);
} catch (error) {
  console.error('An error occurred:', error.message);
}

// Performance Considerations
// Use array methods instead of loops when possible
const numbers = [1, 2, 3, 4, 5];
const doubled = numbers.map(num => num * 2);

// Avoid global variables
// Bad
let globalCounter = 0;
// Good
function counterFunction() {
  let counter = 0;
  return function() {
    return ++counter;
  };
}
const incrementCounter = counterFunction();

// Use template literals for string concatenation
const name = 'Alice';
const greeting = `Hello, \${name}!`;

// Avoid using eval()
// Bad
// eval('console.log("Hello")');

// Use object and array destructuring
const person = { name: 'John', age: 30 };
const { name, age } = person;

// Use spread operator for shallow copies
const originalArray = [1, 2, 3];
const copyArray = [...originalArray];
      ''',
        exercises: [
          Exercise(
            question:
                'Refactor the following function to follow best practices for error handling, comments, and performance:',
            initialCode: '''
function processData(data) {
  var result = [];
  for (var i = 0; i < data.length; i++) {
    var item = data[i];
    if (item != null) {
      var processedItem = item.toString().toUpperCase();
      result.push(processedItem);
    }
  }
  return result;
}
''',
            validate: '''
              const isValid = (function() {
                return code.includes('const') &&
                  code.includes('let') && !code.includes('var') &&
                  (code.includes('.map(') || code.includes('.filter(')) &&
                  code.includes('try') && code.includes('catch') &&
                  (code.includes('//') || code.includes('/*'));
              })();
            ''',
          ),
        ],
      ),
    ],
    difficulty: 'Intermediate',
    durationMinutes: 60,
    icon: Feather.check_circle,
  )
];
