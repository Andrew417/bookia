import 'package:bookia/components/inputs/custom_text_form.dart';
import 'package:bookia/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

class GovBottomsheet extends StatefulWidget {
  const GovBottomsheet({super.key});

  @override
  State<GovBottomsheet> createState() => _GovBottomsheetState();
}

class _GovBottomsheetState extends State<GovBottomsheet> {
  final TextEditingController governorate = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        final selected = await showModalBottomSheet<String>(
          backgroundColor: AppColors.white,
          context: context,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
          ),
          builder: (context) {
            final governorates = [
              "Cairo",
              "Alexandria",
              "Giza",
              "Luxor",
              "Aswan",
              "Port Said",
              "Dakahlia",
            ];
            return Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: Text(
                    "Select Governorate",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                const Divider(height: 1),
                Flexible(
                  child: ListView.separated(
                    shrinkWrap: true,
                    itemCount: governorates.length,
                    separatorBuilder: (_, __) => const Divider(),
                    itemBuilder: (context, index) {
                      final gov = governorates[index];
                      final isSelected =
                          gov == governorate.text; // currently selected
                      return ListTile(
                        trailing: isSelected
                            ? const Icon(
                                Icons.check,
                                color: AppColors.primary, // yellow color
                              )
                            : null,
                        title: Text(governorates[index]),
                        onTap: () {
                          Navigator.pop(context, governorates[index]);
                        },
                      );
                    },
                  ),
                ),
              ],
            );
          },
        );

        if (selected != null) {
          setState(() {
            governorate.text = selected;
          });
        }
      },
      child: AbsorbPointer(
        child: CustomTextField(
          controller: governorate,
          hintText: 'Governorate',
          suffixIcon: const Icon(Icons.keyboard_arrow_down),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please select your governorate';
            }
            return null;
          },
        ),
      ),
    );
  }
}
