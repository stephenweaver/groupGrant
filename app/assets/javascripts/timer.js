var countdown = function(end, title) {
	elements = ['Week', 'Day','Hour','Minute','Second'];
	document.getElementById('title').innerHTML = title; 

	var   _second = 1000,
	      _minute = _second * 60,
	      _hour   = _minute * 60,
	      _day    = _hour   * 24;

        if(end == 'custom') {
        	console.log(document.getElementById('custom').value);
          var end = new Date(document.getElementById('custom').value);
        } else {
       		var end = new Date(end);
     		}

        calculate = function() {
       
          var now = new Date(),
          remaining = end.getTime() - now.getTime(),
          data;

          if(isNaN(end)) {
          	clearInterval(countdown.timer);
            console.log('Invalid date/time');
            if(title == 'Custom')
            	document.getElementById('title').value = 'Custom is Invalid'

            return
          }  
          if(remaining <= 0) {
             clearInterval(countdown.timer);

             if(typeof callback === 'function') {
             		callback(end, elements);
             }
          } else {
						data = { 
               'Week': Math.floor(remaining / _day / 7),
               'Day': Math.floor((remaining / _day) % 7),
               'Hour': Math.floor((remaining % _day ) / _hour),
               'Minute': Math.floor((remaining % _hour) / _minute),
               'Second': Math.floor((remaining % _minute) / _second)
            }

            if(elements.length) {
            	for(x in elements) {
            		var x = elements[x];
            		data[x] = (data[x]);
            		document.getElementById(x).innerHTML = data[x];
            		document.getElementById(x + '_label').innerHTML = x
            		if(data[x] == '01') {
            			document.getElementById(x + '_plural').innerHTML = '' 
            		} else {
            			document.getElementById(x + '_plural').innerHTML = 's' 
            		}
            	}
            }
          }            
       };

    calculate();
   	clearInterval(countdown.timer);
    countdown.timer = setInterval(calculate, _second);
};

var callback = function(end, elements) {
	document.getElementById('Week').innerHTML = end + ' is in the past!';

	data = {
       'Week': end + ' is in the past!',
       'Day': "",
       'Hour': "",
       'Minute': "",
       'Second':""
  }

  if(elements.length) {
  	for(x in elements) {
  		var x = elements[x];
  		document.getElementById(x).innerHTML = data[x];
  		document.getElementById(x + '_plural').innerHTML = '' ;
  		document.getElementById(x + '_label').innerHTML = '' 
  	}
  }       
}

var validate = function() {
	var temp = document.getElementById('custom').value;
	if(!isNaN(new Date(temp))) {
			countdown(temp, 'Custom');
	}
};
