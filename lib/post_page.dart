import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task6/cubit/post_cubit/post_cubit.dart';
import 'package:task6/cubit/post_cubit/post_state.dart';

class PostPage extends StatefulWidget {
  const PostPage({super.key});

  @override
  State<PostPage> createState() => _PostPageState();
}

class _PostPageState extends State<PostPage> {
  @override
  void initState() {
    context.read<PostCubit>().upLoadPost();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PostCubit, PostState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(title: Text("PostPage")),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              children: [
                if (state is LoadingPostStatae)
                  Center(child: CircularProgressIndicator()),
                if (state is SucsessPostStatae)...[       
                  Expanded(
                    child: ListView.builder(
                      padding: EdgeInsets.symmetric(vertical: 10),
                      physics: BouncingScrollPhysics(),
                      itemBuilder: (context, index) {
                         print(state);
                        return Card(
                          child: Column(
                            children: [
                              Container(
                                clipBehavior: Clip.antiAlias,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Image.network(
                                  state.products[index]["thumbnail"],
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Text(
                                "${state.products[index]["title"]}",
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(),
                              ),
                              Text(
                                "${state.products[index]["description"]}",
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(color: Colors.grey),
                              ),
                            ],
                          ),
                        );
                      },
                      itemCount: state.products.length,
                    ),
                  ),],
       
                if (state is ErrorPostStatae) Center(child: Text(state.error)),
              ],
            ),
          ),
        );
      },
    );
  }
}
