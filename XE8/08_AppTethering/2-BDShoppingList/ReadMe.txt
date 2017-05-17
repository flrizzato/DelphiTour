Open TetherShopping.groupproj, Which contains two projects:

The VCL project (TetherDatabase) is a simple DB. Each time a item stock is under the minimalStock value, a shopping list is 
generated and is sent to all connected clients.

The Mobile project (TetherDBClient) is the client receiving the shopping list. You can buy 100 units of an item by pressing the 
button, and the change will be reflected on the VCL project and all the connected Clients.