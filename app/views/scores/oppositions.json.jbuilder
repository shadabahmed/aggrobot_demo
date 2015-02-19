json.chart do
    json.type 'column'
end
json.title do
    json.text 'Runs Against All Oppositions'
end
json.subtitle do
    json.text 'Source: Random Data'
end
json.tooltip do
    json.valueSuffix ' innings'
end

json.plotOptions do
    json.bar do
        json.dataLabels do
           json.enabled true
        end
    end
end

json.legend do
    json.layout 'vertical'
    json.align  'right'
    json.verticalAlign 'top'
    json.x -40
    json.y 100
    json.floating true
    json.borderWidth 1
    json.backgroundColor '#FFFFFF'
    json.shadow true
end

json.credit do
    json.enabled false
end

json.set! :series, @series.collect{|k,v| {name: k, data: v.collect{|x| x[:count]}}}

json.xAxis do
    json.set! :categories, @series.values.first.collect{|x| x[:name]}

    json.title do
        json.text 'Runs'
    end
end

json.yAxis do
    json.min 0
    json.title do
        json.text 'Innings'
        json.align 'high'
    end
    json.labels do
        json.overflow 'justify'
    end
end



