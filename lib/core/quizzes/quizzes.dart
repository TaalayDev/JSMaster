import '../../data.dart';

const List<Quiz> quizzesList = [
  Quiz(
    id: '1',
    title: 'JavaScript Basics',
    description: 'Test your knowledge of JavaScript fundamentals',
    difficulty: 'Beginner',
    durationMinutes: 15,
    questions: [
      QuizQuestion(
        question: 'What keyword is used to declare a variable in JavaScript?',
        options: ['var', 'let', 'const', 'All of the above'],
        correctOptionIndex: 3,
      ),
      QuizQuestion(
        question: 'Which of the following is not a JavaScript data type?',
        options: ['Number', 'String', 'Boolean', 'Float'],
        correctOptionIndex: 3,
      ),
      QuizQuestion(
        question: 'What is the correct way to write a comment in JavaScript?',
        options: [
          '# This is a comment',
          '// This is a comment',
          '<!-- This is a comment -->',
          '/* This is a comment */'
        ],
        correctOptionIndex: 1,
      ),
    ],
  ),
  Quiz(
    id: '2',
    title: 'JavaScript Functions',
    description: 'Test your understanding of JavaScript functions',
    difficulty: 'Intermediate',
    durationMinutes: 20,
    questions: [
      QuizQuestion(
        question: 'What is a closure in JavaScript?',
        options: [
          'A way to secure your code',
          'A function with access to variables in its outer scope',
          'A method to close a browser window',
          'A type of loop',
        ],
        correctOptionIndex: 1,
      ),
      QuizQuestion(
        question:
            'Which of the following correctly declares an arrow function?',
        options: [
          'function myFunc() => {}',
          'const myFunc = function() {}',
          'const myFunc = () => {}',
          'let myFunc = => {}',
        ],
        correctOptionIndex: 2,
      ),
      QuizQuestion(
        question:
            'What does the "this" keyword refer to in a regular function?',
        options: [
          'The global object',
          'The object that called the function',
          'The function itself',
          'It depends on how the function is called',
        ],
        correctOptionIndex: 3,
      ),
    ],
  ),
];
