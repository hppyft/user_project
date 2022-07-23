part of '../profile_page.dart';
 class _ProfileAvatar extends StatelessWidget {
   const _ProfileAvatar({Key? key}) : super(key: key);

   @override
   Widget build(BuildContext context) {
     return ClipRRect(
       borderRadius: BorderRadius.circular(999.0),
       child: Image.network(
         'https://randomuser.me/api/portraits/thumb/women/60.jpg',
       ),
     );
   }
 }
