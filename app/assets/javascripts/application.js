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

    $(".alert").fadeOut(5000)

//    var map = new GMaps({
//        div: '#map',
//        lat: -12.043333,
//        lng: -77.028333
//    });
//
//    GMaps.geolocate({
//        success: function(position) {
//            map.setCenter(position.coords.latitude, position.coords.longitude);
//        },
//        error: function(error) {
//            alert('Geolocation failed: '+error.message);
//        },
//        not_supported: function() {
//            alert("Your browser does not support geolocation");
//        },
//        always: function() {
//            alert("Done!");
//        }
//    });

    var map = new GMaps({
        el: '#map',
        lat: 121.5598345,
        lng: 25.091075
    });


    GMaps.geolocate({
        success: function(position){
            map.setCenter(position.coords.latitude, position.coords.longitude);

            map.addMarker({
                lat: position.coords.latitude,
                lng: position.coords.longitude,
                title: 'You are here.',
                infoWindow: {
                    content: '<p>You are here!</p>'
                }
            });
        },
        error: function(error){
            alert('Geolocation failed: '+error.message);
        },
        not_supported: function(){
            alert("Your browser does not support geolocation");
        }
    });

});

$(window).load(function(){
    $('#slogan').modal('show');
});