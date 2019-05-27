import 'package:flutter/material.dart';
import 'package:flutter_practice/pages/product_edit.dart';
import 'package:flutter_practice/scoped-models/main.dart';
import 'package:flutter_practice/scoped-models/products.dart';
import 'package:scoped_model/scoped_model.dart';

class ProductListPage extends StatelessWidget
{
	Widget _buildEditButton(BuildContext context, int index, ProductsModel model)
	{
		return IconButton(
			icon: Icon(Icons.edit),
			onPressed: ()
			{
				model.selectProduct(index);
				Navigator.of(context).push(
					MaterialPageRoute(
						builder: (BuildContext context)
						{
							return ProductEditPage();
						},
					),
				);
			},
		);
	}
	
	@override
	Widget build(BuildContext context)
	{
		return ScopedModelDescendant<MainModel>(
			builder: (BuildContext context, Widget child, MainModel model)
			{
				return ListView.builder(
					itemCount: model.products.length,
					itemBuilder: (BuildContext context, int index)
					{
						return Dismissible(
							key: Key(model.products[index].title),
							background: Container(
								color: Colors.red,
							),
							onDismissed: (DismissDirection direction)
							{
								model.selectProduct(index);
								model.deleteProduct();
							},
							child: Column(
								children: <Widget>[
									ListTile(
										leading: CircleAvatar(
											backgroundImage: AssetImage(
												model.products[index].image)),
										title: Text(
											model.products[index].title),
										subtitle: Text("\$" +
											model.products[index].price
												.toString()),
										trailing: _buildEditButton(context, index, model),
									),
									Divider(),
								],
							),
						);
					},
				);
			},
		);
	}
}
