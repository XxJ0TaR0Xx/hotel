import 'package:flutter/material.dart';

class EstimationHotel extends StatelessWidget {
  final String textEstimation;
  final int intEstimation;
  const EstimationHotel({
    super.key,
    required this.textEstimation,
    required this.intEstimation,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5.0),
            color: const Color(0XFFFFC700).withOpacity(0.2),
          ),
          margin: const EdgeInsets.only(
            top: 16.0,
            left: 16.0,
          ),
          child: Row(
            children: [
              const Padding(
                padding: EdgeInsets.only(
                  top: 7.0,
                  bottom: 7.0,
                  left: 10.0,
                ),
                child: Icon(
                  Icons.star,
                  color: Color(0xFFFFA800),
                  size: 15.0,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 5.0,
                  bottom: 5.0,
                  left: 2.0,
                  right: 10.0,
                ),
                child: Text(
                  '$intEstimation $textEstimation',
                  style: const TextStyle(
                    color: Color(0xFFFFA800),
                    fontSize: 16.0,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
