
abstract class NavbarState {}

final class NavbarInitial extends NavbarState {}
class Changebody extends NavbarState {

  int screennum;
  Changebody({
    required this.screennum,
  });
 }
