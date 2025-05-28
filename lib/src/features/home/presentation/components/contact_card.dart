import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ContactCard extends StatelessWidget {
  ContactCard({
    super.key,
    required this.avatar,
    required this.email,
    required this.userName,
    required this.onCardClick,
    required this.onMoreInfoClick,
  });
  String avatar;
  String userName;
  String email;
  Function onMoreInfoClick;
  Function onCardClick;
  
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Container(
        margin: const EdgeInsets.symmetric(vertical: 1.5),
        padding: const EdgeInsets.all(15),
        height: 85,
        width: width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: BoxBorder.all(color: Colors.grey.shade500),
        ),
        child: InkWell(
      onTap: (){
        onCardClick();
      },
      child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                CircleAvatar(backgroundImage: NetworkImage(avatar), radius: 28),
                SizedBox(width: 15),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      userName,
                      style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    Text(
                      email,
                      style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ],
            ),
      
            IconButton(onPressed: () {
              onMoreInfoClick();
            }, icon: Icon(Icons.more_horiz)),
          ],
        ),
      ),
    );
  }
}
