import 'package:crud/screen/user_details.dart';
import 'package:flutter/material.dart';

class UserCard extends StatelessWidget {
  final int? cardNo;
  final String? userName;
  final String? userAddress;
  final String? userContact;
  final VoidCallback? onEditButton;
  final VoidCallback? onDeleteButton;

  const UserCard(
      {super.key,
      this.cardNo,
      this.userName,
      this.userAddress,
      this.userContact,this.onEditButton,this.onDeleteButton});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 15,left: 30,right: 30),
      child: Container(
        decoration: BoxDecoration(
            color: Color.fromARGB(255, 230, 219, 182),
            border: Border.all(width: 2, color: Colors.black),
            borderRadius: BorderRadius.circular(15)),
        height: 120,
        width: 400,
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Container(
                    height: 80,
                    width: 80,
                    decoration:
                        BoxDecoration(shape: BoxShape.circle, color: Color.fromARGB(255, 162, 147, 146)),
                    child: Center(
                      child: Text(
                        cardNo.toString(),
                        style: TextStyle(color: Colors.white,fontSize: 25),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        userName!,
                        style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        userAddress!,
                        style: TextStyle(fontSize: 20, ),
                      ),
                      Text(
                        userContact!,
                        style: TextStyle(fontSize: 15, ),
                      )
                    ],
                  ),
                ),
              ],
            ),
            Row(
              children: [
                IconButton(onPressed:onEditButton, icon: Icon(Icons.edit)),
                IconButton(onPressed: onDeleteButton, icon: Icon(Icons.delete)),
              ],
            )
          ],
        ),
      ),
    );
  }
}
