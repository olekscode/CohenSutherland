class Points {
  private Point[] _arr;
  private int _size;
  private int _capacity;
  
  public Points() {
    _capacity = 3;
    _arr = new Point[_capacity];
    _size = 0;
  }
  
  public int size() {
    return _size;
  }
  
  public int capacity() {
    return _capacity;
  }
  
  public void shrink_to_fit() {
    _resize_array(_size);
  }
  
  public void append(Point p) {
    _extend();
    _arr[_size] = p;
    ++_size;
  }
  
  public Point getPoint(int index) {
    return _arr[index];
  }
  
  public int pointUnderCursor() {
    for (int i = 0; i < _size; ++i) {
      if (_arr[i].isUnderCursor()) {
        return i;
      }
    }
    return -1;
  }
  
  public void update(int index, Point p) {
    _arr[index] = p;
  }
  
  public void remove(int index) {
    for (int i = index; i < _size - 1; ++i) {
      _arr[i] = _arr[i + 1];
    }
    --_size;
    _shrink();
  }
  
  private void _extend() {
    // TODO: Find a better algorithm
    if (_size == _capacity) {
      // TODO: Remove this mess
      if (_capacity == 0) {
        _capacity = 3;
      }
      else {
        _capacity *= 2;
      }
      _resize_array(_capacity);
    }
  }
  
  private void _shrink() {
    // TODO: Find a better algorithm
    if (_size * 2 < _capacity) {
      _capacity /= 2;
      _resize_array(_capacity);
    }
  }
  
  private void _resize_array(int cap) {
    if (cap >= _size) {
      _capacity = cap;
      Point[] new_arr = new Point[_capacity];
      
      for (int i = 0; i < _size; ++i) {
        new_arr[i] = _arr[i];
      }
      
      _arr = new_arr;
    }
    else {
      // TODO: Create an exception
      println("ERROR: The array won't be resized as there may be a loss of data.");
    }
  }
}