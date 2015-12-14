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

function columnchart(divChart, dbData, exlink, labels, yLabel) {
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
                            "</br>" + mfield[0] + ": " + data[i][mfield[0]] +
                            "</br>" + mfield[1] + ": " + data[i][mfield[1]])
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

function xychart(divChart, dbData, mfield, exlink, labels) {
    var tooltip = d3.select("body").append("div")
            .attr("class", "tooltip");

    var margin = {top: 20, right: 20, bottom: 30, left: 40};

    var width = $("#" + divChart).width() - margin.left - margin.right,
            height = (width * 3 / 7) - margin.top - margin.bottom;

    var radius = 5,
            padding = 1,
            alpha_X = 1;

    var force = d3.layout.force()
            .charge(-50)
            .gravity(0)
            .chargeDistance(20)
            .size([width, height]);

    var color = d3.scale.category10();

    var svg = d3.select("#" + divChart).append("svg")
            .attr("width", width + margin.left + margin.right)
            .attr("height", height + margin.top + margin.bottom)
            .attr("transform", "translate(" + margin.left + "," + margin.top + ")");

    var gradient = svg.append("linearGradient")
            .attr("y1", "100%")
            .attr("y2", "0%")
            .attr("x1", "0%")
            .attr("x2", "100%")
            .attr("id", "gradient")
            .attr("spreadMethod", "pad");

    gradient.append("stop")
            .attr("offset", "0%")
            .attr("stop-color", "#0F0");

    gradient.append("stop")
            .attr("offset", "50%")
            .attr("stop-color", "#FF0");

    gradient.append("stop")
            .attr("offset", "100%")
            .attr("stop-color", "#F00");

    svg.append("svg:rect")
            .attr("width", width + margin.left + margin.right)
            .attr("height", height + margin.top + margin.bottom)
            .style("fill", "url(#gradient)");

    d3.json(dbData, function (data) {
        var maxX = d3.max(data, function (d) {
            return d[mfield[1]];
        });

        var maxY = d3.max(data, function (d) {
            return d[mfield[0]];
        });

        var xPos = d3.scale.linear()
                .domain([0, maxX])
                .range([0, width]);

        var yPos = d3.scale.linear()
                .domain([0, maxY])
                .range([height, 0]);

        // Axis 
        var xAxis = d3.svg.axis()
                .scale(xPos)
                .orient("bottom");

        var yAxis = d3.svg.axis()
                .scale(yPos)
                .orient("left");

        // Set initial positions
        data.forEach(function (d) {
            d.x = xPos(d[mfield[1]]) - radius;
            d.y = yPos(d[mfield[0]]) + radius;
            d.radius = radius;
        });


        svg.append("g")
                .attr("transform", "translate(" + margin.left + "," + (height + margin.top) + ")")
                .attr("class", "axis")
                .call(xAxis)
                .append("text")
                .attr("x", width)
                .attr("dy", "-1em")
                .style("text-anchor", "end")
                .text("Likelihood");
        ;

        svg.append("g")
                .attr("transform", "translate(" + margin.left + "," + margin.top + ")")
                .attr("class", "axis")
                .call(yAxis)
                .append("text")
                .attr("transform", "rotate(-90)")
                .attr("y", 8)
                .attr("dy", "1em")
                .style("text-anchor", "end")
                .text([mfield[0]]);

        var text = svg.selectAll("text.node")
                .data(data).enter()
                .append("svg:text")
                .text(function (d) {
                    return d.name;
                })
                .attr("opacity", function (d) {
                    if (labels) {
                        return "1";
                    }
                    else {
                        return "0";
                    }
                });


        var node = svg.selectAll("circle.node")
                .data(data).enter()
                .append("a")
                .attr("xlink:href", function (d) {
                    return exlink + d.id;
                })
                .append("svg:circle")
                .attr("r", function (d) {
                    return radius;
                })
                .attr("class", "circle")
                .attr("fill", function (d) {
                    return color(d[mfield[0]]);
                })
                //                            .style("opacity", 0.5)
                .call(force.drag)
                .on("mouseover", function (d, i) {
                    tooltip.transition()
                            .duration(200)
                            .style("opacity", 1);
                    tooltip.html(
                            "Name: " + data[i].name +
                            "</br>" + mfield[0] + ": " + data[i][mfield[0]] +
                            "</br>" + mfield[1] + ": " + data[i][mfield[1]])
                            .style("left", (d3.event.pageX) + "px")
                            .style("top", (d3.event.pageY - 40) + "px");
                })
                .on("mouseout", function (d) {
                    tooltip.transition()
                            .duration(500)
                            .style("opacity", 0);
                })
                ;

        force
                .nodes(data)
                .on("tick", tick)
                .start();


        function tick(e) {
            node.each(moveTowardDataPosition(e.alpha));
            node.each(collide(e.alpha));
            node
                    .attr("cx", function (d) {
                        return d.x + margin.left;
                    })
                    .attr("cy", function (d) {
                        return d.y + margin.top;
                    })
                    ;
            text
                    .attr("x", function (d) {
                        return d.x + 3 + radius + margin.left;
                    })
                    .attr("y", function (d) {
                        return d.y + radius + margin.top;
                    });
        }

        function moveTowardDataPosition(alpha) {
            return function (d) {
                d.x += (xPos(d[mfield[1]]) - d.x) * alpha_X * alpha;
                d.y += (yPos(d[mfield[0]]) - d.y) * alpha_X * alpha;
            };
        }

        function collide(alpha) {
            var quadtree = d3.geom.quadtree(data);
            return function (d) {
                var r = d.radius + r + padding,
                        nx1 = d.x - r,
                        nx2 = d.x + r,
                        ny1 = d.y - r,
                        ny2 = d.y + r;
                quadtree.visit(function (quad, x1, y1, x2, y2) {
                    if (quad.point && (quad.point !== d)) {
                        var x = d.x - quad.point.x,
                                y = d.y - quad.point.y,
                                l = Math.sqrt(x * x + y * y),
                                r = d.radius + quad.point.radius + (d.color !== quad.point.color) * padding;
                        if (l < r) {
                            l = (l - r) / l * alpha;
                            d.x -= x *= l;
                            d.y -= y *= l;
                            quad.point.x += x;
                            quad.point.y += y;
                        }
                    }
                    return x1 > nx2 || x2 < nx1 || y1 > ny2 || y2 < ny1;
                });
            };
        }

        if (labels) {
            svg.append("g")
                    .append("text")
                    .style("text-anchor", "start")
                    .style("font-weight", "bold")
                    .style("fill", "#666")
                    .attr("transform", "translate( 4, 12)")
                    .text("Label Off")
                    .on("click", function (d) {
                        if (text.attr("opacity") === "0") {
                            d3.select(this).text("Label Off");
                            text.transition()
                                    .duration(750)
                                    .attr("opacity", "1");
                        }
                        else {
                            d3.select(this).text("Label On");
                            text.transition()
                                    .duration(750)
                                    .attr("opacity", "0");
                        }
                        ;
                    });
        }

    });

}

function barchart(divChart, dbData, exlink, labels) {
    var tooltip = d3.select("body").append("div")
            .attr("class", "tooltip");

    var margin = {top: 20, right: 20, bottom: 30, left: 40};

    var width = $("#" + divChart).width() - margin.left - margin.right,
            height = (width * 3 / 7) - margin.top - margin.bottom;

    d3.json(dbData, function (data) {

        var max_n = 0;

        for (var d in data) {
            max_n = Math.max(data[d].likelihood, max_n);
        }
        ;

        var x = d3.scale.linear()
                .domain([0, max_n])
                .range([0, width]);
        // Axis 
        var xAxis = d3.svg.axis()
                .scale(x)
                .orient("bottom");

        d3.select(".chart")
                .selectAll("div")
                .data(data)
                .enter().append("div")
                .style("width", function (d) {
                    return x(d.likelihood) + "px";
                })
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
                })
                .text(function (d) {
                    return d.name;
                });
    });
}