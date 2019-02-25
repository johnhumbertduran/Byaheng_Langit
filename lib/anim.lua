local anim = {}

anim.appear = function ( obj )
	transition.to( obj, {alpha = 1, xScale = 1, yScale = 1, time = 200, transition = easing.outBack,
		onComplete = onComplete
		}
	 )
end

anim.fadeOut = function ( obj, onComplete )
	transition.fadeOut( obj, {time = 200, onComplete = onComplete } )	
end

anim.stop = function ( obj )
	if (obj) then
		transition.cancel( obj )
	else 
		transition.cancel(  )
	end
end

anim.pause = function ( obj )
	if (obj) then
		transition.pause( obj )
	else 
		transition.pause(  )
	end
end

anim.resume = function ( obj )
	if (obj) then
		transition.resume( obj )
	else 
		transition.resume(  )
	end
end

return anim