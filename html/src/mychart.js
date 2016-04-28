$('#add-btn').click(function() {
	myLineChart.addData([40], "August")
});

$('#rmv-btn').click(function() {
	myLineChart.removeData();
});

var data = {
    labels: ["January", "February", "March", "April", "May", "June", "July"],
    datasets: [
        {
            label: "My First dataset",
            fillColor: "rgba(220,220,220,0.2)",
            strokeColor: "rgba(220,220,220,1)",
            pointColor: "rgba(220,220,220,1)",
            pointStrokeColor: "#fff",
            pointHighlightFill: "#0ff",
            pointHighlightStroke: "rgba(220,220,220,1)",
            data: [65, 59, 80, 81, 16, 55, 40]
        }
    ]
};

var options = {
	scaleShowGridLines: true,
	bezierCurve: false,
	pointDot: true,
	pointDotRadius: 2,
	xAxes: [{
		display: false
	}]
};
var ctx = $("#canvas").get(0).getContext("2d");

var myLineChart = new Chart(ctx).Line(data, options);