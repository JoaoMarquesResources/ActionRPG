// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function DialogueResponses(response){
	switch(response)
	{
		case 0: break;
		case 1: NewTextBox("You gave response A!", 1); break;
		case 2: NewTextBox("You gave response B! Any further response?", 1, ["3:Yes!", "0:No."]); break; //3:Yes se escolhermos esta resposta vai rodar o case3; 0:No vai rodar o case 0
		case 3: NewTextBox("Thanks for your responses!", 0); break;
		case 4:
		{
			NewTextBox("Thanks!", 2);
			NewTextBox("I think i left in that scary cave to the north east!", 2);
			global.questStatus[? "TheHatQuest"] = 1; //Case 1 no switch
		}break;
		case 5: NewTextBox(":(", 2); break;
		default: break;
	}
}