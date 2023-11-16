void displayJoystickState() {

    miniControlSwitchTimer();

    //make createRandomJoystickDrift run for 10 seconds then invertMoveControls for 10 seconds then invertSensibility for 10 seconds then loop back to createRandomJoystickDrift
    float millisForFunction = millis() % 30000;
    if (millisForFunction < 10000) {
        createRandomJoystickDrift();
        // invertSensibility();
    } else if (millisForFunction < 20000) {
        invertMoveControls(millis() * 0.0002);
        // invertSensibility();
    }
    else if (millisForFunction < 30000) {
        invertSensibility2();
    }
    
    //draw joystick
    int bottomOffset = height - 35;
    int offsetCircle = 35;
    int offsetText = 75;
    int offsetTitle = 200;
    int offsetDescription = width - 35;
    pushStyle();
        fill(0);
        noStroke();
        circle(offsetCircle + LX * 10, bottomOffset + LY * 10, 5);
    popStyle();

    pushStyle();
        noFill();
        strokeWeight(1);
        stroke(0);
        circle(offsetCircle, bottomOffset, 35);
    popStyle();

    pushStyle();
        noStroke();
        fill(0);
        textFont(UIFontMono);
        textAlign(LEFT, TOP);
        text("LX: " + String.format("%.3f", LX), offsetText, bottomOffset - 20);
        text("LY: " + String.format("%.3f", LY), offsetText, bottomOffset);
    popStyle();

    pushStyle();
        noStroke();
        fill(0);
        textFont(UIFontMono);
        textAlign(LEFT, TOP);
        text("NOT INTUITIVE", offsetTitle, bottomOffset - 20);
    popStyle();

    pushStyle();
        noStroke();
        // textLeading()
        fill(0);
        textFont(UIFontMono);
        textAlign(RIGHT, TOP);
        text("REDISCOVER YOUR CHILDLIKE SOUL BY LOSING YOUR USUAL \n BEARINGS AND CREATING INSTINCTIVELY AND RANDOMLY.", offsetDescription, bottomOffset-20);
    popStyle();


}

void createRandomJoystickDrift() {
    // use noise instead of random
    // * 1 is the intensity of the drift
    // * 0.000X is the speed of the drift changes
    LX += (noise(millis() * 0.0004*3) - 0.5) * 2;
    LY += (noise(millis() * 0.0008*3) - 0.5) * 2;

    //constrain 
    LX = constrain(LX, -1, 1);
    LY = constrain(LY, -1, 1);
}

void invertMoveControls(float a) {
    //a is in radians

    LX = LX * cos(a) - LY * sin(a);
    LY = LX * sin(a) + LY * cos(a);
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