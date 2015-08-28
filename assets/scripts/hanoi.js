define(function(){
	var hanoi = function(n,A,B,C){
		if(n == 1){
			console.log('Move\t'+n+'\tfrom\t'+A+'\tto\t'+C);
		}else{
			hanoi(n-1,A,C,B);
			console.log('Move\t'+n+'\tfrom\t'+A+'\tto\t'+C);
			hanoi(n-1,B,A,C);
		}

	};

	return {
		fn : hanoi
	}
});