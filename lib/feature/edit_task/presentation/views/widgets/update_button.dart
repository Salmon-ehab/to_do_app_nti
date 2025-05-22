import 'package:login_task_nti/core/routes/routes.export.dart';

class UpdateButton extends StatelessWidget {
  const UpdateButton({super.key, this.onPressed});
   final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: OutlinedButton(
        onPressed: onPressed,
        style: OutlinedButton.styleFrom(
          padding: const EdgeInsets.symmetric(vertical: 16),
          side: BorderSide(color: Colors.green[700]!, width: 2), // حدود خضراء
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        child: Text(
          'Update',
          style: TextStyle(fontSize: 18, color: Colors.green[700]),
        ),
      ),
    );
  }
}
