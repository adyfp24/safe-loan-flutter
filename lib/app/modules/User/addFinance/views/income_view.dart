import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:safeloan/app/modules/User/addFinance/controllers/add_finance_controller.dart';
import 'package:safeloan/app/utils/AppColors.dart';
import 'package:safeloan/app/widgets/button_widget.dart';
import 'package:safeloan/app/widgets/input_widget.dart';

class IncomeView extends GetView<AddFinanceController> {
  const IncomeView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 40),
          child: Column(
            children: [
              InputWidget(
                judul: 'Nominal',
                hint: '0',
                controller: controller.nominalC,
              ),
              const SizedBox(height: 10),
              const Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'Kategori',
                  style: TextStyle(
                    color: AppColors.textHijauTua,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 7, bottom: 3),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _buildCategoryColumn(
                      category: 'Gaji',
                      icon: Icons.cast_for_education,
                      controller: controller,
                    ),
                    _buildCategoryColumn(
                      category: 'Hadiah',
                      icon: Icons.health_and_safety,
                      controller: controller,
                    ),
                    _buildCategoryColumn(
                      category: 'transportasi',
                      icon: Icons.directions_car,
                      controller: controller,
                    ),
                    _buildCategoryColumn(
                      category: 'lainnya',
                      icon: Icons.more_horiz,
                      controller: controller,
                    ),
                  ],
                ),
              ),
              InputWidget(
                judul: 'Tanggal',
                hint: '15/07/2024',
                controller: controller.nominalC,
              ),
              const SizedBox(height: 10),
              InputWidget(
                judul: 'Catatan',
                hint: 'Masukkan Catatan',
                controller: controller.nominalC,
              ),
              const SizedBox(height: 30),
              ButtonWidget(
                onPressed: () {},
                nama: 'Tambah',
              ),
            ],
          ),
        ),
      ),
    );
  }
  Widget _buildCategoryColumn({
    required String category,
    required IconData icon,
    required AddFinanceController controller,
  }) {
    return Obx(() {
      bool isSelected = controller.selectedCategory.value == category;
      return GestureDetector(
        onTap: () {
          controller.selectCategory(category);
        },
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: isSelected ? Colors.green[100] : Colors.transparent,
                border: Border.all(color: isSelected ? Colors.green : Colors.transparent),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Icon(
                icon,
                size: 35,
                color: isSelected ? Colors.green : Colors.black,
              ),
            ),
            const SizedBox(height: 7),
            Text(
              category,
              style: TextStyle(
                fontSize: 12,
                color: isSelected ? Colors.green : Colors.black,
              ),
            ),
          ],
        ),
      );
    });
  }
}
