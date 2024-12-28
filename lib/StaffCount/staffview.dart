import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myapp/colors/colors.dart';

import 'staff_count.dart';

class StaffDetailsScreen1 extends StatefulWidget {
  const StaffDetailsScreen1({Key? key}) : super(key: key);

  @override
  _StaffDetailsScreen1State createState() => _StaffDetailsScreen1State();
}

class _StaffDetailsScreen1State extends State<StaffDetailsScreen1> {
  final List<Map<String, dynamic>> _staffList = [
    {
      'name': 'Emily Rodriguez',
      'position': 'Store Manager',
      'email': 'emily.r@example.com',
      'phone': '+1 234-567-8901',
      'joinDate': '2023-01-15',
      'status': 'Active',
      'avatar': 'ER',
      'department': 'Management',
      'performance': 4.8,
      'tasks': 12,
    },
    {
      'name': 'Alex Chen',
      'position': 'Sales Associate',
      'email': 'alex.c@example.com',
      'phone': '+1 234-567-8902',
      'joinDate': '2023-03-20',
      'status': 'Active',
      'avatar': 'AC',
      'department': 'Sales',
      'performance': 4.5,
      'tasks': 8,
    },
    {
      'name': 'Sarah Williams',
      'position': 'Customer Service',
      'email': 'sarah.w@example.com',
      'phone': '+1 234-567-8903',
      'joinDate': '2023-06-10',
      'status': 'On Leave',
      'avatar': 'SW',
      'department': 'Customer Support',
      'performance': 4.6,
      'tasks': 5,
    },
    {
      'name': 'Michael Brown',
      'position': 'Inventory Manager',
      'email': 'michael.b@example.com',
      'phone': '+1 234-567-8904',
      'joinDate': '2023-02-28',
      'status': 'Active',
      'avatar': 'MB',
      'department': 'Inventory',
      'performance': 4.7,
      'tasks': 15,
    },
    {
      'name': 'Lisa Johnson',
      'position': 'Marketing Specialist',
      'email': 'lisa.j@example.com',
      'phone': '+1 234-567-8905',
      'joinDate': '2023-04-15',
      'status': 'Active',
      'avatar': 'LJ',
      'department': 'Marketing',
      'performance': 4.9,
      'tasks': 10,
    },
    {
      'name': 'Alex Chen',
      'position': 'Sales Associate',
      'email': 'alex.c@example.com',
      'phone': '+1 234-567-8902',
      'joinDate': '2023-03-20',
      'status': 'Active',
      'avatar': 'AC',
      'department': 'Sales',
      'performance': 4.5,
      'tasks': 8,
    },
    {
      'name': 'Sarah Williams',
      'position': 'Customer Service',
      'email': 'sarah.w@example.com',
      'phone': '+1 234-567-8903',
      'joinDate': '2023-06-10',
      'status': 'On Leave',
      'avatar': 'SW',
      'department': 'Customer Support',
      'performance': 4.6,
      'tasks': 5,
    },
    {
      'name': 'Michael Brown',
      'position': 'Inventory Manager',
      'email': 'michael.b@example.com',
      'phone': '+1 234-567-8904',
      'joinDate': '2023-02-28',
      'status': 'Active',
      'avatar': 'MB',
      'department': 'Inventory',
      'performance': 4.7,
      'tasks': 15,
    },
    {
      'name': 'Alex Chen',
      'position': 'Sales Associate',
      'email': 'alex.c@example.com',
      'phone': '+1 234-567-8902',
      'joinDate': '2023-03-20',
      'status': 'Active',
      'avatar': 'AC',
      'department': 'Sales',
      'performance': 4.5,
      'tasks': 8,
    },
    {
      'name': 'Sarah Williams',
      'position': 'Customer Service',
      'email': 'sarah.w@example.com',
      'phone': '+1 234-567-8903',
      'joinDate': '2023-06-10',
      'status': 'On Leave',
      'avatar': 'SW',
      'department': 'Customer Support',
      'performance': 4.6,
      'tasks': 5,
    },
    {
      'name': 'Michael Brown',
      'position': 'Inventory Manager',
      'email': 'michael.b@example.com',
      'phone': '+1 234-567-8904',
      'joinDate': '2023-02-28',
      'status': 'Active',
      'avatar': 'MB',
      'department': 'Inventory',
      'performance': 4.7,
      'tasks': 15,
    },
  ];

  String _searchQuery = '';
  String _selectedDepartment = '';
  double? _selectedPerformance;

