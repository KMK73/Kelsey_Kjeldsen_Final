
Catcher catcher;    // One catcher object
Timer timer;        // One timer object
Drop[] drops;       // An array of drop objects
int totalDrops = 0; // totalDrops
//setting the boxes
Box box1;
Box box2;
Box box3;
Box box4;

// A boolean to let us know if the game is over
boolean gameOver = false;

// Variables to keep track of score, level, lives left
int score = 0;      // User's score
int level = 1;      // What level are we on
int lives = 5;     // 5 lives per level 
int levelCounter = 0; //counting for the levels 

PFont f;

void setup() {
  size(500, 500);
  smooth();
  ellipseMode(CENTER);

  /*code adapted from:
   // Learning Processing
   // Daniel Shiffman
   adapted by: Kelsey Kjeldsen
   ********************************************************/

  catcher = new Catcher(); // Create the catcher 
  drops = new Drop[1000];    // Create 1000 spots in the array (each level now just has 25 drops)
  timer = new Timer(500);   // Create a timer that goes off every .5 second
  timer.start();             // Starting the timer

  f = createFont("Arial", 12, true); 
  box1 = new Box();
  box2 = new Box();
  box3 = new Box();
  box4 = new Box();
}

void draw() {
  background(255);

  // If the game is over
  if (gameOver) {
    textFont(f, 40);
    textAlign(CENTER);
    fill(0);
    text("GAME OVER", width/2, height/2);
    fill(255, 0, 0);
    textFont(f, 20);
    text("SCORE " +score, width/2, height/2+40);
    
    
  void reset() {
    // reset game
    // Variables to keep track of score, level, lives left
    int score = 0;      // User's score
    int level = 1;      // What level are we on
    int lives = 5;     // 5 lives per level 
    int levelCounter = 0;
    boolean caught = false;
    gameover=false;
    frameCount=0;
  }

  void mouseClicked() {
    if (gameover) reset();
  }
  } else {

    //display boxes 
    box1.display();
    box2.display();
    box3.display();
    box4.display();

    // Display the catcher
    catcher.display(); 
    catcher.move();
    catcher.keyPressed();

    // Check the timer
    if (timer.isFinished()) {
      // if timer is finished send another drop
      // Initialize one drop
      drops[totalDrops] = new Drop();
      totalDrops++;
      if (totalDrops >= drops.length) { 
        // start array over
        totalDrops=0;
      }
      timer.start();
    }

    // Move and display all drops
    for (int i = 0; i < totalDrops; i++ ) {
      drops[i].move();
      drops[i].display();
      // Everytime you catch a drop, the score goes up
      if (catcher.isCollidingCircle(drops[i])) {
        drops[i].caught();
        levelCounter++; //count this in amount of drops before new level
        score++;
      }
    }

    if (catcher.isCollidingBox(box1)) {
      lives--;
      box1.resetWhenCollisionDetected(); //allow the box to go back to the top
      //If lives reach 0 the game is over
      if (lives <= 0) {
        gameOver = true;
      }
    }
    if (catcher.isCollidingBox(box2)== true) {
      lives--;
      box2.resetWhenCollisionDetected();
      if (lives <= 0) {
        gameOver = true;
      }
    }
    if (catcher.isCollidingBox(box3)== true) {
      lives--;
      box3.resetWhenCollisionDetected();
      if (lives <= 0) {
        gameOver = true;
      }
    }
    if (catcher.isCollidingBox(box4)== true) {
      lives--;
      box4.resetWhenCollisionDetected();
      if (lives <= 0) {
        gameOver = true;
      }
    }

    // If 25 drops are caught, that level is over!
    if (levelCounter >= 25) { 
      // Go up a level
      level++;
      // Reset all game elements
      levelCounter = 0;
      //lives++; //add a life every level 
      totalDrops = 0;
    }



    // Display number of lives left
    textFont(f, 14);
    fill(0);
    text("Lives left: " + lives, 10, 20);
    fill(#989898);
    stroke(1);
    rect(10, 24, lives*20, 20); //line showing levels and the width is adjusted everytime you lose a life
    fill(0);
    text("Level: " + level, 300, 20);
    text("Score: " + score, 300, 40);
  }

//  void reset() {
//    // reset game
//    // Variables to keep track of score, level, lives left
//    int score = 0;      // User's score
//    int level = 1;      // What level are we on
//    int lives = 5;     // 5 lives per level 
//    int levelCounter = 0;
//    boolean caught = false;
//    gameover=false;
//    frameCount=0;
//  }
//
//  void mouseClicked() {
//    if (gameover) reset();
//  }
}

