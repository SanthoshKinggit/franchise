import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../colors/colors.dart';

// Staff class to represent staff member details
class Staff {
  String name;
  String position;
  String email;
  String phone;
  String joinDate;
  bool isActive;
  String avatar;
  String department;
  double performance;
  int tasks;

  Staff({
    required this.name,
    required this.position,
    required this.email,
    required this.phone,
    required this.joinDate,
    required this.isActive,
    required this.avatar,
    required this.department,
    required this.performance,
    required this.tasks,
  });
}

class StaffDetailsScreen extends StatefulWidget {
  const StaffDetailsScreen({Key? key}) : super(key: key);

  @override
  _StaffDetailsScreenState createState() => _StaffDetailsScreenState();
}

class _StaffDetailsScreenState extends State<StaffDetailsScreen> {
  final List<Staff> _staffList = [
    Staff(
      name: 'Emily Rodriguez',
      position: 'Store Manager',
      email: 'emily.r@example.com',
      phone: '+1 234-567-8901',
      joinDate: '2023-01-15',
      isActive: true,
      avatar: 'ER',
      department: 'Management',
      performance: 4.8,
      tasks: 12,
    ),
    Staff(
      name: 'Alex Chen',
      position: 'Sales Associate',
      email: 'alex.c@example.com',
      phone: '+1 234-567-8902',
      joinDate: '2023-03-20',
      isActive: true,
      avatar: 'AC',
      department: 'Sales',
      performance: 4.5,
      tasks: 8,
    ),
    Staff(
      name: 'Sarah Williams',
      position: 'Customer Service',
      email: 'sarah.w@example.com',
      phone: '+1 234-567-8903',
      joinDate: '2023-06-10',
      isActive: false,
      avatar: 'SW',
      department: 'Customer Support',
      performance: 4.6,
      tasks: 5,
    ),
    Staff(
      name: 'Michael Brown',
      position: 'Inventory Manager',
      email: 'michael.b@example.com',
      phone: '+1 234-567-8904',
      joinDate: '2023-02-28',
      isActive: true,
      avatar: 'MB',
      department: 'Inventory',
      performance: 4.7,
      tasks: 15,
    ),
    Staff(
      name: 'Lisa Johnson',
      position: 'Marketing Specialist',
      email: 'lisa.j@example.com',
      phone: '+1 234-567-8905',
      joinDate: '2023-04-15',
      isActive: true,
      avatar: 'LJ',
      department: 'Marketing',
      performance: 4.9,
      tasks: 10,
    ),
     Staff(
      name: 'Alex Chen',
      position: 'Sales Associate',
      email: 'alex.c@example.com',
      phone: '+1 234-567-8902',
      joinDate: '2023-03-20',
      isActive: true,
      avatar: 'AC',
      department: 'Sales',
      performance: 4.5,
      tasks: 8,
    ),
    Staff(
      name: 'Sarah Williams',
      position: 'Customer Service',
      email: 'sarah.w@example.com',
      phone: '+1 234-567-8903',
      joinDate: '2023-06-10',
      isActive: false,
      avatar: 'SW',
      department: 'Customer Support',
      performance: 4.6,
      tasks: 5,
    ),
    Staff(
      name: 'Michael Brown',
      position: 'Inventory Manager',
      email: 'michael.b@example.com',
      phone: '+1 234-567-8904',
      joinDate: '2023-02-28',
      isActive: true,
      avatar: 'MB',
      department: 'Inventory',
      performance: 4.7,
      tasks: 15,
    ),
    Staff(
      name: 'Alex Chen',
      position: 'Sales Associate',
      email: 'alex.c@example.com',
      phone: '+1 234-567-8902',
      joinDate: '2023-03-20',
      isActive: true,
      avatar: 'AC',
      department: 'Sales',
      performance: 4.5,
      tasks: 8,
    ),
    Staff(
      name: 'Sarah Williams',
      position: 'Customer Service',
      email: 'sarah.w@example.com',
      phone: '+1 234-567-8903',
      joinDate: '2023-06-10',
      isActive: false,
      avatar: 'SW',
      department: 'Customer Support',
      performance: 4.6,
      tasks: 5,
    ),
    Staff(
      name: 'Michael Brown',
      position: 'Inventory Manager',
      email: 'michael.b@example.com',
      phone: '+1 234-567-8904',
      joinDate: '2023-02-28',
      isActive: true,
      avatar: 'MB',
      department: 'Inventory',
      performance: 4.7,
      tasks: 15,
    ),
    Staff(
      name: 'Lisa Johnson',
      position: 'Marketing Specialist',
      email: 'lisa.j@example.com',
      phone: '+1 234-567-8905',
      joinDate: '2023-04-15',
      isActive: true,
      avatar: 'LJ',
      department: 'Marketing',
      performance: 4.9,
      tasks: 10,
    ),
       Staff(
      name: 'Alex Chen',
      position: 'Sales Associate',
      email: 'alex.c@example.com',
      phone: '+1 234-567-8902',
      joinDate: '2023-03-20',
      isActive: true,
      avatar: 'AC',
      department: 'Sales',
      performance: 4.5,
      tasks: 8,
    ),
    Staff(
      name: 'Sarah Williams',
      position: 'Customer Service',
      email: 'sarah.w@example.com',
      phone: '+1 234-567-8903',
      joinDate: '2023-06-10',
      isActive: false,
      avatar: 'SW',
      department: 'Customer Support',
      performance: 4.6,
      tasks: 5,
    ),
  ];
 String filter = 'All'; // Default filter option

