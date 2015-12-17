class LineDrawer {  
  private Point _pmax;
  private Point _pmin;
  
  public LineDrawer(Point pmax, Point pmin) {
    _pmax = pmax;
    _pmin = pmin;
  }
  
  public void drawClippedLine(Line line) {
    int outcode0 = line.p0().outcode(_pmax, _pmin);
    int outcode1 = line.p1().outcode(_pmax, _pmin);
    boolean accept = false;
    
    int x0 = line.p0().x();
    int y0 = line.p0().y();
    int x1 = line.p1().x();
    int y1 = line.p1().y();
    
    while (true) {
      if ((outcode0 | outcode1) == 0) {
        accept = true;
        break;
      } else if ((outcode0 & outcode1) != 0) {
        break;
      } else {
        int x = 0;
        int y = 0;

        int outcodeOut = (outcode0 != 0) ? outcode0 : outcode1;
  
        if ((outcodeOut & _TOP) != 0) {
          x = x0 + (x1 - x0) * (_pmax.y() - y0) / (y1 - y0);
          y = _pmax.y();
        } else if ((outcodeOut & _BOTTOM) != 0) {
          x = x0 + (x1 - x0) * (_pmin.y() - y0) / (y1 - y0);
          y = _pmin.y();
        } else if ((outcodeOut & _RIGHT) != 0) {
          y = y0 + (y1 - y0) * (_pmax.x() - x0) / (x1 - x0);
          x = _pmax.x();
        } else if ((outcodeOut & _LEFT) != 0) {
          y = y0 + (y1 - y0) * (_pmin.x() - x0) / (x1 - x0);
          x = _pmin.x();
        }
  
        // Now we move outside point to intersection point to clip
        // and get ready for next pass.
        if (outcodeOut == outcode0) {
          x0 = x;
          y0 = y;
          Point p = new Point(x0, y0);
          outcode0 = p.outcode(_pmax, _pmin);
        } else {
          x1 = x;
          y1 = y;
          Point p = new Point(x1, y1);
          outcode1 = p.outcode(_pmax, _pmin);
        }
      }
    }
    if (accept) {
      // Following functions are left for implementation by user based on
      // their platform (OpenGL/graphics.h etc.)
      stroke(LINECOLOR);
      line(x0, y0, x1, y1);
    }
  }
}