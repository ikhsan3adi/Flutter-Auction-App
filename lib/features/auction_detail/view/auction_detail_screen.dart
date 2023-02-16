import 'package:aplikasi_lelang_online/features/auction_detail/auction_detail.dart';
import 'package:aplikasi_lelang_online/shared/shared.dart';
import 'package:assorted_layout_widgets/assorted_layout_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuctionDetailScreen extends StatelessWidget {
  const AuctionDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: const CoolAppBar(),
      body: NotificationListener<ScrollNotification>(
        onNotification: (scroll) {
          if (scroll.metrics.axis != Axis.vertical) return false;
          if (scroll.metrics.pixels < 520) {
            context.read<AppbarCubit>().scrolled(scroll.metrics.pixels);
            return true;
          }
          return false;
        },
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ColumnSuper(
                innerDistance: -85,
                children: const [
                  HeroProductImage(),
                  AuctionInformation(),
                ],
              ),
              const AuctionProductProperty(),
              const SectionTitle(text: "Penawaran saya"),
              const MyBid(),
              const SectionTitle(text: "Daftar penawar"),
              const BidderList(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BidButton(textTheme: textTheme),
    );
  }
}