// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require_tree .
//require turbolinks

$.Isotope.prototype._getCenteredMasonryColumns = function () {

    this.width = this.element.width();

    var parentWidth = this.element.parent().width();

    var colW = this.options.masonry && this.options.masonry.columnWidth || // i.e. options.masonry && options.masonry.columnWidth

        this.$filteredAtoms.outerWidth(true) || // or use the size of the first item

        parentWidth; // if there's no items, use size of container

    var cols = Math.floor(parentWidth / colW);

    cols = Math.max(cols, 1);

    this.masonry.cols = cols; // i.e. this.masonry.cols = ....
    this.masonry.columnWidth = colW; // i.e. this.masonry.columnWidth = ...
};

$.Isotope.prototype._masonryReset = function () {

    this.masonry = {}; // layout-specific props
    this._getCenteredMasonryColumns(); // FIXME shouldn't have to call this again

    var i = this.masonry.cols;

    this.masonry.colYs = [];
    while (i--) {
        this.masonry.colYs.push(0);
    }
};

$.Isotope.prototype._masonryResizeChanged = function () {

    var prevColCount = this.masonry.cols;

    this._getCenteredMasonryColumns(); // get updated colCount
    return (this.masonry.cols !== prevColCount);
};

$.Isotope.prototype._masonryGetContainerSize = function () {

    var unusedCols = 0,

        i = this.masonry.cols;
    while (--i) { // count unused columns
        if (this.masonry.colYs[i] !== 0) {
            break;
        }
        unusedCols++;
    }

    return {
        height: Math.max.apply(Math, this.masonry.colYs),
        width: (this.masonry.cols - unusedCols) * this.masonry.columnWidth // fit container to columns that have been used;
    };
};

$(function() {
    $('#stories').imagesLoaded( function(){
        $('#stories').isotope({
            itemSelector: '.story'
        });
    });

//    filter city
    var stories = $('#stories')
    stories.isotope({
        itemSelector: '.story'
    });
    $('#filters_city select').change(function() {
        var filters = $(this).val();
        stories.isotope({
            filter: filters
        });
    });

    $(".send_mail").click(function(){
        $('#report').modal('hide');
        $('#feedback').modal('hide');
        $.post('/send_mail/report', function(){
        });
    });

    $('#cities').select2();

    $(".alert").fadeOut(5000);

//    var coordinate = $('#map'),
//        latitude = coordinate.data('latitude'),
//        longitude = coordinate.data('longitude'),
//        action = coordinate.data('action');
//    var map = new GMaps({
//        el: '#map',
//        lat: latitude[0],
//        lng: longitude[0],
//        zoom: 14
//
//    });
//
//
//    for (i = 0; i < latitude.length; i++){
//        map.addMarker({
//            lat: latitude[i],
//            lng: longitude[i]
//        });
//    }
//
//    GMaps.geolocate({
//        success: function(position){
//
//            if (action == 'index'){
//                map.setCenter(position.coords.latitude, position.coords.longitude);
//                map.addMarker({
//                    lat: position.coords.latitude,
//                    lng: position.coords.longitude,
//                    title: 'You are here.',
//                    infoWindow: {
//                        content: '<p>你在這邊!</p>'
//                    }
//                });
//            }
//            else if (action == 'show'){
//                map.setCenter(latitude[0], longitude[0]);
//                map.fitZoom(latitude[0], longitude[0]);
//                map.addMarker({
//                    lat: latitude[0],
//                    lng: longitude[0]
//                });
//            }
//        },
//        error: function(error){
//            alert('Geolocation failed: '+error.message);
//        },
//        not_supported: function(){
//            alert("Your browser does not support geolocation");
//        }
//    });


});

$(window).load(function(){
    $('#slogan').modal('show');
});