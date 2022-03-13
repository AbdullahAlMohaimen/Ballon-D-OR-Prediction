ACCEPT P PROMPT "Find a Player: ";


declare 
	A Ballon_Dor.Name%Type;
Begin
	A:='&P';
	FindPlayer(A);
end;
/