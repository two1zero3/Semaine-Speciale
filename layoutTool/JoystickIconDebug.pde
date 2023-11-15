void displayJoystickState() {

    miniControlSwitchTimer();

    //make createRandomJoystickDrift run for 10 seconds then invertMoveControls for 10 seconds then invertSensibility for 10 seconds then loop back to createRandomJoystickDrift
    float millisForFunction = millis() % 30000;
    if (millisForFunction < 10000) {
        createRandomJoystickDrift();
        // invertSensibility();
    } else if (millisForFunction < 20000) {
        invertMoveControls();
        // invertSensibility();
    }
    else if (millisForFunction < 30000) {
        invertSensibility2();
    }
    

    circle(100 + LX * 10,100 + LY * 10,10);
    pushStyle();
        noFill();
        strokeWeight(2);
        stroke(0);
        circle(100, 100, 35);
    
    textFont(UIFontSmall);
    textAlign(LEFT, TOP);
    text("LX: " + String.format("%.3f", LX), 10, 150);
    text("LY: " + String.format("%.3f", LY), 10, 200);
    popStyle();
}

void createRandomJoystickDrift() {
    // use noise instead of random
    // * 1 is the intensity of the drift
    // * 0.000X is the speed of the drift changes
    LX += (noise(millis() * 0.0004) - 0.5) * 1;
    LY += (noise(millis() * 0.0008) - 0.5) * 1;

    //constrain 
    LX = constrain(LX, -1, 1);
    LY = constrain(LY, -1, 1);
}

void invertMoveControls() {
    float temp = LX;
    LX = -LY;
    LY = temp;
}

void miniControlSwitchTimer() {
    //every 10 seconds mini stopwatch does 1 rotation 
    float millisForFunction = millis() % 10000;
    float angle = map(millisForFunction, 0, 10000, 0, 360);
    push();
        translate(width-100, height-100);
        scale(0.25);
        rotate(radians(angle));
        strokeWeight(5);
        stroke(0);
        line(0, 0, 0, -50);
        noFill();
        circle(0, 0, 100);
    pop();
}

// void invertSensibility() {
//     if (LX < -0.05) {
//         LX = map(LX, -1, -0.05, -0.05, -1);
//     } else if (LX > 0.05) {
//         LX = map(LX, 0.05, 1, 1, 0.05);
//     }

//     if (LY < -0.05) {
//         LY = map(LY, -1, -0.05, -0.05, -1);
//     } else if (LY > 0.05) {
//         LY = map(LY, 0.05, 1, 1, 0.05);
//     }
// }

void invertSensibility() {
    if (LX < -0.05) {
        LX = map(LX, -1, -0.05, -0.05, -1);
    } else if (LX > 0.05) {
        LX = map(LX, 0.05, 1, 1, 0.05);
    }

    if (LY < -0.05) {
        LY = map(LY, -1, -0.05, -0.05, -1);
    } else if (LY > 0.05) {
        LY = map(LY, 0.05, 1, 1, 0.05);
    }
}

void invertSensibility2 () {
    if (LX < -0.1 && LX > -0.25) {
        LX = LX*1.5;
    } else if (LX < -0.25 && LX > -0.5) {
        LX = LX*0.75;
    } else if (LX < -0.5 && LX > -0.75) {
        LX = LX*2;
    } else if (LX < -0.75 && LX > -1) {
        LX = LX*0.25;
    } else if (LX > 0.1 && LX < 0.25) {
        LX = LX*1.5;
    } else if (LX > 0.25 && LX < 0.5) {
        LX = LX*0.75;
    } else if (LX > 0.5 && LX < 0.75) {
        LX = LX*2;
    } else if (LX > 0.75 && LX < 1) {
        LX = LX*0.25;
    }

    if (LY < -0.1 && LY > -0.25) {
        LY = LY*1.5;
    } else if (LY < -0.25 && LY > -0.5) {
        LY = LY*0.75;
    } else if (LY < -0.5 && LY > -0.75) {
        LY = LY*2;
    } else if (LY < -0.75 && LY > -1) {
        LY = LY*0.25;
    } else if (LY > 0.1 && LY < 0.25) {
        LY = LY*1.5;
    } else if (LY > 0.25 && LY < 0.5) {
        LY = LY*0.75;
    } else if (LY > 0.5 && LY < 0.75) {
        LY = LY*2;
    } else if (LY > 0.75 && LY < 1) {
        LY = LY*0.25;
    }
}

void invertSensibility3() {
    float d = dist(LX, LY, activeItem.position.x, activeItem.position.y);
    if (d < -0.1 && d > -0.25) {
        LX = LX*1.5;
        LY = LY*1.5;
    } else if (d < -0.25 && d > -0.5) {
        LX = LX*0.75;
        LY = LY*0.75;
    } else if (d < -0.5 && d > -0.75) {
        LX = LX*2;
        LY = LY*2;
    } else if (d < -0.75 && d > -1) {
        LX = LX*0.25;
        LY = LY*0.25;
    } else if (d > 0.1 && d < 0.25) {
        LX = LX*1.5;
        LY = LY*1.5;
    } else if (d > 0.25 && d < 0.5) {
        LX = LX*0.75;
        LY = LY*0.75;
    } else if (d > 0.5 && d < 0.75) {
        LX = LX*2;
        LY = LY*2;
    } else if (d > 0.75 && d < 1) {
        LX = LX*0.25;
        LY = LY*0.25;
    }
}