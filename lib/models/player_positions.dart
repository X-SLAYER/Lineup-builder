import 'dart:ui';

class PlayerPosition {
  Offset offset;

  PlayerPosition(this.offset);

  initCords(Offset offset) {
    this.offset = offset;
  }
}
