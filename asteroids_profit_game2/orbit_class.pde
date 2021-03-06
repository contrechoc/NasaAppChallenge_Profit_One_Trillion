class Orbit {
  float ma  ;
  float e  ;
  float a   ;
  float n  ;
  float profit;
  PVector position;
  int playerNumber = 0;
  int mined = 0;
  
  Orbit(   float maI, float eI, float aI, float nI, float profitI) {
    ma = maI; 
    e = eI; 
    a = aI; 
    n = nI;
    profit = profitI;
    position = new PVector(0, 0);
  }
  void setPlayerNumber(int pNumber) {
    playerNumber = pNumber;
  }
  void setMined() {
    mined = 1;
  }
  float getProfit() {
    return profit;
  }

  void drawOrbitOnDayNumber(float dayNumber, Sun sun) {
    float M = ma + n * dayNumber;
    float E0 = M + e*   sin(ma ) * ( 1.0 + e * cos(ma ));

    float E1 = E0 - ( E0 - e * sin(E0) - M ) / ( 1 - e* cos(E0) );

    while ( abs ( E1 - E0 ) > .0005 ) {
      E0 = E1;
      E1 = E0 - ( E0 - e*  sin(E0 ) - M ) / ( 1 - e * cos(E0 ) );
    }

    float xv =  a * ( cos(E1 ) - e );
    float yv =  a * ( sqrt(1.0 - e*e) * sin(E1) );

    position.x = width/2 + xv*solarSystemX;
    position.y = height/2 + yv*solarSystemY;

    if ( mined < 1 ) fill( 0, 255, 0); 
    else fill(255, 0, 0);

    ellipse( position.x + offSetX, position.y + offSetY, profit/30, profit/30 );

    if ( playerNumber > 0 ) {

      noFill();
      stroke(255, 255, 255);
      ellipse( position.x + offSetX, position.y + offSetY, 20, 40 );
      ellipse( position.x + offSetX, position.y + offSetY, 40, 20 );
      
    }
  }
}

