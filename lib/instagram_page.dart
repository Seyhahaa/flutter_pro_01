// instagram_page.dart
import 'package:flutter/material.dart';

class InstagramPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Row(
          children: [
            Text('Instagram', style: TextStyle(color: Colors.black,fontFamily: 'Instagram',fontSize: 28,)),
            Icon(Icons.keyboard_arrow_down, color: Colors.black),
          ],
        ),
        actions: [
          IconButton(
            icon: Stack( 
              children: [
                const Icon(Icons.favorite_border, color: Colors.black, size: 28),
                Positioned(right: 1,top: 4,
                  child: Container(height: 6,width: 6,
                    padding: const EdgeInsets.all(2),
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    
                  ),
                ),
              ],
            ),
            onPressed: () {},
          ),
          IconButton(
            icon:const Icon(Icons.messenger_outline, color: Colors.black, size: 28),
            onPressed: () {},
          ),
        ],
      ),

      body: SingleChildScrollView(
        child: Column(
          children: [
            // Stories
            SizedBox(
              height: 100,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  _buildStoryItem('ninaslstrh', 'assets/profile1.jpg'),
                  _buildStoryItem('ch_._sreynudt', 'assets/profile2.jpg'),
                  _buildStoryItem('hornsokunthea', 'assets/profile3.jpg'),
                  _buildStoryItem('yogiwidiawati', 'assets/profile4.jpg'),
                  _buildStoryItem('yogiwidiawati', 'assets/profile4.jpg'),

                ],
              ),
            ),
            // Post
            _buildPost(),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: const[
          BottomNavigationBarItem(
            icon: Icon(Icons.home, color: Colors.black),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search, color: Colors.black),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_box_outlined, color: Colors.black),
            label: 'Add',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.video_library_outlined, color: Colors.black),
            label: 'Reels',
          ),
          BottomNavigationBarItem(
            icon: CircleAvatar(
              radius: 12,
              backgroundImage: AssetImage('assets/profile.jpg'),
            ),
            label: 'Profile',
          ),
        ],
      ),
    );
  }

  Widget _buildStoryItem(String username, String imagePath) {
    return Container(
      width: 80,
      margin: const EdgeInsets.symmetric(horizontal: 5),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(2),
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.purple, Colors.orange],
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
              ),
              shape: BoxShape.circle,
            ),
            child: Container(
              padding: const EdgeInsets.all(2),
              decoration: const BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
              ),
              child: CircleAvatar(
                radius: 30,
                backgroundImage: AssetImage(imagePath),
              ),
            ),
          ),
          const SizedBox(height: 4),
          Text(
            username,
            overflow: TextOverflow.ellipsis,
            style:const TextStyle(fontSize: 12),
          ),
        ],
      ),
    );
  }

  Widget _buildPost() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Post header
       const ListTile(
          leading: CircleAvatar(
            backgroundImage: AssetImage('assets/profile.jpg'),
          ),
          title: Row(
            children: [
              Text(
                'ery_blp',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
              ),
            ],
          ),
          subtitle: Text('Chaktomuk Conference Hall'),
          trailing: Icon(Icons.more_vert),
        ),
        // Post image
        Container(
          height: 400,
          width: double.infinity,
          decoration:const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/post.jpg'),
              fit: BoxFit.cover,
            ),
          ),
        ),
        // Post actions
        Row(
          children: [
            IconButton(
              icon: const Icon(Icons.favorite_border),
              onPressed: () {},
            ),
            IconButton(
              icon: const Icon(Icons.comment_outlined),
              onPressed: () {},
            ),
            IconButton(
              icon:const Icon(Icons.send_outlined),
              onPressed: () {},
            ),
            const Spacer(),
            IconButton(
              icon: Icon(Icons.bookmark_border),
              onPressed: () {},
            ),
          ],
        ),
        // Likes
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            '24 likes',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        // Caption
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: RichText(
            text: const TextSpan(
              style: TextStyle(color: Colors.black),
              children: [
                TextSpan(
                  text: 'ery_blp ',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                TextSpan(
                  text: 'Celebrating 65th Anniversary of Cambodia and Indonesia diplomatic...',
                ),
                TextSpan(
                  text: ' more',
                  style: TextStyle(color: Colors.grey),
                ),
              ],
            ),
          ),
        ),
        // Time
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            '4 days ago',
            style: TextStyle(
              color: Colors.grey,
              fontSize: 12,
            ),
          ),
        ),
      ],
    );
  }
}