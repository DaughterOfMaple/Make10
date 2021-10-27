# 🚆 Make10
Four digits, one answer. Can YOU make 10?

## Contents
- [Background](#background)
- [Overview](#overview)
  * [Features](#features)
  * [User Interface](#user-interface)
- [Concepts learnt](#concepts-learnt)
  * [OOP](#oop)
  * [Swift5](#swift5)
  * [MVC](#mvc)
  * [Auto Layout](#auto-layout)
  * [TabBar Navigation](#tabbar-navigation)
  * [UITableView & UICollectionView](#uitableview-&-uicollectionview)
  * [Drag and Drop](#drag-and-drop)
  * [Gesture Recognizers](#gesture-recognizers)
  * [Data persistence with Core Data](#data-persistence-with-core-data-(TBC))
- [TODO](#todo)
  * [Priority fixes](#priority-fixes)
  * [Future ambitions](#future-ambitions)

## Background
You're standing at the station, it's hot and stuffy.
Town Hall station has the fans on and water spraying in the underground platforms and you're bored.
The train pulls up - not you, it's a Waterfall train and you're going to Cronulla. 
But you notice the four numbers on the side of the carriage...  
People at school have been talking about a game. So many carriages, four digits, one answer.

My challenge: to reproduce the Make Ten Game on mobile.

## Overview
This app is a game in which the user is presented with 4 random numbers with which to make the number 10.  
Start a game and drag the operators between the numbers to create an expression that will equal 10. You can check your answer with the 'Check' button.

### Features
1.	A timer, to record the time taken to complete the challenge.
2.	A random number generator.
3.  An option for custom number input.
4.  An option to pause the game (this will hide the current game screen).
5.  8 different operators and parentheses to manipulate the numbers.
6.  A 'Clear' button to remove all operators.
7.  A 'Check' button to check your answer.
8.  Persistence of data to track game statistics such as total number of games, best time and longest streak.
9.  Future features (WIP):
    - Time challenges
    - Share a challenge with a friend
    - Achievement badges
    - 'Pass' button
    - User instructions/Help button

### User interface
<img src="MakeTen.png" alt="User interface" align="center" width="100%"/>

#### Make Ten Page
The Make Ten page is the main page of the application and has several buttons for user interaction and labels for information:
  -	In the top nav bar, from left to right are the following:
    - Toggle 'classic' mode and 'time challenge' mode (TBC)
    - Share game with a friend (TBC)
    - Current game streak (TBC)
    - Play/Pause
  - The Custom button provides an input window to create and start a new game with custom numbers 
  - The Timer records the time passed since the start of the game
  - The Random button starts a game with 4 random numbers 
  - The main game container (a UICollectionView) initially contains only the 4 numbers for the game. The user can then drag and drop operators from below into this container, to create a mathematical expression. A single tap can also be used to either delete an operator or toggle a number between positive and negative values.
  - The label below the main game ('Can you make 10?') provides feedback to the user, including the result of their expression when they check it.
  - The operators can be dragged into the main game container to create a mathematical expression.
  - The 'Clear' button removes all operators from the main game container.
  - The 'Check' button calculates the value of the expression and presents it with a success/failure message.
  - Tabs at the bottom of the screen allow the user to move between pages.

#### Stats Page (TBC)
The Stats Page displays historical user stats and recent games completed. 

#### Achievements Page (TBC)
The Achievements Page will display badges as they are achieved by the user. 

## Concepts learnt

### OOP
Programming in Swift was my first experience with Object Oriented Programming and the Make10 game was one of my first more comprehensive personal projects. As such, I learnt a lot about Object Oriented programming (and the refactoring process) during this project. I might even venture to say that this is actually my first 10 projects, all bundled into one final result 😅.

Now that I have worked on other projects and learnt more about OOP, I might give it another round or two of refactoring (AFTER I implement some Unit Testing, to make sure I don't break everything on the way).

### Swift5
Once I decided to learn more about software development, I began with a Udemy course in Swift Programming. Throughout this course, I completed several small projects to learn different programming concepts, but had in mind a few larger personal projects to work on in the background that combined the concepts learn - the Make10 game was one of these. 

Since I began learning Swift 2 years ago, I have had the opportunity to investigate other programming languages and styles, but Swift remains my favourite.

### MVC
The pattern of Model-View-Controller was chosen as the recommended model used in iOS applications. 
Although I didn't at this time understand or learn to implement Unit Testing, I could still appreciate the value of separating the presentation elements of the application from its logic. There are still many things about MVC, MVVM, OOP, unit testing and software best practices that I look forward to learning with a team. To date, I have received little to no feedback on my code, which I believe is one of my biggest weaknesses. I am very keen to work with a team and learn all about the best ways to implement the concepts I have been learning about.

### Auto Layout
I primarily used the Main Storyboard to create the Make10 interface, taking advantage of the constraints and properties available to create a responsive layout for the different pages of the application.

### TabBar Navigation
I chose to use TabBar Navigation in this game, as it seemed the most straightforward for the user to understand. This was new to me, but was quite easy to set up in the Main Storyboard, so was well suited to my level of experience.

### UITableView & UICollectionView
The UITableView seems to be one of the of the fundamental elements of many applications. As such, it was good to get familiar with its different elements and limitations on the Stats Page.
I used a number of UICollectionViews in the MakeTen Page, as well as the Achievements Page of the application. Some challenges I came across include: defining 2 UICollectionViews with different elements in the same ViewController (I'm not sure that my solution to this is particularly elegant); defining re-usable cells; defining the flowlayout. My most interesting challenges, however, are outlined in the sections below.

#### Drag and Drop
Wow. This one had me stumped for a while! Since I needed items to drag between different UICollectionViews and act differently depending on where they were coming from and where they were going, this took me some time to decipher. I used print statements to debug the source and destination values, so I could break down the behaviour on a case-by-case basis. 

#### Gesture Recognizers
Another challenging topic, because of the existing GestureRecognizers inherent to the UICollectionView.  
The main element that caused me some grief was that I wanted to be able to both tap a cell and drag a cell, with little to no delay on the drag pickup.  
I finally made this happen by modifying the existing UILongPressGestureRecognizer of the UICollectionView and adding a new UITapGestureRecognizer to handle the desired tap behaviour.

### Data persistence with Core Data (TBC)

## TODO

### Priority fixes
1. Debug play button - this shouldn't be usable without starting a game (currently can start the timer with no game).
2. Debug the Achievements Page UICollectionView layout - layout sometimes jumps out of alignment
3. Investigate 'XPC connection interrupted' error - this occasionally freezes the application
4. Clean up code (remove redundant debugging print statements)
5. Add user stats data (Core data + calculations)
6. Update logic so that once the game is completed successfully, the check button is disabled
7. Develop comprehensive test plan and unit tests
8. Add pull-down top menu
9. Add application icon

### Future ambitions
- Time challenges
- Share a challenge with a friend
- Achievement badges
- 'Pass' button
- User instructions/Help button
- Recognise 'impossible' number permutations and difficulty of solution
