/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

function piechart(divChart, dbData, labels, title) {
    var tooltip = d3.select("body").append("div")
            .attr("class", "tooltip");

    var margin = {top: 20, right: 20, bottom: 30, left: 40};

    width = $("#" + divChart).width() - margin.left - margin.right,
            height = width * 4 / 7 - margin.top - margin.bottom,
            radius = Math.min(width, height) / 2;

    var color = d3.scale.category20();

    var arc = d3.svg.arc()
            .outerRadius(radius - 10)
            .innerRadius(radius - (radius / 2));

    var labelArc = d3.svg.arc()
            .outerRadius(radius)
            .innerRadius(radius);

    var pie = d3.layout.pie()
            .sort(null)
            .value(function (d) {
                return d.value;
            });

    var svg = d3.select("#" + divChart).append("svg")
            .attr("width", width)
            .attr("height", height)
            .append("g")
            .attr("transform", "translate(" + width / 2 + "," + height / 2 + ")");

    d3.json(dbData, function (error, data) {
        if (error)
            throw error;
        var g = svg.selectAll(".arc")
                .data(pie(data))
                .enter()
                .append("g")
                .attr("class", "arc")
                .style("opacity", ".75")
                .on("mouseover", function (d) {
                    d3.select(this)
                            .style("stroke-width", '2px')
                            .style("opacity", "1");
                    tooltip.transition()
                            .duration(200)
                            .style("opacity", 1);
                    tooltip.html(
                            "Type: " + d.data.name +
                            "</br>Value: " + d.data.value)
                            .style("left", (d3.event.pageX) + "px")
                            .style("top", (d3.event.pageY - 28) + "px");
                })
                .on("mouseout", function (d) {
                    d3.select(this)
                            .style("stroke-width", '1px')
                            .style("opacity", ".75");
                    tooltip.transition()
                            .duration(500)
                            .style("opacity", 0);
                })
                .on("mousemove", function (d) {
                    tooltip.style("left", (d3.event.pageX + 3) + "px")
                            .style("top", (d3.event.pageY - 45) + "px");
                });

        g.append("path")
                .each(function (d) {
                    d.outerRadius = radius - 40;
                })
                .attr("d", arc)
                .style("fill", function (d, i) {
                    return color(i);
                });

        g.append("text")
                .attr("transform", function (d) {
                    return "translate(" + labelArc.centroid(d) + ")";
                })
                .attr("dy", ".35em")
                .style("opacity", function (d) {
                    if (labels)
                        return 1
                    else
                        return 0;
                })
                .text(function (d) {
                    return d.data.name + " - " + d.data.value;
                });


    });

    if (title) {
        var text = svg.append("text")
                .attr("text-anchor", "middle")
                //.attr("dy", "-.10em")
                .attr("class", "center")
                .text(title);
    }

    function type(d) {
        d.value = +d.value;
        return d;
    }

}

function columnChart(divChart, dbData, labels, title) {
    var tooltip = d3.select("body").append("div")
            .attr("class", "tooltip");

    var margin = {top: 2, right: 2, bottom: 5, left: 20};

    var width = $("#" + divChart).width() - margin.left - margin.right,
            height = width / 3 - margin.top - margin.bottom;


    var x = d3.scale.ordinal().rangeRoundBands([0, width], .1);
    var y = d3.scale.linear().range([height, 0]);

    var xAxis = d3.svg.axis()
            .scale(x)
            .orient("bottom");

    var yAxis = d3.svg.axis()
            .scale(y)
            .orient("left");

    var svg = d3.select("#" + divChart).append("svg")
            .attr("width", width + margin.left + margin.right)
            .attr("height", height + margin.top + margin.bottom)
            .append("g")
            .attr("transform", "translate(" + margin.left + "," + margin.top + ")");

    d3.json(dbData, function (data) {

        x.domain(data.map(function (d) {
            return d.name;
        }));

        y.domain([0, d3.max(data, function (d) {
                return d.value;
            })]);

        svg.selectAll(".column")
                .data(data)
                .enter().append("a")
                .attr("xlink:href", function (d) {
                    return "/risk/edit/" + d.id;
                })
                .append("rect")
                .attr("class", "bar")
                .attr("x", function (d) {
                    return x(d.name);
                })
                .attr("y", function (d) {
                    return y(d.value);
                })
                .attr("height", function (d) {
                    return height - y(d.value);
                })
                .attr("width", x.rangeBand())
                .on("mouseover", function (d) {
                    tooltip.transition()
                            .duration(200)
                            .style("opacity", 1);
                    tooltip.html(
                            "Name: " + d.name +
                            "</br>Value: " + d.value)
                            .style("left", (d3.event.pageX) + "px")
                            .style("top", (d3.event.pageY - 60) + "px");
                })
                .on("mouseout", function (d) {
                    tooltip.transition()
                            .duration(500)
                            .style("opacity", 0);
                })
                .on("mousemove", function (d) {
                    tooltip.style("left", (d3.event.pageX + 3) + "px")
                            .style("top", (d3.event.pageY - 45) + "px");
                });


        svg.append("g")
                .attr("class", "x axis")
                .attr("transform", "translate(0," + height + ")")
                .call(xAxis)
                .selectAll("text")
                .attr("opacity", function (d) {
                    if (labels) {
                        return 1;
                    }
                    else {
                        return 0;
                    }
                })
                .style("text-anchor", "start")
                .attr("dx", 3)
                .attr("dy", -4)
                .attr("transform", "rotate(-90)");


        svg.append("g")
                .attr("class", "y axis")
                .call(yAxis)
                .append("text")
                .attr("transform", "rotate(-90)")
                .attr("y", 6)
                .attr("dy", ".70em")
                .style("text-anchor", "end")
                .text("Impact x Likelihood");

    });

//    function type(d) {
//        d.value = +d.value; // coerce to number
//        return d;
//    }
}

