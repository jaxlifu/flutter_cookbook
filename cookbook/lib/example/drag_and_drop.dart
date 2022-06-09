import 'package:flutter/material.dart';

const List<Item> _items = [
  Item(
    name: '小龙虾',
    totalPriceCents: 1299,
    uid: '1',
    imageProvider: NetworkImage(
        'https://i2.chuimg.com/bef322788b6711e6b87c0242ac110003_1440w_1080h.jpg?imageView2/2/w/660/interlace/1/q/90'),
  ),
  Item(
    name: 'Veggie Delight',
    totalPriceCents: 799,
    uid: '2',
    imageProvider: NetworkImage('https://flutter'
        '.dev/docs/cookbook/img-files/effects/split-check/Food2.jpg'),
  ),
  Item(
    name: 'Chicken Parmesan',
    totalPriceCents: 1499,
    uid: '3',
    imageProvider: NetworkImage('https://flutter'
        '.dev/docs/cookbook/img-files/effects/split-check/Food3.jpg'),
  ),
];
final List<Customer> _peoples = [
  Customer(
    name: 'Makayla',
    imageProvider: const NetworkImage('https://flutter'
        '.dev/docs/cookbook/img-files/effects/split-check/Avatar1.jpg'),
  ),
  Customer(
    name: 'Nathan',
    imageProvider: const NetworkImage('https://flutter'
        '.dev/docs/cookbook/img-files/effects/split-check/Avatar2.jpg'),
  ),
  Customer(
    name: 'Emilio',
    imageProvider: const NetworkImage('https://flutter'
        '.dev/docs/cookbook/img-files/effects/split-check/Avatar3.jpg'),
  ),
];

class Customer {
  Customer({
    required this.name,
    required this.imageProvider,
    List<Item>? items,
  }) : items = items ?? [];

  final String name;
  final ImageProvider imageProvider;
  final List<Item> items;

  String get formattedTotalItemPrice {
    final totalPriceCents =
        items.fold<int>(0, (prev, item) => prev + item.totalPriceCents);
    return '\$${(totalPriceCents / 100.0).toStringAsFixed(2)}';
  }
}

class Item {
  const Item({
    required this.name,
    required this.totalPriceCents,
    required this.uid,
    required this.imageProvider,
  });
  final String name;
  final int totalPriceCents;

  final String uid;
  final ImageProvider imageProvider;

  String get formattedTotalItemPrice =>
      '\$${(totalPriceCents / 100.0).toStringAsFixed(2)}';
}

class ExampleDragAndDrop extends StatefulWidget {
  const ExampleDragAndDrop({Key? key}) : super(key: key);

  @override
  State<ExampleDragAndDrop> createState() => _ExampleDragAndDropState();
}

class _ExampleDragAndDropState extends State<ExampleDragAndDrop>
    with TickerProviderStateMixin {
  final GlobalKey _draggableKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F7F7),
      appBar: _buildAppBar(),
      body: _buildContent(),
    );
  }

  PreferredSizeWidget _buildAppBar() => AppBar(
        iconTheme: const IconThemeData(color: Color(0xFFF64209)),
        title: Text(
          'Order Food',
          style: Theme.of(context).textTheme.headline4?.copyWith(
                fontSize: 36,
                color: const Color(0xFFF64209),
                fontWeight: FontWeight.bold,
              ),
        ),
        backgroundColor: const Color(0xFFF7F7F7),
        elevation: 0,
      );

  Widget _buildContent() => Stack(
        children: [
          SafeArea(
            child: Column(
              children: [
                Expanded(
                  child: _buildMenuList(),
                ),
                _buildPeopleRow(),
              ],
            ),
          ),
        ],
      );

  Widget _buildMenuList() => ListView.separated(
        padding: const EdgeInsets.all(16.0),
        itemCount: _items.length,
        separatorBuilder: (BuildContext context, int index) {
          return const SizedBox(height: 12.0);
        },
        itemBuilder: (BuildContext context, int index) {
          return _buildMenuItem(item: _items[index]);
        },
      );

  Widget _buildPeopleRow() => Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 8.0,
          vertical: 20.0,
        ),
        child: Row(
          children: _peoples.map(_buildPersonWithDropZone).toList(),
        ),
      );

  Widget _buildMenuItem({
    required Item item,
  }) =>
      LongPressDraggable<Item>(
        data: item,
        dragAnchorStrategy: pointerDragAnchorStrategy,
        feedback: DraggingListItem(
          dragKey: _draggableKey,
          photoProvider: item.imageProvider,
        ),
        child: MenuListItem(
          name: item.name,
          price: item.formattedTotalItemPrice,
          photoProvider: item.imageProvider,
        ),
      );

  Widget _buildPersonWithDropZone(Customer customer) => Expanded(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: DragTarget<Item>(
            builder: (context, candidateItems, rejectedItems) {
              return CustomerCart(
                customer: customer,
                hasItem: customer.items.isNotEmpty,
                highlighted: candidateItems.isNotEmpty,
              );
            },
            onAccept: (item) {
              _itemDroppedOnCustomerCart(item: item, customer: customer);
            },
          ),
        ),
      );

  void _itemDroppedOnCustomerCart({
    required Item item,
    required Customer customer,
  }) {
    setState(() {
      customer.items.add(item);
    });
  }
}

