final Point PMAX = new Point(525, 525);
final Point PMIN = new Point(75, 75);

Points points = new Points();
LineDrawer lineDrawer = new LineDrawer(PMAX, PMIN);
Drawer drawer = new Drawer(points, lineDrawer);
PointController pCtrl = new PointController(points, drawer);

void setup() {
  size(600, 600);
  drawer.clear();
}

void draw() {
  pCtrl.moveCapturedUnderCursor();
}

void mousePressed() {
  int k = points.pointUnderCursor();

  if (mouseButton == LEFT) {
    if (k > -1) {
      pCtrl.capture(k);
    }
    else {
      pCtrl.addPoint(new Point(mouseX, mouseY));
      pCtrl.capture(points.size() - 1);
    }
  }
  else {
    if (k > -1) {
      pCtrl.delete(k);
      drawer.drawEverything();
    }
  }
}

void mouseReleased() {
  pCtrl.release();
}