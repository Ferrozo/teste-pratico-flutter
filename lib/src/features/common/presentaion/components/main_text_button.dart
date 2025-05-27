import 'package:flutter/material.dart';

class MainTextButton extends StatelessWidget {
  const MainTextButton({super.key, required this.onPressed, required this.title});

    final Function onPressed;
    final String title;

  @override
  Widget build(BuildContext context) {
     var width = MediaQuery.of(context).size.width;
    return  SizedBox(
        width: width,
        height: 60,
      child: TextButton(
          style: TextButton.styleFrom(
              backgroundColor: Theme.of(context).colorScheme.onSurface,
              shape:RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10))
              )

          ),
          onPressed: ()=> onPressed,
          child: Text(
              title,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith( 
                  color: Theme.of(context).colorScheme.onPrimary,
                  fontWeight: FontWeight.bold,),
          ),
      ),
    );
  }
}