(function($) {
	$.fn.longPress = function(options) {
		var log = "Long Press Plugin v1.0\n"; // 'options:' + JSON.stringify(options,null,4) + '\n arguments' + JSON.stringify(arguments,null,4) + '\n';
		var tf = hf = cf = true;
		var settings = {
			duration: 500,
			useCapture: false,
			handler: function(e) { e.stopPropagation(); },
		};
		var timer = null;
		var cancel = function() {
			clearTimeout(timer);
			timer = null;
			return false;
		};
		var start = function(e) {
			if (e.type === "click" && e.button !== 0) {
				return; };
			var targ;
			if (e.target) { targ = e.target; } else if (e.srcElement) { targ = e.srcElement; }
			if (targ.nodeType == 3) { targ = targ.parentNode; }
			timer = setTimeout(function() {
				targ.dispatchEvent(new Event('longPress', { bubbles: true, cancelable: true }));
			}, settings.duration);
			return false;
		};
		if (arguments[0] !== null && typeof arguments[0] !== "object") {
			log += 'using arguments\n';
			for (var i = arguments.length - 1; i >= 0; i--) {
				var arg = arguments[i];
				if (typeof arg === "number") {
					settings.duration = arg;
					tf = false;
				} else if (typeof arg === "function") {
					settings.handler = arg;
					hf = false;
				} else if (typeof arg === "boolean") {
					settings.useCapture = arg;
					cf = false;
				}
			}
			if (tf) log += 'not passed : duration in arguments\n';
			if (hf) log += 'not passed : handler in arguments\n';
			if (cf) log += 'not passed : useCapture in arguments\n';
		} else if (typeof options === "object") {
			log += 'using options\n';
			if (options.handler || options.duration || options.useCapture) settings = $.extend(settings, options);
			if (!options.duration) { log += 'not passed : duration in options\n'; }
			if (!options.handler) { log += 'not passed : handler in options\n'; }
			if (options.useCapture === undefined) { log += 'not passed : useCapture in options\n'; }
		}

		log += '-----settings-----';
		log += '\nuseCapture: ' + settings.useCapture;
		log += '\nduration: ' + settings.duration;
		log += '\nhandler: ' + settings.handler;

		console.log(log);

		return this.each(function() {
			this.addEventListener('mouseup', cancel, settings.useCapture);
			this.addEventListener('mouseout', cancel, settings.useCapture);
			this.addEventListener('mousedown', start, settings.useCapture);
			this.addEventListener('touchstart', start, settings.useCapture);
			this.addEventListener('touchend', cancel, settings.useCapture);
			this.addEventListener('touchleave', cancel, settings.useCapture);
			this.addEventListener('touchcancel', cancel, settings.useCapture);
			this.addEventListener('longPress', settings.handler, settings.useCapture);
		});
	};
}(jQuery));
