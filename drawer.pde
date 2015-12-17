class Drawer {
  private Points _points;
  private LineDrawer _lineDrawer;
  
  public Drawer(Points points, LineDrawer lineDrawer) {
    _points = points;
    _lineDrawer = lineDrawer;
  }
  
  public void drawPoint(Point p) {
    int offset = 10;
    int text_x = p.x() + offset;
    int text_y = p.y() + offset;
    
    fill(OUTCODECOLOR);
    text(Integer.toBinaryString(0x10 | p.outcode(PMAX, PMIN)).substring(1), text_x, text_y);
    
    stroke(POINTCOLOR);
    fill(POINTCOLOR, 100);
    int sq_size = p.squareSize();
    rect(p.x() - sq_size / 2, p.y() - sq_size / 2, sq_size, sq_size);
  }
  
  public void drawPoint(int index) {
    Point p = _points.getPoint(index);   
    drawPoint(p);
  }
  
  public void drawEverything() {
    clear();
    
    if (_points.size() > 0) {
      drawPoint(0);
      
      for (int i = 1; i < _points.size(); ++i) {
        drawPoint(i);
        
        if (i % 2 == 1) {
          _lineDrawer.drawClippedLine(new Line(_points.getPoint(i - 1), _points.getPoint(i)));
        }
      }
    }
  }
  
  public void clear() {
    background(BACKGROUNDCOLOR);
    fill(SQUARECOLOR);
    stroke(SQUARECOLOR);
    rect(75, 75, 450, 450);
  }
}