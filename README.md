# MASM Hangman

A classic Hangman game implemented entirely in MASM assembly language, designed to run in DOSBox. This project demonstrates fundamental assembly programming concepts and direct manipulation of hardware using x86 registers-without relying on external libraries like Irvine.

---

## **Why Hangman in Assembly?**
Why not? It is a classic game that many enjoy implementing in low-level languages as a tradition. It’s a fun and rewarding challenge
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

---
