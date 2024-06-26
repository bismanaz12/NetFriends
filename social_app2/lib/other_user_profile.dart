import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:social_app2/edit_profile.dart';
import 'package:social_app2/post_provider.dart';
import 'package:social_app2/user_provider.dart';
import 'note_model.dart';

class OtherUserProfile extends StatefulWidget {
  final String userId;

  OtherUserProfile({Key? key, required this.userId}) : super(key: key);

  @override
  State<OtherUserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends State<OtherUserProfile> {
  @override
  void initState() {
    Provider.of<UserProvider>(context, listen: false).getUserDataById(widget.userId);
    Provider.of<PostProvider>(context, listen: false).getUserPosts(widget.userId);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<UserProvider>(context).otherUser;
    var size = MediaQuery.of(context).size;

    return Scaffold(

      resizeToAvoidBottomInset: false,
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.deepPurpleAccent.shade700.withOpacity(0.9),
              Colors.purple.shade800.withOpacity(0.7),
              Colors.purple.shade800.withOpacity(0.6),
              Colors.purple.shade800.withOpacity(0.6),
              Colors.purple.shade200.withOpacity(0.9),
              Colors.purple.shade100.withOpacity(0.9),
            ],
          ),
        ),
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  width: size.width,
                  height: size.height * 0.3,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/images/pro.png"),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.only(left: size.width * 0.8, bottom: size.width * 0.4),
                    child: Icon(Icons.menu, color: Colors.white, size: 28),
                  ),
                ),
                Positioned(
                  top: size.height * 0.21,
                  left: size.height * 0.19,
                  child: CircleAvatar(
                    radius: 35,
                    backgroundImage: AssetImage( 'assets/images/nim.jpg'),
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(top: size.height * 0.01, left: size.height * 0.08),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    provider?.firstName ?? 'Nimra',
                    style: TextStyle(
                      color: Colors.deepPurpleAccent.shade700,
                      fontWeight: FontWeight.w700,
                      fontSize: 25,
                    ),
                  ),
                  SizedBox(width: 6),
                  IconButton(
                    onPressed: () {
                      // Navigator.push(context, MaterialPageRoute(builder: (context) => EditPro()));
                    },
                    icon: Icon(Icons.edit_outlined, size: 25, color: Colors.deepPurpleAccent.shade400),
                  ),
                ],
              ),
            ),
            Text(
              provider?.email ?? 'nimra@gmail.com',
              style: TextStyle(
                color: Colors.deepPurpleAccent.shade700.withOpacity(0.8),
                fontWeight: FontWeight.w500,
                fontSize: 20,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: size.height * 0.01),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      Text(
                        "2",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w900,
                          fontSize: 20,
                        ),
                      ),
                      Text(
                        "Followers",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w400,
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: size.height * 0.04, right: size.height * 0.03),
                    child: Container(
                      height: size.height * 0.08,
                      width: size.width * 0.005,
                      decoration: BoxDecoration(
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Column(
                    children: [
                      Text(
                        "5",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w900,
                          fontSize: 20,
                        ),
                      ),
                      Text(
                        "Following",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w400,
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: size.height * 0.01),
                  child: ElevatedButton(
                    onPressed: () async {
                      // Follow action
                    },
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.purple.shade800,
                      backgroundColor: Colors.indigo.shade300.withOpacity(0.5),
                      minimumSize: Size(size.width * 0.35, size.height * 0.06),
                      shadowColor: Colors.black,
                      elevation: 4.0,
                    ),
                    child: Text(
                      "Followed",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 15),
                Padding(
                  padding: EdgeInsets.only(top: size.height * 0.01),
                  child: ElevatedButton(
                    onPressed: () async {
                      // Message action
                    },
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.purple.shade800,
                      backgroundColor: Colors.white.withOpacity(0.8),
                      minimumSize: Size(size.width * 0.35, size.height * 0.06),
                      shadowColor: Colors.black,
                      elevation: 4.0,
                    ),
                    child: Text(
                      "Followings",
                      style: TextStyle(
                        color: Colors.indigo.shade400.withOpacity(0.9),
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Expanded(
              child: StreamBuilder(
                stream: FirebaseFirestore.instance
                    .collection('posts')
                    .where('userUid', isEqualTo: widget.userId)
                    .snapshots(),
                builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  }

                  if (snapshot.hasError) {
                    return Center(child: Text('Error: ${snapshot.error}'));
                  }

                  if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                    return Center(child: Text('No posts available'));
                  }

                  final posts = snapshot.data!.docs
                      .map((doc) => NoteModel.fromMap(doc.data() as Map<String, dynamic>))
                      .toList();

                  return GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 10.0,
                      mainAxisSpacing: 10.0,
                    ),
                    itemCount: posts.length,
                    itemBuilder: (context, index) {
                      final post = posts[index];
                      return GestureDetector(
                        onTap: () {
                          // Handle post click
                        },
                        child: GridTile(
                          child: Image.network(
                            post.noteUrl,
                            fit: BoxFit.cover,
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
class UserListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Users'),
      ),
      body: UserList(),
    );
  }
}

class UserList extends StatelessWidget {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: _firestore.collection('users').snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Center(child: CircularProgressIndicator());
        }

        var users = snapshot.data!.docs;

        return ListView.builder(
          itemCount: users.length,
          itemBuilder: (context, index) {
            var user = users[index];
            return UserTile(user: user);
          },
        );
      },
    );
  }
}

class UserTile extends StatelessWidget {
  final DocumentSnapshot user;

  UserTile({required this.user});

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> _toggleFollow() async {
    var currentUserId = 'currentUserId';  // Replace with actual current user ID
    var userId = user.id;

    var userDoc = _firestore.collection('users').doc(userId);
    var currentUserDoc = _firestore.collection('users').doc(currentUserId);

    var userData = await userDoc.get();
    var currentUserData = await currentUserDoc.get();

    var userFollowers = List<String>.from(userData['followers']);
    var currentUserFollowing = List<String>.from(currentUserData['following']);

    if (userFollowers.contains(currentUserId)) {
      userFollowers.remove(currentUserId);
      currentUserFollowing.remove(userId);
    } else {
      userFollowers.add(currentUserId);
      currentUserFollowing.add(userId);
    }

    await userDoc.update({'followers': userFollowers});
    await currentUserDoc.update({'following': currentUserFollowing});
  }

  @override
  Widget build(BuildContext context) {
    var currentUserId = 'currentUserId';  // Replace with actual current user ID
    var isFollowing = user['followers'].contains(currentUserId);

    return ListTile(
      title: Text(user['name']),
      trailing: ElevatedButton(
        onPressed: _toggleFollow,
        child: Text(isFollowing ? 'Unfollow' : 'Follow'),
      ),
    );
  }
}