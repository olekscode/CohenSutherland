class Line {
  private Point _p0;
  private Point _p1;
  
  public Line(Point p0, Point p1) {
    _p0 = p0;
    _p1 = p1;
  }
  
  public Point p0() {
    return _p0;
  }
  
  public Point p1() {
    return _p1;
  }
}