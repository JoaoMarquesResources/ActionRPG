/// @description Drop fragments & itens
// You can write your code in this editor
if (entityFragmentCont > 0)
{
	fragmentArray = array_create(entityFragmentCont, entityFragment);
	DropItems(x, y, fragmentArray);
}

if (entityDropList != -1)
{
	DropItems(x, y, entityDropList);
}