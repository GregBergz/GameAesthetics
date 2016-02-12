//-----------------------------------------------------------------------------------------------------------
// GAME AESTHETICS: C++ Text Parser Part 3
//-----------------------------------------------------------------------------------------------------------
#include <iostream>
#include <cctype>
#include <string>

using namespace std;

class Verb {
public:
	string word;
	string action;	
};

class Noun {
public:
	string word;
	string subject;	
};


int main() {

	//nounList and verbList setup
	Verb verbList[100][5];	
	Noun nounList[100][5];		// a 2D array to store verbs
	//fill the array of verbs with blank values
	for (int row = 0; row < 100; row++) {
		for (int col = 0; col < 5; col++) {
			verbList[row][col].word = "NA";
			verbList[row][col].action = "NA";	
			nounList[row][col].word = "NA";
			nounList[row][col].subject = "NA";	
		}
	}

	// SETTING ACTION TYPES

	for (int col = 0; col < 5; col++) {
		verbList[0][col].action = "LOOK";	
		verbList[1][col].action = "TALK";	
		verbList[2][col].action = "USE";	
		verbList[3][col].action = "GO";	
		verbList[4][col].action = "TAKE";	
		verbList[5][col].action = "EAT";	
		verbList[6][col].action = "CLIMB";	
		verbList[7][col].action = "DANCE";	
		verbList[8][col].action = "FIGHT";	
		verbList[9][col].action = "EQUIP";	

		nounList[0][col].subject = "NORTH";	
		nounList[1][col].subject = "SOUTH";	
		nounList[2][col].subject = "EAST";	
		nounList[3][col].subject = "WEST";	
		nounList[4][col].subject = "UP";	
		nounList[5][col].subject = "DOWN";	
		nounList[6][col].subject = "INSIDE";	
		nounList[7][col].subject = "OUTSIDE";	
		nounList[8][col].subject = "SWORD";	
		nounList[9][col].subject = "HAT";
		nounList[10][col].subject = "SHIRT";	
		nounList[11][col].subject = "PANTS";
		nounList[12][col].subject = "BOOTS";	
		nounList[13][col].subject = "GLOVES";
		nounList[14][col].subject = "HELMET";
		nounList[15][col].subject = "SURROUNDINGS";
		nounList[16][col].subject = "POTION";	
		nounList[17][col].subject = "WATER";
		nounList[18][col].subject = "BREAD";	
		nounList[19][col].subject = "CAT";
		nounList[20][col].subject = "DOG";
		nounList[21][col].subject = "HORSE";	
		nounList[22][col].subject = "FROG";
		nounList[23][col].subject = "RAT";	
		nounList[24][col].subject = "PIG";
		nounList[25][col].subject = "COW";
		nounList[26][col].subject = "GOBLIN";	
		nounList[27][col].subject = "OGRE";
		nounList[28][col].subject = "SLIME";	
		nounList[29][col].subject = "DRAGON";
		nounList[30][col].subject = "BAT";
	}

//VERB LIST

	//LOOK
	verbList[0][0].word = "LOOK";	
	verbList[0][1].word = "VIEW";	
	verbList[0][2].word = "EXAMINE";	
	verbList[0][3].word = "STARE";	
	verbList[0][4].word = "WATCH";	
	verbList[0][5].word = "INSPECT";	

	//TALK
	verbList[1][0].word = "TALK";	
	verbList[1][1].word = "SAY";	
	verbList[1][2].word = "TELL";	
	verbList[1][3].word = "CHAT";	

	//USE
	verbList[2][0].word = "USE";	

	//GO
	verbList[3][0].word = "GO";	
	verbList[3][1].word = "WALK";	
	verbList[3][2].word = "TRAVEL";	
	verbList[3][3].word = "EXIT";	
	verbList[3][4].word = "ENTER";	
	verbList[3][5].word = "LEAVE";	

	//TAKE
	verbList[4][0].word = "TAKE";	
	verbList[4][1].word = "PICK";	
	verbList[4][2].word = "PICKUP";	
	verbList[4][3].word = "OBTAIN";	
	verbList[4][4].word = "GRAB";	
	verbList[4][5].word = "STEAL";	

	//EAT
	verbList[5][0].word = "EAT";	
	verbList[5][1].word = "DRINK";	
	verbList[5][2].word = "CONSUME";	


	//CLIMB
	verbList[6][0].word = "CLIMB";	
	verbList[6][1].word = "SCALE";	
	verbList[6][2].word = "ASCEND";	


	//DANCE
	verbList[7][0].word = "DANCE";	
	verbList[7][1].word = "BOOGIE";	
	verbList[7][2].word = "PRANCE";	


	//FIGHT
	verbList[8][0].word = "FIGHT";	
	verbList[8][1].word = "ATTACK";	
	verbList[8][2].word = "BATTLE";	


	//EQUIP
	verbList[9][0].word = "EQUIP";	
	verbList[9][1].word = "WEAR";	


//NOUN LIST


	//NORTH
	nounList[0][0].word = "NORTH";	
	nounList[0][1].word = "NORTHWARD";
	nounList[0][2].word = "AHEAD";
	nounList[0][3].word = "FORWARD";	
	nounList[0][4].word = "FORWARDS";

	//SOUTH
	nounList[1][0].word = "SOUTH";	
	nounList[1][1].word = "SOUTHWARD";
	nounList[1][2].word = "BEHIND";
	nounList[1][3].word = "BACKWARD";
	nounList[1][4].word = "BACKWARDS";

	//EAST
	nounList[2][0].word = "EAST";	
	nounList[2][1].word = "EASTWARD";	
	nounList[2][2].word = "RIGHT";

	//WEST
	nounList[3][0].word = "WEST";	
	nounList[3][1].word = "WESTWARD";
	nounList[3][2].word = "LEFT";

	//UP
	nounList[4][0].word = "UP";	
	nounList[4][1].word = "UPWARD";	
	nounList[4][2].word = "ABOVE";

	//DOWN
	nounList[5][0].word = "DOWN";	
	nounList[5][1].word = "DOWNWARD";
	nounList[5][2].word = "BELOW";

	//INSIDE
	nounList[6][0].word = "INSIDE";	
	nounList[6][1].word = "IN";	
	nounList[6][2].word = "RIGHT";
	nounList[7][2].word = "ENTER";

	//OUTSIDE
	nounList[7][0].word = "OUTSIDE";	
	nounList[7][1].word = "OUT";
	nounList[7][2].word = "EXIT";
	nounList[7][2].word = "LEAVE";

	//SWORD
	nounList[8][0].word = "SWORD";	
	nounList[8][1].word = "BLADE";	

	//HAT
	nounList[9][0].word = "HAT";	
	nounList[9][1].word = "CAP";

	//SHIRT
	nounList[10][0].word = "SHIRT";	

	//PANTS
	nounList[11][0].word = "PANTS";	
	nounList[11][1].word = "LEGGINGS";
	nounList[11][2].word = "JEANS";

	//BOOTS
	nounList[12][0].word = "BOOTS";	
	nounList[12][1].word = "SHOES";

	//GLOVES
	nounList[13][0].word = "GLOVES";	

	//HELMET
	nounList[14][0].word = "HELMET";	
	nounList[14][1].word = "HELM";


	//SURROUNDINGS
	nounList[15][0].word = "SURROUNDINGS";	
	nounList[15][1].word = "AROUND";

	//POTION
	nounList[16][0].word = "POTION";	
	nounList[16][1].word = "CONCOTION";
	nounList[16][2].word = "BREW";
	nounList[16][3].word = "VIAL";

	//WATER
	nounList[17][0].word = "WATER";	

	//BREAD
	nounList[18][0].word = "BREAD";	
	nounList[18][1].word = "ROLL";
	nounList[18][2].word = "LOAF";

	//CAT
	nounList[19][0].word = "CAT";	
	nounList[19][1].word = "KITTEN";
	nounList[19][2].word = "KITTY";
	nounList[19][3].word = "FELINE";

	//DOG
	nounList[20][0].word = "DOG";	
	nounList[20][1].word = "PUPPY";
	nounList[20][2].word = "HOUND";
	nounList[20][3].word = "CANINE";

	//HORSE
	nounList[21][0].word = "HORSE";	
	nounList[21][1].word = "PONY";
	nounList[21][2].word = "STEED";
	nounList[21][3].word = "STALLION";
	nounList[21][4].word = "MOUNT";
	nounList[21][5].word = "EQUINE";
	nounList[21][6].word = "HORSEY";

	//FROG
	nounList[22][0].word = "FROG";	
	nounList[22][1].word = "TOAD";
	nounList[22][2].word = "BULLFROG";

	//RAT
	nounList[23][0].word = "RAT";	
	nounList[23][1].word = "MOUSE";
	nounList[23][2].word = "RODENT";
	nounList[23][3].word = "VERMIN";

	//PIG
	nounList[24][0].word = "PIG";	
	nounList[24][1].word = "BOAR";
	nounList[24][2].word = "HOG";
	nounList[24][3].word = "PIGLET";
	nounList[24][4].word = "SWINE";

	//COW
	nounList[25][0].word = "COW";	
	nounList[25][1].word = "CALF";
	nounList[25][2].word = "BOVINE";
	nounList[25][3].word = "CATTLE";

	//GOBLIN
	nounList[26][0].word = "GOBLIN";	
	nounList[26][1].word = "GREMLIN";

	//OGRE
	nounList[27][0].word = "OGRE";	
	nounList[27][1].word = "TROLL";
	nounList[27][2].word = "GIANT";

	//SLIME
	nounList[28][0].word = "SLIME";	
	nounList[28][1].word = "JELLY";
	nounList[28][2].word = "OOZE";

	//DRAGON
	nounList[29][0].word = "DRAGON";	
	nounList[29][1].word = "DRAKE";

	//BAT
	nounList[30][0].word = "BAT";	



	string command;
  	cout << "Type a command: ";
  	getline (cin,command);
  	cout << "\n";
	for (int i = 0; i < command.size(); i++) {
		command.at(i) = toupper(command.at(i));
	}
	cout << "Converted command to all caps: " << command << endl;

	string word1 = "";
	string word2 = "";
	string action1 = "";
	string action2 = "";
	string subject1 = "";
	string subject2 = "";

	char c;	//we'll use c to store the current character and see if its a space.
	for (int i = 0; i < command.size(); i++) {
		c = command.at(i);	//get the current character,
		if (isspace(c) && word1 != "") { //if the character is a space and word1 isn't empty,
			break;	//break out of the for loop.
		} 
		if (!isspace(c)) {  //if its a letter, 
			word1 += c;     //add the char to word1. we can use += here! 
		} 
	}

	//here we'll loop again, but starting from the end of word1!
	for (int i = word1.size(); i < command.size(); i++) {
		c = command.at(i);
		if (!isspace(c)) { //if the character isn't a space, add it to word 2.
			word2 += c;
		} 
	}


	for (int row = 0; row < 100; row++) {
		for (int col = 0; col < 5; col++) {

			if(nounList[row][col].word != "NA"){
				if(nounList[row][col].word == word1){
					subject1=nounList[row][col].subject;
				}	
				if(nounList[row][col].word == word2){
					subject2=nounList[row][col].subject;
				}	
			}

			if(verbList[row][col].word != "NA"){
				if(verbList[row][col].word == word1){
					action1=verbList[row][col].action;
				}	
				if(verbList[row][col].word == word2){
					action2=verbList[row][col].action;
				}	
			}

		}
	}




	cout << "word 1 is: " << word1 << endl;
	cout << "word 2 is: " << word2 << endl;
	cout << "action: " << action1 << " " << action2 << endl;
	cout << "subject: " << subject1 << " " << subject2 << endl;

	return 0;
}