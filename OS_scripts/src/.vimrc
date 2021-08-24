function! MyBallonExpr()
	return system("trans :ru -b ". v:beval_text)
endfunction

set bexpr=MyBallonExpr()
set ballooneval
set balloondelay=100
