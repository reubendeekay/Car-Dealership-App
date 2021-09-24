import 'package:flutter/material.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vehicle_management/constants.dart';
import 'package:vehicle_management/widgets/done_icon.dart';

class PaymentScreen extends StatelessWidget {
  static const routeName = '/price-summary';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        toolbarHeight: 80,
        centerTitle: true,
        title: const Text(
          'SUMMARY & PAYMENT',
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w900),
        ),
      ),
      body: Container(
          child: Padding(
        padding: const EdgeInsets.all(15),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 10,
              ),
              const Text(
                'PRICE SUMMARY',
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.w900),
              ),
              const SizedBox(
                height: 20,
              ),
              PriceSummary(),
              const SizedBox(
                height: 25,
              ),
              const Text(
                'CREDIT CARD INFORMATION',
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.w900),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(height: 700, child: CreditCardInformation()),
            ],
          ),
        ),
      )),
    );
  }
}

class PriceSummary extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              spreadRadius: 0.4,
              blurRadius: 8,
            )
          ]),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            child: Text(
              '3 days, 1 Room, 2 Guests',
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Total',
                style: const TextStyle(fontSize: 15, color: Colors.grey),
              ),
              Text(
                'Ksh. 24000',
                style: const TextStyle(
                    fontSize: 16, color: kPrimary, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          Divider(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Payable now',
                style: const TextStyle(fontSize: 15, color: Colors.grey),
              ),
              Text(
                'Ksh. 10000',
                style: const TextStyle(
                    fontSize: 16, color: kPrimary, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class CreditCardInformation extends StatefulWidget {
  @override
  _CreditCardInformationState createState() => _CreditCardInformationState();
}

class _CreditCardInformationState extends State<CreditCardInformation>
    with TickerProviderStateMixin {
  String cardNumber = '';

  String expiryDate = '';

  String cardHolderName = '';

  String cvvCode = '';

  bool isCvvFocused = false;

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AnimationController _controller;

  void initState() {
    super.initState();

    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          GestureDetector(
            onHorizontalDragStart: (details) {
              if (details.globalPosition.dx > 0) {
                setState(() {
                  isCvvFocused = !isCvvFocused;
                });
              }
            },
            child: CreditCardWidget(
              animationDuration: Duration(seconds: 1),
              cardBgColor: kPrimary,
              textStyle: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  fontFamily: GoogleFonts.inconsolata().fontFamily,
                  color: Colors.white),
              cardType: CardType.mastercard,
              cardNumber: cardNumber,
              expiryDate: expiryDate,
              cardHolderName: cardHolderName.toUpperCase(),
              cvvCode: cvvCode,
              showBackView: isCvvFocused,
              obscureCardNumber: true,
              obscureCardCvv: true,
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  CreditCardForm(
                    formKey: formKey,
                    obscureCvv: true,
                    obscureNumber: true,
                    cardNumber: cardNumber,
                    cvvCode: cvvCode,
                    cardHolderName: cardHolderName.toUpperCase(),
                    expiryDate: expiryDate,
                    themeColor: kPrimary,
                    cardNumberDecoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Credit Card No',
                      hintText: 'XXXX XXXX XXXX XXXX',
                    ),
                    expiryDateDecoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Expiry Date',
                      hintText: 'XX/XX',
                    ),
                    cvvCodeDecoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'CVV',
                      hintText: 'XXX',
                    ),
                    cardHolderDecoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Card Holder',
                    ),
                    onCreditCardModelChange: onCreditCardModelChange,
                  ),
                  SizedBox(
                    height: 100,
                  ),
                  SizedBox(
                    width: double.infinity,
                    height: 45,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        primary: kPrimary,
                      ),
                      child: const Text(
                        'Complete Booking',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          package: 'flutter_credit_card',
                        ),
                      ),
                      onPressed: () {
                        if (formKey.currentState.validate()) {
                          print('valid!');

                          showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                              content: DoneIcon(),
                            ),
                          );
                          Future.delayed(Duration(milliseconds: 2000))
                              .then((value) {
                            Navigator.pop(context);
                            Navigator.pop(context);
                            Navigator.pop(context);
                          });
                        } else {
                          print('invalid!');
                        }
                      },
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void onCreditCardModelChange(CreditCardModel creditCardModel) {
    setState(() {
      cardNumber = creditCardModel.cardNumber;
      expiryDate = creditCardModel.expiryDate;
      cardHolderName = creditCardModel.cardHolderName;
      cvvCode = creditCardModel.cvvCode;
      isCvvFocused = creditCardModel.isCvvFocused;
    });
  }
}
