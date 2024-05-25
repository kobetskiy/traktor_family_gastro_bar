part of 'banner_bloc.dart';

sealed class BannerEvent extends Equatable {}

class LoadBannersList extends BannerEvent {
  LoadBannersList();

  @override
  List<Object?> get props => [];
}
