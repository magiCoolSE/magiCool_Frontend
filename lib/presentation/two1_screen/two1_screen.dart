import 'package:flutter/material.dart';
import 'package:magicool/core/app_export.dart';
import 'package:magicool/presentation/k20_page/k20_page.dart';
import 'package:magicool/presentation/k8_page/k8_page.dart';
import 'package:magicool/widgets/app_bar/appbar_title_edittext.dart';
import 'package:magicool/widgets/app_bar/appbar_trailing_image.dart';
import 'package:magicool/widgets/app_bar/custom_app_bar.dart';
import 'package:magicool/widgets/custom_bottom_bar.dart';
import 'package:magicool/widgets/custom_elevated_button.dart';
import 'package:magicool/widgets/custom_outlined_button.dart';

class Two1Screen extends StatelessWidget {
  Two1Screen({Key? key})
      : super(
          key: key,
        );

  TextEditingController menuToastVariantFiveController =
      TextEditingController();

  GlobalKey<NavigatorState> navigatorKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);

    return SafeArea(
      child: Scaffold(
        appBar: _buildAppBar(context),
        body: Container(
          width: double.maxFinite,
          padding: EdgeInsets.symmetric(horizontal: 4.h),
          child: Column(
            children: [
              _buildImageContainer(context),
              SizedBox(height: 16.v),
              _buildButtonSet(context),
              Spacer(),
              SizedBox(height: 20.v),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomImageView(
                    imagePath: ImageConstant.imgMediaMicLine,
                    height: 24.adaptSize,
                    width: 24.adaptSize,
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      left: 6.h,
                      top: 3.v,
                      bottom: 2.v,
                    ),
                    child: Text(
                      "스피커를 이용해 보세요!",
                      style: CustomTextStyles.bodyMediumArialBlack900,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        bottomNavigationBar: _buildBottomBar(context),
      ),
    );
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
      title: AppbarTitleEdittext(
        margin: EdgeInsets.only(left: 29.h),
        hintText: "nugu를 연동해주세요.",
        controller: menuToastVariantFiveController,
      ),
      actions: [
        AppbarTrailingImage(
          imagePath: ImageConstant.imgMediaNotificationsLine,
          margin: EdgeInsets.fromLTRB(20.h, 20.v, 20.h, 12.v),
        ),
      ],
    );
  }

  /// Section Widget
  Widget _buildImageContainer(BuildContext context) {
    return SizedBox(
      height: 216.v,
      width: 366.h,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: Container(
              height: 184.v,
              width: 366.h,
              decoration: BoxDecoration(
                color: theme.colorScheme.primary,
                borderRadius: BorderRadius.circular(
                  16.h,
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Card(
              clipBehavior: Clip.antiAlias,
              elevation: 0,
              margin: EdgeInsets.all(0),
              color: appTheme.blueGray50,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadiusStyle.roundedBorder9,
              ),
              child: Container(
                height: 200.v,
                width: 334.h,
                padding: EdgeInsets.all(8.h),
                decoration: AppDecoration.fillBlueGray.copyWith(
                  borderRadius: BorderRadiusStyle.roundedBorder9,
                ),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    CustomImageView(
                      imagePath: ImageConstant.imgWomanPowerAlone,
                      height: 184.v,
                      width: 318.h,
                      alignment: Alignment.center,
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: Padding(
                        padding: EdgeInsets.only(
                          left: 18.h,
                          right: 20.h,
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "안녕하세요 정유빈 님,",
                              style: theme.textTheme.headlineSmall,
                            ),
                            Text(
                              "11월 20일 수요일",
                              style: CustomTextStyles.headlineSmallBluegray600,
                            ),
                            SizedBox(height: 38.v),
                            SizedBox(
                              width: 279.h,
                              child: Text(
                                "택배 배송 예정 알림을 받으시려면  ",
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: theme.textTheme.headlineSmall!.copyWith(
                                  height: 1.08,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildButtonSet(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomOutlinedButton(
            width: 159.h,
            text: "보러가기",
          ),
          CustomElevatedButton(
            height: 32.v,
            width: 159.h,
            text: "Download",
            margin: EdgeInsets.only(left: 16.h),
            buttonStyle: CustomButtonStyles.fillOnErrorContainer,
            buttonTextStyle: CustomTextStyles.titleSmallPrimary,
          ),
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildBottomBar(BuildContext context) {
    return CustomBottomBar(
      onChanged: (BottomBarEnum type) {
        Navigator.pushNamed(
            navigatorKey.currentContext!, getCurrentRoute(type));
      },
    );
  }

  ///Handling route based on bottom click actions
  String getCurrentRoute(BottomBarEnum type) {
    switch (type) {
      case BottomBarEnum.Wallet:
        return AppRoutes.k8Page;
      case BottomBarEnum.Analysis:
        return "/";
      case BottomBarEnum.User:
        return AppRoutes.k20Page;
      default:
        return "/";
    }
  }

  ///Handling page based on route
  Widget getCurrentPage(String currentRoute) {
    switch (currentRoute) {
      case AppRoutes.k8Page:
        return K8Page();
      case AppRoutes.k20Page:
        return K20Page();
      default:
        return DefaultWidget();
    }
  }
}
