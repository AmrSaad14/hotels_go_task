import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hotels_go_task/view_model/cubit/home_cubit.dart';

showFindHotlesBottomSheet(BuildContext context) {
  showModalBottomSheet(
    context: context,
    useRootNavigator: true,
    useSafeArea: true,
    isScrollControlled: true,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(20.r),
        topRight: Radius.circular(20.r),
      ),
    ),
    builder: (BuildContext builderContext) {
      return BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          return Container(
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20.r),
                topRight: Radius.circular(20.r),
              ),
              color: Colors.grey.shade200,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  height: 50.h,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20.r),
                      topRight: Radius.circular(20.r),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.7),
                        offset: const Offset(-5, 0),
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      const Spacer(),
                      Text(
                        'Rooms And Cuests',
                        style: TextStyle(
                            fontSize: 20.sp, fontWeight: FontWeight.w500),
                      ),
                      const Spacer(),
                      IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: const Icon(
                            Icons.close,
                            color: Colors.black,
                          ))
                    ],
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 16.w,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 20.h,
                        ),
                        Container(
                          width: double.infinity,
                          padding: EdgeInsets.all(5.sp),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                'Rooms',
                                style: TextStyle(
                                    color: Colors.black, fontSize: 16),
                              ),
                              const Spacer(),
                              IconButton(
                                  onPressed: () {
                                    homeCubit.decreaseRoomCount();
                                  },
                                  icon: const Icon(
                                    Icons.remove_circle_outline,
                                    color: Colors.blue,
                                    size: 25,
                                  )),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 5.w),
                                child: Text('${homeCubit.roomCount}'),
                              ),
                              IconButton(
                                  onPressed: () {
                                    homeCubit.increaseRoomCount();
                                  },
                                  icon: const Icon(
                                    Icons.add_circle_outline,
                                    color: Colors.blue,
                                    size: 25,
                                  )),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 15.h,
                        ),
                        // here i'll create only one room as a component but i knew the case must be a list of rooms count
                        Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10)),
                          padding: EdgeInsets.all(8.sp),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Room 1',
                              ),
                              Row(
                                children: [
                                  const Text(
                                    'Adults',
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 16),
                                  ),
                                  const Spacer(),
                                  IconButton(
                                      onPressed: () {
                                        homeCubit.decreaseAdultCount();
                                      },
                                      icon: const Icon(
                                        Icons.remove_circle_outline,
                                        color: Colors.blue,
                                        size: 25,
                                      )),
                                  Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 5.w),
                                    child: Text('${homeCubit.adultCount}'),
                                  ),
                                  IconButton(
                                      onPressed: () {
                                        homeCubit.increaseAdultCount();
                                      },
                                      icon: const Icon(
                                        Icons.add_circle_outline,
                                        color: Colors.blue,
                                        size: 25,
                                      )),
                                ],
                              ),
                              Row(
                                children: [
                                  const Text(
                                    'Childrens',
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 16),
                                  ),
                                  const Spacer(),
                                  IconButton(
                                      onPressed: () {
                                        homeCubit.decreaseChildCount();
                                      },
                                      icon: const Icon(
                                        Icons.remove_circle_outline,
                                        color: Colors.blue,
                                        size: 25,
                                      )),
                                  Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 5.w),
                                    child: Text('${homeCubit.childCount}'),
                                  ),
                                  IconButton(
                                      onPressed: () {
                                        homeCubit.increaseChildCount();
                                      },
                                      icon: const Icon(
                                        Icons.add_circle_outline,
                                        color: Colors.blue,
                                        size: 25,
                                      )),
                                ],
                              ),
                              SizedBox(
                                height: 10.h,
                              ),
                              Padding(
                                padding: EdgeInsets.all(20.sp),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                          'Age of child 1',
                                          style: TextStyle(fontSize: 14.sp),
                                        ),
                                        const Spacer(),
                                        Text(
                                          '14 years',
                                          style: TextStyle(
                                              fontSize: 14.sp,
                                              color: Colors.grey),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 10.h,
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          'Age of child 2',
                                          style: TextStyle(fontSize: 14.sp),
                                        ),
                                        const Spacer(),
                                        Text(
                                          '14 years',
                                          style: TextStyle(
                                              fontSize: 14.sp,
                                              color: Colors.grey),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Container(
                          width: double.infinity,
                          padding: EdgeInsets.symmetric(
                              horizontal: 10.w, vertical: 5.h),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const SizedBox(
                                width: 5,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  const Row(
                                    children: [
                                      Text(
                                        'Pet-friendly',
                                        style: TextStyle(
                                            color: Colors.black, fontSize: 16),
                                      ),
                                      Icon(Icons.info_outline),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 10.h,
                                  ),
                                  const Text('Only show stays that allow pets')
                                ],
                              ),
                              const Spacer(),
                              CupertinoSwitch(
                                  activeColor: Colors.blue,
                                  value: homeCubit.isPetAllowed,
                                  onChanged: (onChanged) {
                                    homeCubit.changeIsPetAllowed();
                                  }),
                            ],
                          ),
                        ),
                        const Spacer(),
                        Row(
                          children: [
                            Expanded(
                                child: ElevatedButton(
                                    onPressed: () {
                                      homeCubit.setRoomMatesValues();
                                      Navigator.pop(context);
                                    },
                                    child: const Text(
                                      'Apply',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 18,
                                      ),
                                    ))),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      );
    },
  );
}
