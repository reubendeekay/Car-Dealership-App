import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:vehicle_management/constants.dart';
import 'package:vehicle_management/widgets/calendar_popup.dart';

class BookingInformation extends StatefulWidget {
  @override
  _BookingInformationState createState() => _BookingInformationState();
}

class _BookingInformationState extends State<BookingInformation> {
  List<String> rooms = [
    'Single Room',
    'Double Room',
    'Triple Room',
    'Quad Room',
    'Queen Room',
    'King Room',
  ];

  DateTime _startDate;

  DateTime _endDate;

  @override
  Widget build(BuildContext context) {
    var _defaultRoom = rooms[0];
    return Container(
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        const SizedBox(
          height: 10,
        ),
        Text(
          'ACCOMODATION ',
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w900),
        ),
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Row(
            children: [
              const Icon(
                Icons.beach_access_outlined,
                color: Colors.grey,
              ),
              const SizedBox(
                width: 10,
              ),
              const Text(
                'Type of accomodation',
                style:
                    const TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
              ),
            ],
          ),
          DropdownButtonHideUnderline(
            child: DropdownButton(
              items: rooms
                  .map((e) => DropdownMenuItem(
                        child: Text(e),
                        value: e,
                      ))
                  .toList(),
              onChanged: (value) {
                setState(() {
                  _defaultRoom = value;
                });
              },
              value: _defaultRoom,
            ),
          )
        ]),
        const SizedBox(
          height: 10,
        ),
        Row(
          children: [
            GestureDetector(
              onTap: () => showDialog(
                  context: context,
                  builder: (ctx) => CalendarPopupView(
                        barrierDismissible: true,
                        minimumDate: DateTime.now(),
                        //  maximumDate: DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day + 10),
                        initialEndDate: DateTime.now(),
                        initialStartDate: DateTime.now(),
                        onApplyClick: (DateTime startData, DateTime endData) {
                          setState(() {
                            _startDate = startData;
                            _endDate = endData;
                          });
                        },
                        onCancelClick: () {},
                      )),
              child: const Icon(
                Icons.calendar_today,
                color: Colors.grey,
              ),
            ),
            const SizedBox(width: 10),
            if (_startDate != null && _endDate != null)
              Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(width: 1, color: Colors.grey)),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 30, vertical: 10),
                    child: Text(DateFormat('dd/MM/yyyy').format(_startDate)),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  const Text('to'),
                  const SizedBox(
                    width: 10,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(width: 1, color: Colors.grey)),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 30, vertical: 10),
                    child: Text(DateFormat('dd/MM/yyyy').format(_endDate)),
                  ),
                ],
              ),
            if (_startDate == null && _endDate == null)
              const Text(
                'Check-in & Check out',
                style:
                    const TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
              ),
          ],
        ),
        const SizedBox(
          height: 5,
        ),
        Row(mainAxisAlignment: MainAxisAlignment.end, children: [
          const Text(
            'Price: ',
            style: const TextStyle(fontSize: 16),
          ),
          Text(
            'Ksh. 24000',
            style: const TextStyle(
                fontSize: 16, color: kPrimary, fontWeight: FontWeight.w600),
          )
        ])
      ]),
    );
  }
}
