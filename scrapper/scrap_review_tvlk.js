// ==UserScript==
// @name         Traveloka Get 5 Reviews
// @namespace    https://www.traveloka.com/hotel/indonesia/*
// @version      0.1
// @description  ngambil review dari tiap hotel, bisanya 5 doang tapi
// @author       Teresa
// @match        https://www.traveloka.com/hotel/indonesia/*
// @grant        none
// ==/UserScript==

(function() {
    'use strict';
    const list = window.staticProps.reviewSummary.reviewList;
    let reviews = "";
    for (var i in list) {
        reviews += list[i].reviewText;
        reviews += "\n";
    }
    var url = "https://pranyoto.sisdis.ui.ac.id/houtell/scrapper/add.php";

    var data = new FormData();
    data.append('txt', reviews);

    var xhr = new XMLHttpRequest();
    xhr.open('POST', url, true);
    xhr.onload = function () {
        close();
    };
    xhr.send(data);
})();