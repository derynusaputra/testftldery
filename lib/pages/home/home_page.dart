import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ftl_dery/pages/auth/login_controller.dart';
import 'package:ftl_dery/pages/auth/repo.dart';
import 'package:get/get.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Map<String, String>> items = [];
  bool isLoading = false;
  bool hasMore = true;
  int page = 1;
  int limit = 10;

  // Simulasi fetching data dari API
  Future<void> fetchItems() async {
    if (!hasMore || isLoading) return;

    setState(() {
      isLoading = true;
    });

    // Simulasi delay network request
    await Future.delayed(Duration(seconds: 2));

    List<Map<String, String>> newItems = [
      {"time": "08:00 - 09:00", "title": "Squats Room"},
      {"time": "10:00 - 12:00", "title": "Lunges Room"}
    ];

    setState(() {
      page++;
      isLoading = false;
      items.addAll(newItems);
      hasMore = false; // Jika data kurang dari limit, berarti data sudah habis
    });
  }

  @override
  void initState() {
    super.initState();
    fetchItems(); // Fetch data pertama kali
  }

  // Widget untuk header
  Widget _buildHeader() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 10.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            child: Row(
              children: [
                CircleAvatar(
                  backgroundColor: Color(0xffBEC3E6),
                  radius: 35.r,
                  child: Text(
                    "Y",
                    style: TextStyle(fontSize: 35.w, color: Colors.white),
                  ),
                ),
                SizedBox(
                  width: 18.w,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Yosi',
                      style: TextStyle(
                          fontSize: 22.w, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'Web Developer',
                      style: TextStyle(
                          fontSize: 9.w, fontWeight: FontWeight.normal),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: 15.h),
          Text(
            "Jadwal Ruang Meeting Hari Ini",
            style: TextStyle(fontSize: 12.w, fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }

  // Widget untuk menampilkan item
  Widget _buildItem(item) {
    print(item["time"]);

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 16.w),
      margin: EdgeInsets.only(left: 30.w, right: 30.w, top: 9.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.r),
        color: Color(0xffD9D9D9),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            item["time"],
            style: TextStyle(
                color: Colors.white,
                fontSize: 15.w,
                fontWeight: FontWeight.bold),
          ),
          Text(
            item["title"],
            style: TextStyle(
                color: Colors.white,
                fontSize: 15.w,
                fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }

  // Widget ketika data kosong
  Widget _buildEmptyState() {
    return Center(
      child: Text('No items available', style: TextStyle(fontSize: 16)),
    );
  }

  // Widget untuk loading ketika scroll ke bawah
  Widget _buildLoading() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: CircularProgressIndicator(),
      ),
    );
  }

  // Fungsi untuk menghandle infinite scroll
  void _scrollListener(ScrollController controller) {
    if (controller.position.pixels == controller.position.maxScrollExtent &&
        hasMore) {
      fetchItems();
    }
  }

  Future onRefresh() async {
    // state.refreshData();
    print("tai");
  }

  @override
  Widget build(BuildContext context) {
    final LoginController controller = Get.put(LoginController());
    ScrollController _scrollController = ScrollController();
    _scrollController.addListener(() => _scrollListener(_scrollController));

    return Scaffold(
      body: RefreshIndicator(
          onRefresh: onRefresh,
          child: Column(
            children: [
              items.isEmpty && !isLoading
                  ? _buildEmptyState() // Jika data kosong dan tidak loading
                  : ListView.builder(
                      controller: _scrollController,
                      itemCount: items.length +
                          2, // Tambahkan 1 untuk header dan 1 untuk loading
                      itemBuilder: (context, index) {
                        if (index == 0) {
                          // Header item
                          return _buildHeader();
                        } else if (index == items.length + 1) {
                          // Menampilkan loading ketika sedang fetch data
                          return hasMore ? _buildLoading() : SizedBox.shrink();
                        } else {
                          // Menampilkan item list
                          final item = items[index - 1];

                          return _buildItem(item);
                        }
                      },
                    ),
              Container()
            ],
          )),
    );
  }
}

class HeadWidget extends StatelessWidget {
  const HeadWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            CircleAvatar(
              radius: 34.r,
              // backgroundColor: Colors.red,
              child: Text(
                "Y",
              ),
            ),
            Center(
              child: Text("Home"),
            ),
          ],
        ),
      ],
    );
  }
}
