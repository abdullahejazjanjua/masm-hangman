# MASM Hangman

A classic Hangman game implemented entirely in MASM assembly language, designed to run in DOSBox. This project demonstrates fundamental assembly programming concepts and direct manipulation of hardware using x86 registers-without relying on external libraries like Irvine.

---

## **Why Hangman in Assembly?**
Why not? It is a classic game that many enjoy implementing in low-level languages as a tradition. It’s a fun and rewarding challenge

--- 

## **Features**

- Complete Hangman game logic written in MASM for x86 DOS environments.
- No external dependencies or helper libraries-pure assembly code.
- Runs seamlessly in DOSBox, making it accessible on modern systems.
- All input, output, and game flow handled using basic CPU registers and instructions.

---

## **Getting Started**

**Prerequisites**

- [DOSBox](https://www.dosbox.com/) (for running 16-bit DOS programs on modern OS)
- MASM assembler (Microsoft Macro Assembler)
- Basic understanding of assembly language and x86 architecture

**Setup Instructions**

1. Install DOSBox and MASM.  
   If you need help setting up MASM in DOSBox, [this video guide](https://youtu.be/-IJA4lIeLcc?si=cP5GnxYGWFdz01oN) walks you through the process step by step.
2. Clone or download this repository.
3. Mount your project directory in DOSBox.
4. Assemble and link the source code using MASM commands. 
    You need to have masm.exe, link.exe in your present working directory.
5. Run the executable in DOSBox and enjoy the game!

---

## **How to Play**

- The game randomly selects a word.
- Guess one letter at a time.
- Each incorrect guess draws another part of the hangman.
- Win by guessing all letters before the hangman is fully drawn.

---

## **Learning Resources**
 - [Check out this YouTube playlist](https://www.youtube.com/watch?v=84k99MX5R28&list=PLMa5a9Dh6SlhJq4wCH_CLSdfRaAbuJTzb) for beginner-friendly tutorials.

> **Tip:** Having taken a Computer Organization and Assembly Language (COAL) course or similar will significantly improve your understanding of the concepts.


To gain a solid grasp of MASM, try implementing the following programs step-by-step:

1. **Add Two Numbers**  
   Write a program that takes two numbers as input from the user, adds them, and prints the result.

2. **Sum of 10 Numbers Using a Loop**  
   Create a program that reads 10 numbers from the user, sums them using a loop, and displays the total.

3. **Use Macros and Procedures**  
   Refactor one of the above programs to use a macro or procedure to modularize your code.

4. **Sum Two Arrays**  
   Given two arrays, compute a third array where each element is the sum of the corresponding elements in the first two arrays. Print the resulting array.

5. **Random Number Generation**  
   Implement a routine to generate a random number within a specified range.

6. **Guess the Number Game**  
   Build a simple game where the program randomly selects a number and the user tries to guess it, with feedback on each guess.

> **Note:** You can check my solutions to these problems in the `\practice` directory.

> ## **Disclaimer**
> 
> This project was created primarily for my own understanding of MASM and as part of my course work. I have shared it publicly to help others learn MASM and assembly programming.  
> Please use this code responsibly and ethically. I am not responsible for any misuse, including academic dishonesty or plagiarism. Always follow your institution’s academic integrity policies when using or referencing this code.
