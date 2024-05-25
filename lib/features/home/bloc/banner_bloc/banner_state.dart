part of 'banner_bloc.dart';

@immutable
sealed class BannerState extends Equatable {}

final class BannerInitial extends BannerState {
  @override
  List<Object?> get props => [];
}

final class BannerLoading extends BannerState {
  @override
  List<Object?> get props => [];
}

final class BannerSuccess extends BannerState {
  BannerSuccess({required this.data});

  final List<QueryDocumentSnapshot<Map<String, dynamic>>> data;
  
  @override
  List<Object?> get props => [data];
}

final class BannerFailure extends BannerState {
  BannerFailure({required this.exception});

  final Object? exception;
  
  @override
  List<Object?> get props => [exception];
}
