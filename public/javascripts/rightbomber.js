// Generated by CoffeeScript 1.3.3
(function() {
  var Rightbomber,
    __bind = function(fn, me){ return function(){ return fn.apply(me, arguments); }; };

  Rightbomber = (function() {

    function Rightbomber() {
      this.run = __bind(this.run, this);
      console.log('init');
    }

    Rightbomber.prototype.run = function() {
      return console.log('run');
    };

    return Rightbomber;

  })();

  (new Rightbomber).run;

}).call(this);
