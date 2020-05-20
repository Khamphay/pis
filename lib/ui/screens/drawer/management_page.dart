import 'package:flutter/material.dart';
import 'package:pis/ui/screens/customer/page_customer.dart';
import 'package:pis/ui/screens/employee/employee_page.dart';
import 'package:pis/ui/screens/job/job_page.dart';
import 'package:pis/ui/screens/tools/tool_choose.dart';
import 'package:pis/ui/screens/tools/tools_page.dart';
import 'package:pis/ui/screens/user/user_page.dart';
import 'package:pis/ui/widgets/inkwell_widget.dart';
import '../../ui_constant.dart';
import 'listview_note.dart';

class ManagementPage extends StatefulWidget {
  @override
  _ManagementPageState createState() => _ManagementPageState();
}

class _ManagementPageState extends State<ManagementPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        iconTheme: IconThemeData(color: appbarIconColor),
        title: Text(
          'Management',
          style: appbarTextStyle,
        ),
        backgroundColor: appBarColor,
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              InkWellWidget(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => CustomerPage()));
                },
                title: "Customer",
              ),
              Divider(),
              InkWellWidget(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => EmployeePage()));
                },
                title: "Employee",
              ),
              Divider(),
              InkWellWidget(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => JobPage()));
                },
                title: "Job Order",
              ),
              Divider(),
              InkWellWidget(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => UserDashboard()));
                },
                title: "Add user",
              ),
               Divider(),
              InkWellWidget(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => ToolsPage()));
                },
                title: "Tools",
              ),
               Divider(),
              InkWellWidget(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => ToolChoosePage()));
                },
                title: "Choose",
              ),
               Divider(),
              InkWellWidget(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => ListViewNote()));
                },
                title: "Notes",
              ),
            ],
          ),
        ),
      ),
    );
  }
}