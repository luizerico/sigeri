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

function columnChart(divChart, dbData, exlink, labels, yLabel) {
    var tooltip = d3.select("body").append("div")
            .attr("class", "tooltip");

    var margin = {top: 20, right: 2, bottom: 5, left: 20};

    var width = $("#" + divChart).width() - margin.left - margin.right,
            height = width / 3 - margin.top - margin.bottom;

    console.log(height + " - " + width);

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
                return parseInt(d.value);
            })]);

        svg.selectAll(".column")
                .data(data)
                .enter().append("a")
                .attr("xlink:href", function (d) {
                    return exlink + d.id;
                })
                .append("rect")
                .attr("class", "column")
                //.attr("fill", "steelblue")
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
                .attr("class", "y axis")
                .call(yAxis)
                .append("text")
                .attr("transform", "rotate(-90)")
                .attr("y", 6)
                .attr("dy", ".70em")
                .style("text-anchor", "end")
                .text(yLabel);


        var label = svg.append("g")
                .attr("class", "x axis")
                .attr("transform", "translate(0," + height + ")")
                .call(xAxis)
                .selectAll("text")
                .attr("display", function (d) {
                    if (labels) {
                        return 1;
                    }
                    else {
                        return "none";
                    }
                })
                .style("text-anchor", "start")
                .attr("dx", 3)
                .attr("dy", -4)
                .attr("transform", "rotate(-90)");

        if (labels) {
            margin.top = 5;
            svg.append("g")
                    .append("text")
                    .style("text-anchor", "end")
                    .style("font-weight", "bold")
                    .style("fill", "#666")
                    .attr("transform", "translate(" + (width - 10) + ", -10)")
                    .text("Label On")
                    .on("click", function (d) {
                        if (label.attr("display") === "none") {
                            label.attr("display", "on");
                            d3.select(this).text("Label On");
                        }
                        else {
                            label.attr("display", "none");
                            d3.select(this).text("Label Off")
                        }
                        ;
                    });
        }
    });

//    function type(d) {
//        d.value = +d.value; // coerce to number
//        return d;
//    }
}

function multicolumnChart(divChart, dbData, mfield, exlink, labels, yLabel) {
    var tooltip = d3.select("body").append("div")
            .attr("class", "tooltip");

    var margin = {top: 20, right: 2, bottom: 5, left: 20};

    var width = $("#" + divChart).width() - margin.left - margin.right,
            height = width / 3 - margin.top - margin.bottom;

    console.log(height + " - " + width);

    var x = d3.scale.ordinal().rangeRoundBands([0, width], .01);
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
                console.log(mfield[0]);
                return mfield[0] + mfield[1];
            })]);

        // Convert JSON data to stack format 
        var stack = d3.layout.stack();

        var fields = d3.keys(data[0])
                .filter(function (key) {
                    return (key === mfield[0] || key === mfield[1]);
                });

        var name = data.map(function (d) {
            return d.name;
        });

        var dataset = stack(d3.range(fields.length).map(function (d) {
            var a = [];
            for (var i = 0; i < data.length; ++i) {
                a[i] = {x: i, y: data[i][fields[d]]};
            }
            return a;
        }));

        var xScale = d3.scale.ordinal()
                .domain(d3.range(dataset[0].length))
                .rangeRoundBands([0, width], 0.05);


        var yScale = d3.scale.linear()
                .domain([0, d3.max(dataset, function (d) {
                        return d3.max(d, function (d) {
                            return parseInt(d.y0) + parseInt(d.y);
                        });
                    })
                ]).range([height, 0]);

        var colors = d3.scale.category10();

        // Add a group for each row of data
        var groups = svg.selectAll("g")
                .data(dataset)
                .enter()
                .append("a")
                .attr("xlink:href", function (d, i) {
                    return exlink + data[i].id;
                })
                .append("g")
                .style("fill", function (d, i) {
                    return colors(i);
                });

        // Add a rect for each data value
        var rects = groups.selectAll("rect")
                .data(function (d) {
                    return d;
                })
                .enter()
                .append("rect")
                .attr("x", function (d, i) {
                    return xScale(i);
                })
                .attr("y", function (d) {
                    return yScale(parseInt(d.y0) + parseInt(d.y));
                })
                .attr("height", function (d) {
                    return height - yScale(d.y);
                })
                .attr("width", xScale.rangeBand())
                .on("mouseover", function (d, i) {
                    tooltip.transition()
                            .duration(200)
                            .style("opacity", 1);
                    tooltip.html(
                            "Name: " + data[i].name +
                            "</br>"+mfield[0]+": " + data[i][mfield[0]] +
                            "</br>"+mfield[1]+": " + data[i][mfield[1]])
                            .style("left", (d3.event.pageX) + "px")
                            .style("top", (d3.event.pageY - 40) + "px");
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
        ;
//
//        var xAxis = d3.svg.axis()
//                .scale(x)
//                .orient("bottom");
//
//        var yAxis = d3.svg.axis()
//                .scale(yScale)
//                .orient("left");

//        svg.append("g")
//                .attr("class", "x axis")
//                .attr("transform", "translate(0," + height + ")")
//                .call(xAxis);

        svg.append("g")
                .attr("class", "y axis")
                .call(yAxis)
                .append("text")
                .attr("transform", "rotate(-90)")
                .attr("y", 6)
                .attr("dy", ".70em")
                .style("text-anchor", "end")
                .text(yLabel);

        var label = svg.append("g")
                .attr("class", "x axis")
                .attr("transform", "translate(0," + height + ")")
                .call(xAxis)
                .selectAll("text")
                .attr("display", function (d) {
                    if (labels) {
                        return 1;
                    }
                    else {
                        return "none";
                    }
                })
                .style("text-anchor", "start")
                .attr("dx", 3)
                .attr("dy", -4)
                .attr("transform", "rotate(-90)");

        if (labels) {
            margin.top = 5;
            svg.append("g")
                    .append("text")
                    .style("text-anchor", "end")
                    .style("font-weight", "bold")
                    .style("fill", "#666")
                    .attr("transform", "translate(" + (width - 10) + ", -10)")
                    .text("Label On")
                    .on("click", function (d) {
                        if (label.attr("display") === "none") {
                            label.attr("display", "on");
                            d3.select(this).text("Label On");
                        }
                        else {
                            label.attr("display", "none");
                            d3.select(this).text("Label Off");
                        }
                        ;
                    });
        }
    });
}