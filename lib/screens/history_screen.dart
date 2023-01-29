import '../custom_icons.dart';

import 'package:flutter/material.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      "Passbook",
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        color: Color.fromRGBO(113, 99, 186, 1),
                      ),
                    ),
                    Text(
                      "Your transactions",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w400,
                        color: Color.fromRGBO(0, 0, 0, 0.5),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: ScrollConfiguration(
                  behavior: const ScrollBehavior(),
                  child: ListView.builder(
                    itemCount: passbookDataGroupedByDate.length,
                    itemBuilder: (context, index) {
                      final date =
                          passbookDataGroupedByDate.keys.toList()[index];
                      final entries = passbookDataGroupedByDate[date];
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 20),
                          Text(
                            date,
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: Color.fromRGBO(0, 0, 0, 0.5),
                            ),
                          ),
                          const SizedBox(height: 10),
                          ...entries!
                              .map(
                                (entry) => Padding(
                                  padding: const EdgeInsets.only(bottom: 16.0),
                                  child: PassbookEntryCard(
                                    name: entry.title,
                                    amount: entry.amount,
                                    subtitle: entry.subtitle,
                                    logoUrl: entry.logoUrl,
                                    time: entry.time,
                                    type: entry.type,
                                    swappedWith: entry.swappedWith,
                                  ),
                                ),
                              )
                              .toList(),
                        ],
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class PassbookEntry {
  final String title;
  final String subtitle;
  final String logoUrl;
  final String date;
  final String time;
  final int amount;
  final String type;
  final String? swappedWith;

  const PassbookEntry({
    required this.title,
    required this.subtitle,
    required this.logoUrl,
    required this.date,
    required this.time,
    required this.amount,
    required this.type,
    this.swappedWith,
  });
}

Map<String, List<PassbookEntry>> passbookDataGroupedByDate = {
  "Jan 22, 2022": [
    const PassbookEntry(
        title: "Nike",
        subtitle: "Nike Store, CP",
        date: "Jan 22, 2022",
        time: "11:00 am",
        amount: 100,
        type: "credit",
        swappedWith: null,
        logoUrl:
            "https://companieslogo.com/img/orig/NKE-0c8add60.png?t=1632522146"),
    const PassbookEntry(
        title: "Nike",
        subtitle: "Swapped with Amazon",
        date: "Jan 22, 2022",
        time: "1:00 pm",
        amount: 100,
        type: "debit",
        swappedWith: "Amazon",
        logoUrl:
            "https://companieslogo.com/img/orig/NKE-0c8add60.png?t=1632522146"),
    const PassbookEntry(
        title: "Amazon",
        subtitle: "Swapped with Nike",
        date: "Jan 22, 2022",
        time: "1:00 pm",
        amount: 500,
        type: "credit",
        swappedWith: "Nike",
        logoUrl:
            "https://companieslogo.com/img/orig/AMZN-e9f942e4.png?t=1632523695"),
  ],
  "Aug 7, 2023": [
    const PassbookEntry(
        title: "Nike",
        subtitle: "Nike Store, CP",
        date: "Aug 7, 2023",
        time: "11:00 am",
        amount: 100,
        type: "credit",
        swappedWith: null,
        logoUrl:
            "https://companieslogo.com/img/orig/NKE-0c8add60.png?t=1632522146"),
    const PassbookEntry(
        title: "Nike",
        subtitle: "Swapped with Amazon",
        date: "Aug 7, 2023",
        time: "1:00 pm",
        amount: 100,
        type: "debit",
        swappedWith: "Amazon",
        logoUrl:
            "https://companieslogo.com/img/orig/NKE-0c8add60.png?t=1632522146"),
    const PassbookEntry(
        title: "Amazon",
        subtitle: "Swapped with Nike",
        date: "Aug 7, 2023",
        time: "1:00 pm",
        amount: 500,
        type: "credit",
        swappedWith: "Nike",
        logoUrl:
            "https://companieslogo.com/img/orig/AMZN-e9f942e4.png?t=1632523695"),
  ]
};

class PassbookEntryCard extends StatelessWidget {
  const PassbookEntryCard({
    super.key,
    required this.name,
    required this.amount,
    required this.subtitle,
    required this.logoUrl,
    required this.time,
    required this.type,
    this.swappedWith,
  });

  final String name;
  final int amount;
  final String subtitle;
  final String logoUrl;
  final String type;
  final String time;
  final String? swappedWith;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color.fromRGBO(242, 242, 242, 1),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Stack(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 70,
                width: 70,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Image.network(
                    logoUrl,
                  ),
                ),
              ),
              const SizedBox(width: 20),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: Color.fromRGBO(0, 0, 0, 1),
                      ),
                    ),
                    Row(
                      children: [
                        swappedWith != null
                            ? const Icon(
                                CustomIcons.swap,
                                color: Color.fromRGBO(0, 0, 0, 0.5),
                              )
                            : const SizedBox(),
                        SizedBox(
                          width: swappedWith != null ? 5 : 0,
                        ),
                        Text(
                          subtitle,
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: Color.fromRGBO(0, 0, 0, 0.5),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const Spacer(),
            ],
          ),
          Positioned(
            right: 0,
            top: 0,
            child: Container(
              padding: const EdgeInsets.symmetric(
                vertical: 5,
                horizontal: 12,
              ),
              decoration: BoxDecoration(
                color: type == "credit"
                    ? const Color.fromRGBO(208, 246, 208, 1)
                    : const Color.fromRGBO(233, 213, 201, 1),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                children: [
                  Image.asset(
                    type == "credit" ? "assets/credit.png" : "assets/debit.png",
                    height: 18,
                    width: 18,
                  ),
                  Text(
                    amount.toString(),
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: type == "credit"
                          ? const Color.fromRGBO(55, 180, 85, 1)
                          : const Color.fromRGBO(217, 55, 32, 1),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            right: 0,
            bottom: 0,
            child: Text(
              time,
              style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w400,
                color: Color.fromRGBO(0, 0, 0, 0.5),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
