import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:traktor_family_gastro_bar/features/home/data/service/banner_service.dart';
import 'package:traktor_family_gastro_bar/features/data/exeptions.dart';

part 'banner_event.dart';
part 'banner_state.dart';

class BannerBloc extends Bloc<BannerEvent, BannerState> {
  BannerBloc() : super(BannerInitial()) {
    on<LoadBannersList>((event, emit) async {
      try {
        emit(BannerLoading());
        final bannerServise = BannerService();
        final data = await bannerServise.getBanners();
        if (data.docs.isEmpty) throw ServerExeption();
        emit(BannerSuccess(data: data.docs));
      } catch (e) {
        emit(BannerFailure(exception: e));
      }
    });
  }
}
