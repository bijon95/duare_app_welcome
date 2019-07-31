import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_statusbarcolor/flutter_statusbarcolor.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'cart.dart';


class SearchPage extends StatefulWidget {
 @override
  State<StatefulWidget> createState() =>_SearchPageState();
}
class _SearchPageState extends State<SearchPage> {

  List<ItemList> _notes = List<ItemList>();
  List<ItemList> _notesForDisplay = List<ItemList>();

  Future<List<ItemList>> fetchNotes() async{

    String url = "http://duare.net/api/item_list.php";

    var response= await http.get(url);//collect data from url

    var notes = List<ItemList>();

    if (response.statusCode == 200) {
      var notesJson = json.decode(response.body);
      for (var noteJson in notesJson) {
        notes.add(ItemList.fromJson(noteJson));
      }
    }
    return notes;
  }
  void _increment()
  {
    _counter++;
  }


  int _counter= 0;
  @override
  void initState() {
    // TODO: implement initState
    fetchNotes().then((value){
     setState((){
       _notes.addAll(value);
       _notesForDisplay = _notes;
     });
   });
    super.initState();


  }


  @override
  Widget build(BuildContext context) {
    FlutterStatusbarcolor.setStatusBarColor(Colors.black);
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter listview with json'),
      ),
      body:  ListView.builder(
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return index == 0 ? _searchBar() : _listItem(index-1);
        },
        itemCount: _notesForDisplay.length+1,
      ),


      bottomNavigationBar: BottomNavigationBar(
          items: [

            BottomNavigationBarItem(
                icon: Image.asset('images/home.png', height: 20.0, width: 30.0,),
                title: Text('Home',style: TextStyle(color: Colors.grey))
            ),
            BottomNavigationBarItem(
                icon: Image.asset('images/search.png', height: 20.0, width: 30.0,),
                title: Text('Search',style: TextStyle(color: Colors.blueAccent),)

            ),

          ]

      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      floatingActionButton: FloatingActionButton(

        tooltip: 'Increment',
        child: Image.asset('images/cart.png',
          height: 20.0, width: 30.0,
        ),
        backgroundColor: Colors.blueAccent,
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(
              builder: (context)=>CartPage()));
        },
      ), // This trailing comma makes auto-formatting nicer for build methods.

    );





  }
  _searchBar() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        decoration: InputDecoration(
            hintText: 'Search...'
        ),
        onChanged: (text) {
          text = text.toLowerCase();
          setState(() {
            _notesForDisplay = _notes.where((note) {
              var noteTitle = note.name.toLowerCase() ;
              return noteTitle.contains(text);
            }).toList();
          });
        },
      ),
    );
  }

  _listItem(index) {
    var name = _notesForDisplay[index].name ?? ''; //condtion null
    var img = _notesForDisplay[index].img ?? "";//condtion null
    var rname = _notesForDisplay[index].rname ?? "";
    var price = _notesForDisplay[index].price ?? '';
    var desc = _notesForDisplay[index].desc ?? '';
    return Card(
      child: Padding(
        padding: const EdgeInsets.only(top: 32.0, bottom: 32.0, left: 16.0, right: 16.0),
        child: Column(

          children: <Widget>[
            new ExpansionTile(
              title: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment:
                CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    name,
                    style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w500),
                  ),

                  Text(
                    rname,
                    style: TextStyle(
                        fontSize: 14,
                        color: Colors.black45),
                  ),


                  Text(
                    price+"৳",
                    style: TextStyle(
                        fontSize: 17,
                        color: Colors.blueAccent),
                  ),
                ],
              ),
//                                      subtitle: Text(data[index]["item_des"]),
              trailing: new Container(
                height: 70,
                width: 120,
                child: new ClipRRect(
                  borderRadius: BorderRadius.circular(5),
                  child: FadeInImage(image: NetworkImage("http://duare.net/restaurant/uploads/restaurant/"+img),
                      placeholder: AssetImage('images/food_bg.jpg'),
                      fit: BoxFit.fill),
                ),
              ),
              children: <Widget>[

                Container(
                  margin: EdgeInsets.fromLTRB(0,20,0,0),
                  child: Wrap(
                    spacing: 128,
                    children: <Widget>[
                      Container(
                        width: 120,
                        child:  Row(
                            children: <Widget>[

                              _counter!=0?
                              new  IconButton(icon:
                              new Icon(Icons.remove),
                                onPressed: ()=>setState(()=>_counter--),):
                              new Container(),
                              new Text(_counter.toString()),
                              new IconButton(icon:
                              new Icon(Icons.add),
                                  onPressed: ()=>setState(()=>_counter++))]

                        ),
                      ),
                      Container(
                        width: 130,
                        child: RaisedButton(
                          child: Text('ADD TO ORDER'),
                          color: Color.fromRGBO(33, 75, 144, 10),
                          textColor: Colors.white,
                          padding: EdgeInsets.fromLTRB(
                              10, 10, 10, 10),
                          splashColor: Colors.grey,
                          onPressed: ()
                          {
                            setState(() {
                              _increment();
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
            Container(
              padding: EdgeInsets.fromLTRB(20, 5, 20, 5),
              child: Divider(
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }

}
//class userDetails extends StatelessWidget{
//
//  userList user;
//  userDetails(this.user);
//  @override
//  Widget build(BuildContext context) {
//
//    return Scaffold(
//      appBar: AppBar(
//        title: Text(user.name),
//      ),
//      body: Center(
//        child: Text(user.rating),
//      ),
//    );
//  }
//
//}

class Note {
  String title;
  String text;

  Note(this.title, this.text);

  Note.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    text = json['text'];
  }
}

class ItemList{

   String  id ,name, type, img, desc, price, rname;
  ItemList(  this.id, this.name, this.type, this.img, this.desc, this.price, this.rname);
  ItemList.fromJson(Map<String, dynamic> json){
    id = json['item_id'];
    name = json['item_name'];
    type = json['product_type'];
    img = json['i_image'];
    desc  = json['i_description'];
    price = json["i_price"];
   rname = json['r_name'];
  }
}

