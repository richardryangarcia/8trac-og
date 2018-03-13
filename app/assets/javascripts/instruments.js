//= require pages-plugins/nvd3/lib/d3.v3
//= require pages-plugins/nvd3/nv.d3.min
//= require pages-plugins/nvd3/src/utils
//= require pages-plugins/nvd3/src/tooltip
//= require pages-plugins/nvd3/src/interactiveLayer
//= require pages-plugins/nvd3/src/models/axis
//= require pages-plugins/nvd3/src/models/line
//= require pages-plugins/nvd3/src/models/lineWithFocusChart

/*
 Widget specific JS (ie: init scripts of
 plugins used in the widget) go here
 */

// line chart
(function() {
    //NVD3 Charts
    d3.json('http://revox.io/json/charts.json', function(data) {
        nv.addGraph(function() {
            var chart = nv.models.lineChart()
                .x(function(d) {
                    return d[0]
                })
                .y(function(d) {
                    return d[1]
                })
                .color([
                    $.Pages.getColor('success'),
                    $.Pages.getColor('danger'),
                    $.Pages.getColor('primary'),
                    $.Pages.getColor('complete'),

                ])
                .showLegend(false)
                .margin({
                    left: 30,
                    bottom: 35
                })
                .useInteractiveGuideline(true);

            chart.xAxis
                .tickFormat(function(d) {
                    return d3.time.format('%a')(new Date(d))
                });

            chart.yAxis.tickFormat(d3.format('d'));

            d3.select('.nvd3-line svg')
                .datum(data.nvd3.line)
                .transition().duration(500)
                .call(chart);

            nv.utils.windowResize(chart.update);

            $('.nvd3-line').data('chart', chart);

            return chart;
        });
    });
})();
