import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../auth/data/data_source/firebase_data_source/firebase_auth_data_source.dart';
import '../../auth/data/models/user_model.dart';
import '../../../core/service/service_locator.dart';

class AnalysisScreen extends StatefulWidget {
  const AnalysisScreen({super.key});

  @override
  State<AnalysisScreen> createState() => _AnalysisScreenState();
}

class _AnalysisScreenState extends State<AnalysisScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final _firebaseDataSource = getIt<FirebaseAuthDataSource>();
  final _auth = getIt<FirebaseAuth>();

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(16.w),
            child: Text(
              'Your Analyses',
              style: TextStyle(fontSize: 22.sp, fontWeight: FontWeight.bold),
            ),
          ),
          TabBar(
            controller: _tabController,
            labelColor: Colors.blue,
            unselectedLabelColor: Colors.grey,
            indicatorColor: Colors.blue,
            isScrollable: true,
            tabAlignment: TabAlignment.start,
            tabs: const [
              Tab(text: 'Diabetes Images'),
              Tab(text: 'Diabetes Surveys'),
              Tab(text: 'Anemia Images'),
              Tab(text: 'Anemia Surveys'),
            ],
          ),
          Expanded(
            child: FutureBuilder<UserModel?>(
              future: _firebaseDataSource.getUserData(_auth.currentUser!.uid),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                }
                if (!snapshot.hasData) {
                  return const Center(child: Text('No data available'));
                }
                final user = snapshot.data!;
                return TabBarView(
                  controller: _tabController,
                  children: [
                    _buildDiabetesRecordsList(user.diabetesRecords),
                    _buildDiabetesSurveysList(user.diabetesSurveys),
                    _buildAnemiaRecordsList(user.anemiaRecords),
                    _buildAnemiaSurveysList(user.anemiaSurveys),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDiabetesRecordsList(List<DiabetesRecord> records) {
    if (records.isEmpty) {
      return Center(
        child: Text('No diabetes image records', style: TextStyle(fontSize: 14.sp)),
      );
    }
    return ListView.builder(
      padding: EdgeInsets.all(16.w),
      itemCount: records.length,
      itemBuilder: (context, index) {
        final record = records[records.length - 1 - index];
        return Card(
          margin: EdgeInsets.only(bottom: 10.h),
          child: Padding(
            padding: EdgeInsets.all(12.w),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8.r),
                  child: Image.network(
                    record.imageUrl,
                    width: 80.w,
                    height: 80.w,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) => Container(
                      width: 80.w,
                      height: 80.w,
                      color: Colors.grey[300],
                      child: Icon(Icons.image, size: 40.sp, color: Colors.grey),
                    ),
                  ),
                ),
                SizedBox(width: 12.w),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Prediction: ${record.prediction}',
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15.sp),
                      ),
                      SizedBox(height: 4.h),
                      Text(
                        'Probability: ${(record.probabilityNonDiabetes * 100).toStringAsFixed(1)}%',
                        style: TextStyle(fontSize: 13.sp),
                      ),
                      SizedBox(height: 4.h),
                      Text(
                        _formatDate(record.timestamp),
                        style: TextStyle(fontSize: 12.sp, color: Colors.grey),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildDiabetesSurveysList(List<DiabetesSurvey> surveys) {
    if (surveys.isEmpty) {
      return Center(
        child: Text('No diabetes survey records', style: TextStyle(fontSize: 14.sp)),
      );
    }
    return ListView.builder(
      padding: EdgeInsets.all(16.w),
      itemCount: surveys.length,
      itemBuilder: (context, index) {
        final survey = surveys[surveys.length - 1 - index];
        return Card(
          margin: EdgeInsets.only(bottom: 10.h),
          child: ListTile(
            leading: Icon(Icons.assignment, size: 28.sp, color: Colors.green),
            title: Text(
              'Result: ${survey.diabetes}',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15.sp),
            ),
            subtitle: Text(
              'Probability: ${(survey.probability * 100).toStringAsFixed(1)}%\n${_formatDate(survey.timestamp)}',
              style: TextStyle(fontSize: 13.sp),
            ),
            isThreeLine: true,
          ),
        );
      },
    );
  }

  Widget _buildAnemiaRecordsList(List<AnemiaRecord> records) {
    if (records.isEmpty) {
      return Center(
        child: Text('No anemia image records', style: TextStyle(fontSize: 14.sp)),
      );
    }
    return ListView.builder(
      padding: EdgeInsets.all(16.w),
      itemCount: records.length,
      itemBuilder: (context, index) {
        final record = records[records.length - 1 - index];
        return Card(
          margin: EdgeInsets.only(bottom: 10.h),
          child: Padding(
            padding: EdgeInsets.all(12.w),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8.r),
                  child: Image.network(
                    record.imageUrl,
                    width: 80.w,
                    height: 80.w,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) => Container(
                      width: 80.w,
                      height: 80.w,
                      color: Colors.grey[300],
                      child: Icon(Icons.image, size: 40.sp, color: Colors.grey),
                    ),
                  ),
                ),
                SizedBox(width: 12.w),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Status: ${record.anemiaStatus}',
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15.sp),
                      ),
                      SizedBox(height: 4.h),
                      Text(
                        'HB Value: ${record.hbValue.toStringAsFixed(2)}',
                        style: TextStyle(fontSize: 13.sp),
                      ),
                      SizedBox(height: 4.h),
                      Text(
                        _formatDate(record.timestamp),
                        style: TextStyle(fontSize: 12.sp, color: Colors.grey),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildAnemiaSurveysList(List<AnemiaSurvey> surveys) {
    if (surveys.isEmpty) {
      return Center(
        child: Text('No anemia survey records', style: TextStyle(fontSize: 14.sp)),
      );
    }
    return ListView.builder(
      padding: EdgeInsets.all(16.w),
      itemCount: surveys.length,
      itemBuilder: (context, index) {
        final survey = surveys[surveys.length - 1 - index];
        return Card(
          margin: EdgeInsets.only(bottom: 10.h),
          child: ListTile(
            leading: Icon(Icons.assignment, size: 28.sp, color: Colors.orange),
            title: Text(
              'Prediction: ${survey.prediction}',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15.sp),
            ),
            subtitle: Text(
              'Probability: ${(survey.anemiaProbability * 100).toStringAsFixed(1)}%\n${_formatDate(survey.timestamp)}',
              style: TextStyle(fontSize: 13.sp),
            ),
            isThreeLine: true,
          ),
        );
      },
    );
  }

  String _formatDate(DateTime date) {
    return '${date.day}/${date.month}/${date.year} ${date.hour}:${date.minute.toString().padLeft(2, '0')}';
  }
}
