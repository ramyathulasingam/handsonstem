// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require angular
//= require twitter/bootstrap
//= require turbolinks
//= require_tree .



var myApp = angular.module('myApp', []);

myApp.controller('SearchController', ['$scope', '$http', function($scope, $http) {
    
    function shuffle(array) {
      var currentIndex = array.length, temporaryValue, randomIndex ;
      

      // While there remain elements to shuffle...
      while (0 !== currentIndex) {

        // Pick a remaining element...
        randomIndex = Math.floor(Math.random() * currentIndex);
        currentIndex -= 1;

        // // And swap it with the current element.
        // temporaryValue = array[currentIndex];
        // array[currentIndex] = array[randomIndex];
        // array[randomIndex] = temporaryValue;
        if (randomIndex % 1 === 0) {
            array[randomIndex].friendliness = ((Math.random() % 100) * 100).toFixed(0);
        }
      }

      return array;
    }
    
    $http.get('workshops/get_data').success(function(data) {
        $scope.events = data;
        $scope.events = shuffle($scope.events);
        $('.card-height').matchHeight();
    });
    
    $scope.likeItem = function(item) {
        if (item.liked) {
            item.friendliness = Math.floor(item.friendliness) - 1; 
        } else {
            item.friendliness = Math.floor(item.friendliness) + 1; 
        }
        item.liked = !item.liked;
        

    }
  
  

}]);
