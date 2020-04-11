public class Fish {

  int x, y, yinitial, rand, speed, yspeed;

  Fish() {
    rand=(int)random(3);
    x=-500;
    yinitial=(int)(random(700)+25);
    y=yinitial;
    speed=1;
    yspeed=speed*2;
  }

  void show() {
    if (rand==1) {
      image(red, x, y);
    } else if (rand==2) {
      image(blue, x, y);
    } else {
      image(yellow, x, y);
    }
  }

  void move() {
    x+=speed;
    y+=yspeed;
    if(y>yinitial+50||y<yinitial-50){
      yspeed*=-1;
    }
    if (x>=1370) {
      rand=(int)(random(3));
      x=-500;
      yinitial=(int)(random(700)+25);
      y=yinitial;
    }
  }

  int getX() {
    return x;
  }

  int getY() {
    return y;
  }
}
