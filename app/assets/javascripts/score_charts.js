var ScoreCharts = (function () {
   var exports = {};

    exports.plot = function(data){
        $('#container').highcharts(data);
    }

    return exports;
})();

