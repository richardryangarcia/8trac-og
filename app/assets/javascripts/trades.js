//= require pages-plugins/nvd3/lib/d3.v3
//= require pages-plugins/nvd3/nv.d3.min
//= require pages-plugins/nvd3/src/utils
//= require pages-plugins/nvd3/src/tooltip
//= require pages-plugins/nvd3/src/interactiveLayer
//= require pages-plugins/nvd3/src/models/axis
//= require pages-plugins/nvd3/src/models/line
//= require pages-plugins/nvd3/src/models/lineWithFocusChart
//= require pages-plugins/rickshaw/rickshaw.js

/*
 Widget specific JS (ie: init scripts of
 plugins used in the widget) go here
 */

(function() {

    d3.json('http://revox.io/json/charts.json', function(data) {

        var container = '.widget-15-chart';

        var seriesData = [
            [],
            []
        ];
        var random = new Rickshaw.Fixtures.RandomData(40);
        for (var i = 0; i < 10; i++) {
            random.addData(seriesData);
        }

        var graph = new Rickshaw.Graph({
            renderer: 'bar',
            element: document.querySelector("#return_graph"),
            height: 200,
            padding: {
                top: 0.5
            },
            series: [{
                data: seriesData[0],
                color: $.Pages.getColor('complete-light'),
                name: "New users"
            }, {
                data: seriesData[1],
                color: $.Pages.getColor('master-lighter'),
                name: "Returning users"

            }]

        });

        var hoverDetail = new Rickshaw.Graph.HoverDetail({
            graph: graph,
            formatter: function(series, x, y) {
                var date = '<span class="date">' + new Date(x * 1000).toUTCString() + '</span>';
                var swatch = '<span class="detail_swatch" style="background-color: ' + series.color + '"></span>';
                var content = swatch + series.name + ": " + parseInt(y) + '<br>' + date;
                // var content = ""
                return content;
            }
        });

        graph.render();

        $(window).resize(function() {
            graph.configure({
                width: $(container).width(),
                height: 200
            });

            graph.render()
        });

        $(container).data('chart', graph);
    });
})();
