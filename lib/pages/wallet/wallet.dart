import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import 'package:krowd_invesment_footer/config/const.dart';
import 'package:krowd_invesment_footer/config/ultility.dart';
import 'package:krowd_invesment_footer/pages/wallet/view/add.dart';

import '../../data/wallet.dart';
import '../../modules/repository/wallet_repo/models/wallet_dto.dart';

class Wallet extends StatelessWidget {
  const Wallet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<WalletDTO>>(
        future: fetchWalletAndPopulateList(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator();
          } else if (snapshot.hasData) {
            final walletList = snapshot.data;
            return Scaffold(
              appBar: AppBar(
                title: const Text('My wallet'),
              ),
              body: SafeArea(
                maintainBottomViewPadding: true,
                child: Column(
                  children: [
                    const SizedBox(
                      height: 5,
                    ),
                    _mywallet(walletList),
                    const SizedBox(
                      height: 5,
                    ),
                    _transaction(context),
                    _history(context)
                  ],
                ),
              ),
            );
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else {
            return const CircularProgressIndicator();
          }
        });
  }
}

Padding _mywallet(List<WalletDTO>? walletList) {
  return Padding(
    padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
    child: Column(
      children: [
        SizedBox(
          height: 142,
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: walletList!.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) => InkWell(
              onTap: () {},
              child: Container(
                padding: const EdgeInsets.all(12),
                margin: const EdgeInsets.only(right: 10),
                height: 142,
                width: 300,
                decoration: BoxDecoration(
                    color: HexColor('${walletList[index].color}')
                        .withOpacity(0.12),
                    borderRadius: BorderRadius.circular(16)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        CircleAvatar(
                          radius: 24,
                          backgroundImage:
                              NetworkImage('${walletList[index].iconUrl}'),
                        ),
                        const SizedBox(width: 8),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '${walletList[index].symbol?.name}',
                              style: GoogleFonts.poppins(
                                  fontSize: 16, fontWeight: FontWeight.w600),
                            ),
                            Text(
                              '${walletList[index].name}',
                              style: GoogleFonts.poppins(
                                  fontSize: 14, fontWeight: FontWeight.w400),
                            ),
                          ],
                        )
                      ],
                    ),
                    const SizedBox(height: 12),
                    Text(
                      '${walletList[index].price}',
                      style: GoogleFonts.poppins(
                          fontSize: 18, fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(height: 6),
                    Row(
                      children: [
                        const Icon(
                          Iconsax.arrow_up_1,
                          size: 18,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          '${walletList[index].change}',
                          style: GoogleFonts.poppins(
                              fontSize: 12, fontWeight: FontWeight.w400),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        )
      ],
    ),
  );
}

Padding _transaction(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.only(left: 5, right: 5, top: 10, bottom: 10),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        MaterialButton(
          onPressed: () {},
          color: Colors.white,
          elevation: 0,
          focusElevation: 0,
          highlightElevation: 0,
          height: 50,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
            side: BorderSide(color: primaryColor),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Iconsax.arrow_down_2,
                color: primaryColor,
              ),
              const SizedBox(width: 3),
              Text(
                'Withdraw',
                style: GoogleFonts.poppins(
                  color: primaryColor,
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(width: 3),
        MaterialButton(
          onPressed: () {},
          color: Colors.white,
          elevation: 0,
          focusElevation: 0,
          highlightElevation: 0,
          height: 50,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
            side: BorderSide(color: primaryColor),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Iconsax.arrow_up_1,
                color: primaryColor,
              ),
              const SizedBox(width: 3),
              Text(
                'Deposit',
                style: GoogleFonts.poppins(
                  color: primaryColor,
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(width: 3),
        MaterialButton(
          onPressed: () {
            Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const AddScreen()));
          },
          color: Colors.white,
          elevation: 0,
          focusElevation: 0,
          highlightElevation: 0,
          height: 50,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
            side: BorderSide(color: primaryColor),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.currency_exchange_rounded,
                size: 20,
                color: primaryColor,
              ),
              const SizedBox(width: 3),
              Text(
                'Transfer',
                style: GoogleFonts.poppins(
                  color: primaryColor,
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}

Padding _history(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.only(left: 10, right: 5, bottom: 10),
    child: Column(
      children: [
        Row(
          children: [
            Text(
              'Transaction history',
              style: GoogleFonts.poppins(
                color: Colors.black,
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        Row(
          children: [
            Text(
              'Bạn đã chuyển tiền từ ví dịch vụ sang ví thu tiền thành công',
              style: GoogleFonts.poppins(
                color: Colors.black,
                fontSize: 12,
              ),
            ),
          ],
        )
      ],
    ),
  );
}
