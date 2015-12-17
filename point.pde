class Point {  
  private int _x;
  private int _y;
  private int _square_size = 10;
  
  public Point(int x, int y) {
    _x = x;
    _y = y;
  }
  
  public int x() {
    return _x;
  }
  
  public int y() {
    return _y;
  }
  
  public int squareSize() {
    return _square_size;
  }
  
  public boolean isUnderCursor() {
    return (abs(mouseX - _x) <= _square_size / 2
         && abs(mouseY - _y) <= _square_size / 2);
  }
  
  public int outcode(Point pmax, Point pmin) {
    int code;

    code = _INSIDE;          // initialised as being inside of clip window
  
    if (_x < pmin.x())           // to the left of clip window
      code |= _LEFT;
    else if (_x > pmax.x())      // to the right of clip window
      code |= _RIGHT;
    if (_y < pmin.y())           // below the clip window
      code |= _BOTTOM;
    else if (_y > pmax.y())      // above the clip window
      code |= _TOP;
  
    return code;
  }
}