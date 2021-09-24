import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:vehicle_management/constants.dart';
import 'package:vehicle_management/widgets/calendar_popup.dart';

class Filters extends StatefulWidget {
  @override
  _FiltersState createState() => _FiltersState();
}

class _FiltersState extends State<Filters> {
  RangeValues selectedValues = RangeValues(1000, 20000);
  RangeValues selectedRating = RangeValues(0, 3);
  DateTime _startDate;
  DateTime _endDate;

//SELECTIONS

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () => Navigator.of(context).pop(),
      child: GestureDetector(
        onTap: () {},
        child: DraggableScrollableSheet(
          initialChildSize: 0.52,
          maxChildSize: 0.85,
          minChildSize: 0.52,
          builder: (ctx, controller) => AnimatedContainer(
            duration: Duration(milliseconds: 500),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20)),
              ),
              padding: EdgeInsets.all(15),
              child: ListView(
                controller: controller,
                children: [
                  Container(
                      margin: EdgeInsets.symmetric(vertical: 10),
                      child: Text(
                        'Filters',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      )),
                  filterCategory('Rooms'),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        BuildOption('Any', true),
                        Row(
                          children: List.generate(
                              10,
                              (index) => Row(
                                    children: [
                                      BuildOption('${index + 1}', false),
                                    ],
                                  )),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 15),
                  filterCategory('Amenities'),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        SizedBox(
                            width: 130,
                            child: BuildOption('Swimming pool', true)),
                        SizedBox(
                            width: 130, child: BuildOption('Free Wifi', false)),
                        SizedBox(
                            width: 130,
                            child: BuildOption('Restaurant', false)),
                        SizedBox(
                            width: 130, child: BuildOption('Garage', false)),
                      ],
                    ),
                  ),
                  SizedBox(height: 15),
                  filterCategory('Availability'),
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
                                  onApplyClick:
                                      (DateTime startData, DateTime endData) {
                                    setState(() {
                                      _startDate = startData;
                                      _endDate = endData;
                                    });
                                  },
                                  onCancelClick: () {},
                                )),
                        child: Icon(
                          Icons.calendar_today,
                          color: Colors.grey,
                        ),
                      ),
                      SizedBox(width: 10),
                      if (_startDate != null && _endDate != null)
                        Row(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  border:
                                      Border.all(width: 1, color: Colors.grey)),
                              padding: EdgeInsets.symmetric(
                                  horizontal: 30, vertical: 10),
                              child: Text(
                                  DateFormat('dd/MM/yyyy').format(_startDate)),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text('to'),
                            SizedBox(
                              width: 10,
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  border:
                                      Border.all(width: 1, color: Colors.grey)),
                              padding: EdgeInsets.symmetric(
                                  horizontal: 30, vertical: 10),
                              child: Text(
                                  DateFormat('dd/MM/yyyy').format(_endDate)),
                            ),
                          ],
                        ),
                      if (_startDate == null && _endDate == null)
                        Text('Check in and Check out'),
                    ],
                  ),
                  SizedBox(height: 15),
                  filterCategory('Location'),
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey[300]),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton(
                        elevation: 1,
                        dropdownColor: Colors.grey[50],
                        style: TextStyle(fontSize: 16, color: Colors.black),
                        items: [
                          DropdownMenuItem(
                            child: Text('Nairobi'),
                          )
                        ],
                        onChanged: (value) {},
                      ),
                    ),
                  ),
                  SizedBox(height: 5),
                  filterCategory('Category'),
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey[300]),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton(
                        elevation: 1,
                        dropdownColor: Colors.grey[50],
                        style: TextStyle(fontSize: 16, color: Colors.black),
                        items: [
                          DropdownMenuItem(
                            child: Text('All'),
                          )
                        ],
                        onChanged: (value) {},
                      ),
                    ),
                  ),
                  SizedBox(height: 5),
                  filterCategory('Rating'),
                  SizedBox(
                    height: 20,
                    child: RangeSlider(
                      values: selectedRating,
                      onChanged: (value) {
                        setState(() {
                          selectedRating = value;
                        });
                      },
                      divisions: 10,
                      activeColor: kPrimary,
                      inactiveColor: Colors.grey[300],
                      labels: RangeLabels(
                          '${selectedRating.start}', '${selectedRating.end}'),
                      min: 0,
                      max: 5,
                    ),
                  ),
                  filterCategory('Price'),
                  SizedBox(
                    height: 20,
                    child: RangeSlider(
                      values: selectedValues,
                      onChanged: (value) {
                        setState(() {
                          selectedValues = value;
                        });
                      },
                      activeColor: kPrimary,
                      inactiveColor: Colors.grey[300],
                      labels: RangeLabels(
                          '${selectedValues.start}', '${selectedValues.end}'),
                      min: 1000,
                      max: 50000,
                    ),
                  ),
                  const SizedBox(height: 15),
                  Row(
                    children: [
                      Container(
                          padding: const EdgeInsets.all(10),
                          width: 100,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                  width: 1, color: Colors.grey[400])),
                          child: Center(
                              child: Text(
                            '${selectedValues.start.toStringAsFixed(0)}',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w500),
                          ))),
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 15),
                        child: Text(
                          '-',
                          style:
                              TextStyle(fontSize: 30, color: Colors.grey[400]),
                        ),
                      ),
                      Container(
                          padding: const EdgeInsets.all(10),
                          width: 100,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                  width: 1, color: Colors.grey[400])),
                          child: Center(
                              child: Text(
                            '${selectedValues.end.toStringAsFixed(0)}',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w500),
                          ))),
                    ],
                  ),
                  const SizedBox(height: 50),
                  RaisedButton(
                    onPressed: () => Navigator.of(context).pop(),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    color: kPrimary,
                    child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 13, horizontal: 50),
                        child: Text(
                          'Apply',
                          style: const TextStyle(color: Colors.white),
                        )),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget filterCategory(String title) {
    return Container(
        margin: const EdgeInsets.symmetric(
          vertical: 10,
        ),
        child: Text(
          title,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
        ));
  }
}

class BuildOption extends StatefulWidget {
  final String text;
  bool selected;
  BuildOption(this.text, this.selected);

  @override
  _BuildOptionState createState() => _BuildOptionState();
}

class _BuildOptionState extends State<BuildOption> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          widget.selected = !widget.selected;
        });
      },
      child: Container(
        height: 40,
        width: 60,
        margin: EdgeInsets.only(right: 10),
        decoration: BoxDecoration(
            color: widget.selected ? kPrimary : Colors.transparent,
            borderRadius: BorderRadius.all(
              Radius.circular(5),
            ),
            border: Border.all(
              width: widget.selected ? 0 : 1,
              color: Colors.grey[300],
            )),
        child: Center(
          child: Text(
            widget.text,
            style: TextStyle(
              color: widget.selected ? Colors.white : Colors.grey,
              fontSize: 14,
            ),
          ),
        ),
      ),
    );
  }
}
