import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:login_task_nti/core/helper/my_navigator.dart';
import 'package:login_task_nti/core/routes/routes.export.dart';
import 'package:login_task_nti/core/utils/svg.dart';

class CustomAppbarEdit extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppbarEdit({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.grey[100],
      elevation: 0, // إزالة الظل أسفل الـ App Ba
      leading: Transform.rotate(
        angle: Intl.getCurrentLocale().startsWith('en') ? 3.1416 : 0,
        child: IconButton(
          padding: EdgeInsets.zero,
          icon: SvgPicture.asset(
            SvgAssets.arrowIcon,
            height: 21.h,
            width: 21.w,
            fit: BoxFit.contain,
          ),
          onPressed: () {
            MyNavigator.pop(context);
          },
        ),
      ),
      title:const Text(
        'Edit Task',
        style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
      ),
      centerTitle: true,
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 8.0),
          child: ElevatedButton.icon(
            onPressed: () {},
            icon:const Icon(Icons.delete, color: Colors.white),
            label:const Text('Delete', style: TextStyle(color: Colors.white)),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red, 
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20), 
              ),
              padding:const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            ),
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