  List<Map<String, dynamic>> get filteredStaff {
    List<Map<String, dynamic>> staff = _staffList;

    if (_searchQuery.isNotEmpty) {
      staff = staff.where((staffMember) {
        return staffMember['name']
                .toLowerCase()
                .contains(_searchQuery.toLowerCase()) ||
            staffMember['position']
                .toLowerCase()
                .contains(_searchQuery.toLowerCase()) ||
            staffMember['department']
                .toLowerCase()
                .contains(_searchQuery.toLowerCase());
      }).toList();
    }

    if (_selectedDepartment.isNotEmpty) {
      staff = staff.where((staffMember) {
        return staffMember['department'] == _selectedDepartment;
      }).toList();
    }

    if (_selectedPerformance != null) {
      staff = staff.where((staffMember) {
        return staffMember['performance'] >= _selectedPerformance!;
      }).toList();
    }

    return staff;
  }

  void _showStaffDialog([Staff? staff]) {
    final isEditing = staff != null;
    final nameController = TextEditingController(text: staff?.name ?? '');
    final positionController =
        TextEditingController(text: staff?.position ?? '');
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
          style: GoogleFonts.poppins(color: const Color.fromARGB(255, 0, 0, 0)),
        ),
        content: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: nameController,
                style: TextStyle(color: const Color.fromARGB(255, 0, 0, 0)),
                decoration: InputDecoration(
                  labelText: 'Name',
                  labelStyle:
                      TextStyle(color: const Color.fromARGB(255, 0, 0, 0)),
                  border: OutlineInputBorder(),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                ),
              ),
              SizedBox(height: 16),
              TextField(
                controller: positionController,
                style: TextStyle(color: const Color.fromARGB(255, 0, 0, 0)),
                decoration: InputDecoration(
                  labelText: 'Position',
                  labelStyle:
                      TextStyle(color: const Color.fromARGB(255, 0, 0, 0)),
                  border: OutlineInputBorder(),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                ),
              ),
              SizedBox(height: 16),
              TextField(
                controller: emailController,
                style: TextStyle(color: const Color.fromARGB(255, 0, 0, 0)),
                decoration: InputDecoration(
                  labelText: 'Email',
                  labelStyle:
                      TextStyle(color: const Color.fromARGB(255, 0, 0, 0)),
                  border: OutlineInputBorder(),
                  enabledBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: const Color.fromARGB(255, 0, 0, 0)),
                  ),
                ),
              ),
              SizedBox(height: 16),
              TextField(
                controller: phoneController,
                style: TextStyle(color: const Color.fromARGB(255, 0, 0, 0)),
                decoration: InputDecoration(
                  labelText: 'Phone',
                  labelStyle:
                      TextStyle(color: const Color.fromARGB(255, 0, 0, 0)),
                  border: OutlineInputBorder(),
                  enabledBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: const Color.fromARGB(255, 0, 0, 0)),
                  ),
                ),
              ),
              SizedBox(height: 16),
              DropdownButtonFormField<String>(
                value: selectedDepartment,
                dropdownColor: Colors.grey[900],
                style: TextStyle(color: const Color.fromARGB(255, 0, 0, 0)),
                decoration: InputDecoration(
                  labelText: 'Department',
                  labelStyle:
                      TextStyle(color: const Color.fromARGB(255, 0, 0, 0)),
                  border: OutlineInputBorder(),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                ),
                items: [
                  'Management',
                  'Sales',
                  'Customer Support',
                  'Inventory',
                  'Marketing'
                ].map((String value) {
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
                title: Text('Active Status',
                    style: TextStyle(color: Colors.white)),
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
            child: Text('Cancel',
                style: TextStyle(color: const Color.fromARGB(255, 0, 0, 0))),
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
                  final index =
                      _staffList.indexOf(staff! as Map<String, dynamic>);
                  _staffList[index] = newStaff as Map<String, dynamic>;
                } else {
                  _staffList.add(newStaff as Map<String, dynamic>);
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

  void _openFilterDialog() async {
    final result = await showDialog<Map<String, dynamic>>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Filter Options', style: GoogleFonts.poppins()),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Department filter
              DropdownButton<String>(
                value: _selectedDepartment.isEmpty ? null : _selectedDepartment,
                hint: Text('Select Department'),
                items: [
                  'Management',
                  'Sales',
                  'Customer Support',
                  'Inventory',
                  'Marketing'
                ].map((department) {
                  return DropdownMenuItem<String>(
                    value: department,
                    child: Text(department),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    _selectedDepartment = value ?? '';
                  });
                },
              ),
              SizedBox(height: 16),
              // Performance filter
              Slider(
                min: 0,
                max: 5,
                divisions: 5,
                value: _selectedPerformance ?? 0,
                onChanged: (value) {
                  setState(() {
                    _selectedPerformance = value;
                  });
                },
                label:
                    'Performance: ${_selectedPerformance?.toStringAsFixed(1)}',
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Cancel', style: GoogleFonts.poppins()),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context, {
                  'department': _selectedDepartment,
                  'performance': _selectedPerformance,
                });
              },
              child: Text('Apply', style: GoogleFonts.poppins()),
            ),
          ],
        );
      },
    );

    if (result != null) {
      setState(() {
        _selectedDepartment = result['department'] ?? '';
        _selectedPerformance = result['performance'];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
            )),
        centerTitle: true,
        title: Text(
          'Staff Details',
          style: GoogleFonts.poppins(
            color: Colors.white,
            fontWeight: FontWeight.w600,
          ),
        ),
               flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: AppColors.blackGradient,
            
          ),
        ),
        actions: [
          IconButton(
            onPressed: _openFilterDialog,
            icon: Icon(Icons.tune, color: Colors.white),
          ),
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => StaffDetailsScreen()),
              );
            },
            icon: Icon(Icons.mode_edit_outline_outlined, color: Colors.white),
          ),
        ],
      ),
      body: Container(
        decoration: BoxDecoration(gradient: AppColors.scaffoldGradient),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                onChanged: (value) {
                  setState(() {
                    _searchQuery = value;
                  });
                },
                decoration: InputDecoration(
                  hintText: 'Search staff...',
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  filled: true,
                  fillColor: Colors.grey[100],
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: filteredStaff.length,
                itemBuilder: (context, index) {
                  final staff = filteredStaff[index];
                  return Card(
                    color: Colors.white,
                    margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    elevation: 3,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: ExpansionTile(
                      leading: CircleAvatar(
                        backgroundColor: Color.fromARGB(255, 117, 0, 106),
                        child: Text(
                          staff['avatar'],
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      title: Text(
                        staff['name'],
                        style: GoogleFonts.poppins(
                          color: const Color.fromARGB(255, 0, 0, 0),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: Text(
                        staff['position'],
                        style: GoogleFonts.poppins(
                          color: const Color.fromARGB(255, 0, 0, 0),
                        ),
                      ),
                      trailing: Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                        decoration: BoxDecoration(
                          color: staff['status'] == 'Active'
                              ? Colors.green.withOpacity(0.1)
                              : Colors.orange.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Text(
                          staff['status'],
                          style: TextStyle(
                            color: staff['status'] == 'Active'
                                ? Colors.green
                                : Colors.orange,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            children: [
                              _buildInfoRow(
                                  Icons.email, 'Email', staff['email']),
                              _buildInfoRow(
                                  Icons.phone, 'Phone', staff['phone']),
                              _buildInfoRow(Icons.calendar_today, 'Join Date',
                                  staff['joinDate']),
                              _buildInfoRow(Icons.business, 'Department',
                                  staff['department']),
                              SizedBox(height: 16),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  ElevatedButton.icon(
                                    onPressed: () {
                                      // Add message functionality
                                    },
                                    icon: Icon(
                                      Icons.message,
                                      color: Colors.white,
                                    ),
                                    label: Text('Message',
                                        style: GoogleFonts.poppins(
                                            color: const Color.fromARGB(255, 0, 0, 0))),
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor:
                                          Color.fromARGB(255, 255, 251, 0),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 40,
                                    width: 122,
                                    child: OutlinedButton.icon(
                                      onPressed: () {
                                        // Add view profile functionality
                                      },
                                      icon: Icon(Icons.person),
                                      label: Text('View Profile',
                                          style: GoogleFonts.poppins(
                                              color: const Color.fromARGB(
                                                  255, 0, 0, 0))),
                                      style: OutlinedButton.styleFrom(
                                        side: BorderSide(
                                            color: const Color.fromARGB(
                                                255, 0, 0, 0)),
                                        backgroundColor:
                                            Color.fromARGB(255, 255, 251, 0)
                                                .withOpacity(0.2),
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoRow(IconData icon, String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Icon(icon, size: 20, color: const Color.fromARGB(255, 0, 0, 0)),
          SizedBox(width: 12),
          Text(
            '$label:',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: const Color.fromARGB(255, 0, 0, 0),
            ),
          ),
          SizedBox(width: 8),
          Text(value,
              style: TextStyle(color: const Color.fromARGB(255, 0, 0, 0))),
        ],
      ),
    );
  }

  Widget _buildStatCard(
      String label, String value, IconData icon, Color color) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        children: [
          Icon(icon, color: color),
          SizedBox(height: 4),
          Text(
            value,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
              color: const Color.fromARGB(255, 0, 0, 0),
            ),
          ),
          Text(
            label,
            style: TextStyle(
              color: const Color.fromARGB(255, 0, 0, 0),
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}
