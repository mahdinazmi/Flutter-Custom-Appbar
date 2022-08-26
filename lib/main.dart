import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({
    Key ? key
  }): super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home()
    );
  }
}

class Home extends StatelessWidget {
  const Home({
    Key ? key
  }): super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomPaint(
        painter: LogoPainter(),
        size: const Size(400, 195),
          child: _appBarContent()
      ),
    );
  }

  Widget _appBarContent() {
    return Container(
      height: 195,
      width: 400,
      margin: const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
        child: Column(
          children: [
            _header(),
            const SizedBox(height: 20, ),
              _userInfo()
          ],
        ),
    );
  }

  Widget _header() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: const [
        Icon(Icons.arrow_back_rounded, color: Colors.white, size: 30, ),
        Icon(Icons.menu, color: Colors.white, size: 30, )
      ],
    );
  }

  Widget _userInfo() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _userAvatar(),
        const SizedBox(width: 20, ),
          Expanded(
            flex: 1,
            child: Column(
              children: [
                _userPersonalInfo(),
                const SizedBox(height: 25, ),
                _userFollowInfo()
              ],
            ),
          )
      ],
    );
  }

  Widget _userAvatar() {
    return const CircleAvatar(
      radius: 35,
      backgroundImage: AssetImage('assets/images/avatar.jpg'),
    );
  }

  Widget _userPersonalInfo() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          flex: 2,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                  'Marry',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 28,
                    color: Colors.white
                  ),
                ),
                const SizedBox(height: 10, ),
                  Row(
                    children: const [
                      Icon(
                        Icons.location_on_outlined,
                        color: Colors.white,
                        size: 15,
                      ),
                      SizedBox(width: 5, ),
                      Text(
                        'China Beijing',
                        style: TextStyle(
                          fontSize: 10,
                          letterSpacing: 2,
                          color: Colors.white
                        ),
                      ),
                    ],
                  )
            ],
          ),
        ),
        Expanded(
          flex: 1,
          child: Container(
            height: 30,
            child: const Center(
                child: Text(
                  'Follow',
                  style: TextStyle(
                    color: Color.fromARGB(255, 177, 22, 234),
                    fontWeight: FontWeight.w500
                  ),
                ),
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
          ),
        )
      ],
    );
  }

  Widget _userFollowInfo() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              '648',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w500,
                fontSize: 17
              ),
            ),
            SizedBox(height: 15, ),
            Text(
              'Follow',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w500,
                fontSize: 11
              ),
            ),
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: const [
            Text(
              '7',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w500,
                fontSize: 17
              ),
            ),
            SizedBox(height: 15, ),
            Text(
              'Bucket',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w500,
                fontSize: 11
              ),
            ),
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: const [
            Text(
              '1046',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w500,
                fontSize: 17
              ),
            ),
            SizedBox(height: 15, ),
            Text(
              'Followers',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w500,
                fontSize: 11
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class LogoPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var rect = Offset.zero & size;
    Paint paint = Paint();
    Path path = Path();
    paint.shader = const LinearGradient(
        begin: Alignment.centerLeft,
        end: Alignment.centerRight,
        colors: [
          Color.fromARGB(255, 242, 101, 197),
          Color.fromARGB(255, 154, 76, 237),
        ],
      ).createShader(rect);
    path.lineTo(0, size.height - size.height / 8);
    path.conicTo(size.width / 1.2, size.height, size.width, size.height - size.height / 8, 9);
    path.lineTo(size.width, 0);
    path.close();
    canvas.drawShadow(path,const Color.fromARGB(255, 242, 101, 197), 4, false);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}