class CustomerCart extends StatelessWidget {
  const CustomerCart({
    Key? key,
    required this.customer,
    required this.highlighted,
    required this.hasItem,
  }) : super(key: key);

  final Customer customer;
  final bool highlighted;
  final bool hasItem;

  @override
  Widget build(BuildContext context) {
    final textColor = highlighted ? Colors.white : Colors.black;

    return Transform.scale(
      scale: highlighted ? 1.075 : 1.0,
      child: Material(
        elevation: highlighted ? 8.0 : 4.0,
        borderRadius: BorderRadius.circular(22.0),
        color: highlighted ? const Color(0xFFF64209) : Colors.white,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 12.0,
            vertical: 24.0,
          ),
          child: Column(
            children: <Widget>[
              SizedBox(
                width: 46,
                height: 46,
                child: Image(
                  image: customer.imageProvider,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 8.0),
              Text(
                customer.name,
                style: Theme.of(context).textTheme.subtitle1?.copyWith(
                      color: textColor,
                      fontWeight: hasItem ? FontWeight.normal : FontWeight.bold,
                    ),
              ),
              Visibility(
                visible: hasItem,
                maintainState: true,
                maintainAnimation: true,
                maintainSize: true,
                child: Column(
                  children: <Widget>[
                    const SizedBox(height: 4.0),
                    Text(
                      customer.formattedTotalItemPrice,
                      style: Theme.of(context).textTheme.caption?.copyWith(
                            color: textColor,
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                    const SizedBox(height: 4.0),
                    Text(
                      '${customer.items.length} item${customer.items.length != 1 ? 's' : ''}',
                      style: Theme.of(context).textTheme.subtitle1?.copyWith(
                            color: textColor,
                            fontSize: 12.0,
                          ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class DraggingListItem extends StatelessWidget {
  const DraggingListItem({
    Key? key,
    required this.dragKey,
    required this.photoProvider,
  }) : super(key: key);

  final GlobalKey dragKey;
  final ImageProvider photoProvider;

  @override
  Widget build(BuildContext context) {
    return FractionalTranslation(
      translation: const Offset(-0.5, -0.5),
      child: ClipRRect(
        key: dragKey,
        borderRadius: BorderRadius.circular(12.0),
        child: SizedBox(
          width: 150,
          height: 150,
          child: Opacity(
            opacity: 0.85,
            child: Image(
              image: photoProvider,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}

class MenuListItem extends StatelessWidget {
  const MenuListItem({
    Key? key,
    this.name = '',
    this.price = '',
    required this.photoProvider,
    this.isDepressed = false,
  }) : super(key: key);

  final String name;
  final String price;
  final ImageProvider photoProvider;
  final bool isDepressed;

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 12,
      borderRadius: BorderRadius.circular(20),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12.0),
              child: SizedBox(
                width: 120,
                height: 120,
                child: Center(
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.easeInOut,
                    height: isDepressed ? 115 : 120,
                    width: isDepressed ? 115 : 120,
                    child: Image(
                      image: photoProvider,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(width: 30.0),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: Theme.of(context).textTheme.subtitle1?.copyWith(
                          fontSize: 18.0,
                        ),
                  ),
                  const SizedBox(height: 10.0),
                  Text(
                    price,
                    style: Theme.of(context).textTheme.subtitle1?.copyWith(
                          fontWeight: FontWeight.bold,
                          fontSize: 18.0,
                        ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
