import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PaymentView extends StatefulWidget {
  const PaymentView({super.key});

  @override
  State<PaymentView> createState() => _PaymentViewState();
}

class _PaymentViewState extends State<PaymentView>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  bool showBack = false;

  final cardNumberController = TextEditingController();
  final expiryController = TextEditingController();
  final cvvController = TextEditingController();
  final nameController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: const Duration(milliseconds: 600));
    _animation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
  }

  void flipCard(bool back) {
    if (back) {
      _controller.forward();
    } else {
      _controller.reverse();
    }
    setState(() => showBack = back);
  }

  @override
  Widget build(BuildContext context) {
  
    return Scaffold(
      appBar: AppBar(
        title: const Text("Payment"),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(20.w),
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Animated Card
              GestureDetector(
                onTap: () => flipCard(!showBack),
                child: SizedBox(
                  width: double.infinity,
                  height: 200.h,
                  child: AnimatedBuilder(
                    animation: _animation,
                    builder: (context, child) {
                      final angle = _animation.value * 3.1416;
                      final isBack = angle > 1.57;
                      return Transform(
                        alignment: Alignment.center,
                        transform: Matrix4.identity()
                          ..setEntry(3, 2, 0.001)
                          ..rotateY(angle),
                        child: isBack ? _buildBackCard() : _buildFrontCard(),
                      );
                    },
                  ),
                ),
              ),
              SizedBox(height: 30.h),
              _buildInputField(
                label: "Card Number",
                hint: "1234 5678 9012 3456",
                controller: cardNumberController,
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                  LengthLimitingTextInputFormatter(16),
                ],
                keyboardType: TextInputType.number,
              ),
              SizedBox(height: 16.h),
              _buildInputField(
                label: "Card Holder Name",
                hint: "Ahmed Emad",
                controller: nameController,
              ),
              SizedBox(height: 16.h),
              Row(
                children: [
                  Expanded(
                    child: _buildInputField(
                      label: "Expiry Date",
                      hint: "MM/YY",
                      controller: expiryController,
                      inputFormatters: [
                        ExpiryDateFormatter(),
                        LengthLimitingTextInputFormatter(5),
                      ],
                      keyboardType: TextInputType.number,
                    ),
                  ),
                  SizedBox(width: 16.w),
                  Expanded(
                    child: Focus(
                      onFocusChange: (hasFocus) {
                        flipCard(hasFocus);
                      },
                      child: _buildInputField(
                        label: "CVV",
                        hint: "123",
                        controller: cvvController,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly,
                          LengthLimitingTextInputFormatter(3),
                        ],
                        keyboardType: TextInputType.number,
                        obscureText: true,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 40.h),

              // Pay Now Button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepPurple,
                    padding: EdgeInsets.symmetric(vertical: 14.h),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                  ),
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("Payment processed 🚀")),
                    );
                  },
                  child: const Text(
                    "Pay Now",
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFrontCard() {
    return Container(
      padding: EdgeInsets.all(20.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.r),
        gradient: const LinearGradient(
          colors: [Color(0xFF1E3C72), Color(0xFF2A5298)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 10,
            offset: const Offset(0, 6),
          )
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Align(
            alignment: Alignment.topRight,
            child: Image.network(
              "https://upload.wikimedia.org/wikipedia/commons/5/5e/Visa_Inc._logo.svg",
              height: 40.h,
              color: Colors.white,
            ),
          ),
          const Spacer(),
          Text(
            cardNumberController.text.isEmpty
                ? "**** **** **** 1234"
                : cardNumberController.text,
            style: TextStyle(color: Colors.white, fontSize: 20.sp, letterSpacing: 2),
          ),
          SizedBox(height: 16.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                nameController.text.isEmpty ? "CARD HOLDER" : nameController.text,
                style: TextStyle(color: Colors.white, fontSize: 14.sp),
              ),
              Text(
                expiryController.text.isEmpty ? "MM/YY" : expiryController.text,
                style: TextStyle(color: Colors.white, fontSize: 14.sp),
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget _buildBackCard() {
    return Container(
      padding: EdgeInsets.all(20.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.r),
        gradient: const LinearGradient(
          colors: [Color(0xFF2A5298), Color(0xFF1E3C72)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 10,
            offset: const Offset(0, 6),
          )
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(height: 40.h, width: double.infinity, color: Colors.black),
          const Spacer(),
          Align(
            alignment: Alignment.centerRight,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
              color: Colors.white,
              child: Text(
                cvvController.text.isEmpty ? "CVV" : cvvController.text,
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 2),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInputField({
    required String label,
    required String hint,
    required TextEditingController controller,
    List<TextInputFormatter>? inputFormatters,
    TextInputType? keyboardType,
    bool obscureText = false,
  }) {
    return TextField(
      controller: controller,
      keyboardType: keyboardType,
      inputFormatters: inputFormatters,
      obscureText: obscureText,
      onChanged: (_) => setState(() {}), // يحدث الكارت مباشرة
      decoration: InputDecoration(
        labelText: label,
        hintText: hint,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12.r)),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.r),
          borderSide: const BorderSide(color: Color(0xFF2A5298)),
        ),
      ),
    );
  }
}

/// Formatter لكتابة تاريخ البطاقة (MM/YY)
class ExpiryDateFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    var text = newValue.text.replaceAll(RegExp(r'[^0-9]'), '');
    if (text.length > 4) text = text.substring(0, 4);

    String formatted = '';
    if (text.length >= 2) {
      formatted = '${text.substring(0, 2)}/${text.substring(2)}';
    } else {
      formatted = text;
    }

    return TextEditingValue(
      text: formatted,
      selection: TextSelection.collapsed(offset: formatted.length),
    );
  }
}