import 'package:equatable/equatable.dart';

abstract class MagazinesEvent extends Equatable {
  const MagazinesEvent();
}

class FetchMagazines extends MagazinesEvent {
  const FetchMagazines();

  @override
  List<Object> get props => [];
}