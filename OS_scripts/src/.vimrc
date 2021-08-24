function! MyBallonExpr()
	return system("t ". v:beval_text)
endfunction

set bexpr=MyBallonExpr()
set ballooneval
set balloondelay=100
