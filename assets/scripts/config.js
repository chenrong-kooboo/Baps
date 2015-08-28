var hostname = 'http://' + window.location.host;

require.config({
	paths: {
		'jquery':hostname + '/static/public/scripts/jquery-1.11.1',
		'slider':hostname + '/static/public/scripts/jquery/jquery.slide'
	},
	waitSeconds: 10
});