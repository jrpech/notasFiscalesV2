import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';
import 'package:notas_fiscales/models/models.dart';

abstract class MagazinesState extends Equatable {
  const MagazinesState();

  @override
  List<Object> get props => [];
}

class MagazinesEmpty extends MagazinesState {}

class MagazinesLoading extends MagazinesState {}

class MagazinesLoaded extends MagazinesState {
  final List<Magazine> magazines;

  const MagazinesLoaded({@required this.magazines}) : assert(magazines != null);

  @override
  List<Object> get props => [magazines];
}

class MagazinesError extends MagazinesState {}