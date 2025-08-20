extends Resource 

class_name Item
@export var name : String
@export var sprite : Texture2D
@export var type : ITEM_TYPE 

## buyable things,enemies, other kinds of destruction
enum ITEM_TYPE { ITEM_FUEL,ITEM_OXYGEN,ITEM_TEMPERATURE,ITEM_MONEY,ITEM_ENEMY}