  void _showFilterOptions(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Filter Transactions'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                title: Text('Last 6 months'),
                onTap: () {
                  setState(() => filter = 'Last 6 months');
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: Text('Last 1 year'),
                onTap: () {
                  setState(() => filter = 'Last 1 year');
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: Text('Last month'),
                onTap: () {
                  setState(() => filter = 'Last month');
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: Text('All Transactions'),
                onTap: () {
                  setState(() => filter = 'All');
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        );
      },
    );
  }

  String _searchQuery = '';
  String _selectedDepartment = '';
  double? _selectedPerformance;

  List<Staff> get filteredStaff {
    List<Staff> staff = _staffList;

    if (_searchQuery.isNotEmpty) {
      staff = staff.where((staffMember) {
        return staffMember.name.toLowerCase().contains(_searchQuery.toLowerCase()) ||
            staffMember.position.toLowerCase().contains(_searchQuery.toLowerCase()) ||
            staffMember.department.toLowerCase().contains(_searchQuery.toLowerCase());
      }).toList();
    }

    if (_selectedDepartment.isNotEmpty) {
      staff = staff.where((staffMember) {
        return staffMember.department == _selectedDepartment;
      }).toList();
    }

    if (_selectedPerformance != null) {
      staff = staff.where((staffMember) {
        return staffMember.performance >= _selectedPerformance!;
      }).toList();
    }

    return staff;
  }

  void _showStaffDialog([Staff? staff]) {
    final isEditing = staff != null;
    final nameController = TextEditingController(text: staff?.name ?? '');
    final positionController = TextEditingController(text: staff?.position ?? '');
    final emailController = TextEditingController(text: staff?.email ?? '');
    final phoneController = TextEditingController(text: staff?.phone ?? '');
    String selectedDepartment = staff?.department ?? 'Management';
    bool isActive = staff?.isActive ?? true;

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: Colors.grey[900],
        title: Text(
          isEditing ? 'Edit Staff Member' : 'Add New Staff Member',
          style: GoogleFonts.poppins(color: Colors.white),
        ),
        content: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: nameController,
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  labelText: 'Name',
                  labelStyle: TextStyle(color: Colors.white),
                  border: OutlineInputBorder(),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                ),
              ),
              SizedBox(height: 16),
              TextField(
                controller: positionController,
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  labelText: 'Position',
                  labelStyle: TextStyle(color: Colors.white),
                  border: OutlineInputBorder(),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                ),
              ),
              SizedBox(height: 16),
              TextField(
                controller: emailController,
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  labelText: 'Email',
                  labelStyle: TextStyle(color: Colors.white),
                  border: OutlineInputBorder(),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                ),
              ),
              SizedBox(height: 16),
              TextField(
                controller: phoneController,
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  labelText: 'Phone',
                  labelStyle: TextStyle(color: Colors.white),
                  border: OutlineInputBorder(),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                ),
              ),
              SizedBox(height: 16),
              DropdownButtonFormField<String>(
                value: selectedDepartment,
                dropdownColor: Colors.grey[900],
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  labelText: 'Department',
                  labelStyle: TextStyle(color: Colors.white),
                  border: OutlineInputBorder(),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                ),
                items: ['Management', 'Sales', 'Customer Support', 'Inventory', 'Marketing']
                    .map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value, style: TextStyle(color: Colors.white)),
                  );
                }).toList(),
                onChanged: (value) {
                  selectedDepartment = value!;
                },
              ),
              SizedBox(height: 16),
              CheckboxListTile(
                title: Text('Active Status', style: TextStyle(color: Colors.white)),
                value: isActive,
                onChanged: (bool? value) {
                  setState(() {
                    isActive = value!;
                  });
                },
              ),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('Cancel', style: TextStyle(color: Colors.white)),
          ),
          TextButton(
            onPressed: () {
              final newStaff = Staff(
                name: nameController.text,
                position: positionController.text,
                email: emailController.text,
                phone: phoneController.text,
                joinDate: DateTime.now().toString().split(' ')[0],
                isActive: isActive,
                avatar: nameController.text
                    .split(' ')
                    .map((e) => e[0])
                    .take(2)
                    .join(),
                department: selectedDepartment,
                performance: staff?.performance ?? 4.0,
                tasks: staff?.tasks ?? 0,
              );

              setState(() {
                if (isEditing) {
                  final index = _staffList.indexOf(staff!);
                  _staffList[index] = newStaff;
                } else {
                  _staffList.add(newStaff);
                }
              });

              Navigator.pop(context);
            },
            child: Text(
              isEditing ? 'Save Changes' : 'Add Staff',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }

  void _showDeleteConfirmation(Staff staff) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: Colors.grey[900],
        title: Text('Delete Staff Member', style: GoogleFonts.poppins(color: Colors.white)),
        content: Text(
          'Are you sure you want to delete ${staff.name}?',
          style: GoogleFonts.poppins(color: Colors.white),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('Cancel', style: TextStyle(color: Colors.white)),
          ),
          TextButton(
            onPressed: () {
              setState(() {
                _staffList.remove(staff);
              });
              Navigator.pop(context);
            },
            child: Text('Delete', style: TextStyle(color: Colors.red)),
          ),
        ],
      ),
    );
  }

  void _openFilterDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: Colors.grey[900],
        title: Text('Filter Staff', style: GoogleFonts.poppins(color: Colors.white)),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              onChanged: (query) {
                setState(() {
                  _searchQuery = query;
                });
              },
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                labelText: 'Search by Name, Position, or Department',
                labelStyle: TextStyle(color: Colors.white),
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),
            DropdownButtonFormField<String>(
              value: _selectedDepartment.isEmpty ? null : _selectedDepartment,
              dropdownColor: Colors.grey[900],
              style: TextStyle(color: const Color.fromARGB(255, 0, 0, 0)),
              decoration: InputDecoration(
                labelText: 'Department',
                labelStyle: TextStyle(color: Colors.white),
                border: OutlineInputBorder(),
              ),
              items: ['All', 'Management', 'Sales', 'Customer Support', 'Inventory', 'Marketing']
                  .map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value, style: TextStyle(color: Colors.white)),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  _selectedDepartment = value!;
                });
              },
            ),
            SizedBox(height: 16),
            Slider(
              value: _selectedPerformance ?? 0.0,
              min: 0.0,
              max: 5.0,
              divisions: 5,
              label: _selectedPerformance?.toStringAsFixed(1),
              onChanged: (value) {
                setState(() {
                  _selectedPerformance = value;
                });
              },
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('Close', style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
        centerTitle: true,
            flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: AppColors.blackGradient,
            
          ),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios,
            color: const Color.fromARGB(255, 255, 255, 255),
          ),
        ),
        title: Text(
          'Staff Mangement',
          style: GoogleFonts.poppins(
            color: Colors.white,
          ),
        ),
         actions: [
           IconButton(
            icon: Icon(Icons.tune, color: Colors.white),
            onPressed: () => _showFilterOptions(context),
          ),
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: AppColors.scaffoldGradient
          ),

        child: ListView.builder(
          itemCount: filteredStaff.length,
          itemBuilder: (context, index) {
            final staff = filteredStaff[index];
            return Card(
              
              margin: EdgeInsets.all(10),
              color: const Color.fromARGB(255, 255, 255, 255),
              child: ListTile(
                leading: CircleAvatar(
                  backgroundColor: const Color.fromARGB(255, 112, 0, 103),
                  child: Text(staff.avatar, style: TextStyle(color: Colors.white)),
                ),
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,

                  children: [
                    Text(staff.name, style: TextStyle(color: const Color.fromARGB(255, 0, 0, 0))),
                   
                    IconButton(
                      icon: Icon(Icons.edit_note_outlined, color: const Color.fromARGB(255, 0, 0, 0)),
                      onPressed: () => _showStaffDialog(staff),
                    ),
                  ],
                ),
                subtitle: Text(staff.position, style: TextStyle(color: const Color.fromARGB(179, 0, 0, 0))),
                trailing: IconButton(
                  icon: Icon(Icons.remove_circle_outline_outlined, color: Colors.red),
                  onPressed: () => _showDeleteConfirmation(staff),
                ),
                onTap: () => _showStaffDialog(staff),
              ),
            );
          },
        ),
      ),
      
    );
  }
}

