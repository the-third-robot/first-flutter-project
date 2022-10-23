import 'package:first_project/models/post.dart';
import 'package:first_project/services/remote_services.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //We want a list of post to be displayed
  List<Post>? posts;
  // a flag to check if the API response is loaded or not
  var isLoaded = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    getData();
  }
 getData() async {
    posts = await RemoteServices().getPosts();
    //got all the data into posts and then checked true if the data returned is not null
    if (posts != null){
      setState(() {
        isLoaded = true;
      });
    }
 }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MyApp'),
        actions: [
          ElevatedButton(onPressed: (){
            Navigator.of(context).pushNamed('/todo_list/');
          }, child: const Text('Create Todo List'))
        ],
      ),
      // to check if the future is visible or not
      body: Visibility(
        //Until isLoaded is false we're gonna get a loading view and once it's true we'll get the actual content
        visible: isLoaded,
        replacement: const Center(child: CircularProgressIndicator()),
        child: ListView.builder(
          //Now we will et the count to the posts?.length with null safety as the length could be null
          itemCount: posts?.length,
          itemBuilder:
            (context, index){
              return Container(
                padding: const EdgeInsets.all(16),
                child: Row(
                  children: [
                    Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: Colors.grey[300],
                      ),
                    ),
                    const SizedBox(width: 16,),
                    Expanded(
                      child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text( posts![index].title,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text( posts![index]?.body ?? '',
                            maxLines: 4,
                            overflow: TextOverflow.ellipsis,

                          ),
                        ],
                  ),
                    ),]
                ),
              );
            },
        ),
      ),
    );
  }
}
